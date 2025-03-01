---
tags:
  - PostgreSQL
title: PostgreSQL - Semi-Joins - Boost your join table filter queries
date: 2025-03-25
draft: "false"
---
Think about you have two tables author and blogs, 
```sql
-- Authors table
CREATE TABLE authors(
	id serial primary key,
	name character varying unique
);

-- populate authors table with random unique values
INSERT INTO authors (name)
    SELECT md5(random()::text)
    FROM generate_series(1, 1000000);


-- Blogs table
CREATE TABLE blogs(
	id serial primary key,
	author_id integer references authors (id),
	name character varying unique
);

-- randomly matching blogs to different authors, each can have 0/n number of blogs associated
INSERT INTO blogs (author_id, name)
	SELECT floor(random() * 300000 + 1)::int, md5(random()::text)
	FROM generate_series(1, 1000000);

-- add index for foreign key
CREATE INDEX blogs_author_id ON blogs(author_id);
```


now I need to perform the operation to find out authors without any blogs, so known approach is that we perform left join between the author and blogs and perform filter query to find rows from author table without and matching blog items.

This works, but think twice, in this operation do we need to perform entire table left join to get the filter query (though PostgreSQL handle the join efficiently with the planner). 

---
## Performance Battle (Joins vs Semi-Joins)

Let's start with familiar inner join,
```sql
select authors.name from authors inner join blogs on blogs.author_id = authors.id;
```

-> [Explain analyze](https://www.postgresql.org/docs/current/sql-explain.html) provides the following plan,
```sql
explain analyze select authors.name from authors inner join blogs on blogs.author_id = authors.id;
                                                                    QUERY PLAN                                                                     
---------------------------------------------------------------------------------------------------------------------------------------------------
 Merge Join  (cost=5.64..49642.51 rows=1000000 width=33) (actual time=0.044..135.106 rows=1000000 loops=1)
   Merge Cond: (authors.id = blogs.author_id)
   ->  Index Scan using authors_pkey on authors  (cost=0.42..34317.43 rows=1000000 width=37) (actual time=0.010..21.355 rows=300000 loops=1)
   ->  Index Only Scan using blogs_author_id on blogs  (cost=0.42..25992.42 rows=1000000 width=4) (actual time=0.031..47.850 rows=1000000 loops=1)
         Heap Fetches: 0
 Planning Time: 0.409 ms
 Execution Time: 151.686 ms
(7 rows)
```

Let's check the semi-join approach,
```sql
select authors.name from authors where exists (select 1 from blogs where blogs.author_id = authors.id);
```

-> And now, we get,
```sql
explain analyze select authors.name from authors where exists (select 1 from blogs where blogs.author_id = authors.id);
                                                                    QUERY PLAN                                                                     
---------------------------------------------------------------------------------------------------------------------------------------------------
 Merge Semi Join  (cost=6.23..49459.71 rows=237176 width=33) (actual time=0.053..111.667 rows=289288 loops=1)
   Merge Cond: (authors.id = blogs.author_id)
   ->  Index Scan using authors_pkey on authors  (cost=0.42..34317.43 rows=1000000 width=37) (actual time=0.009..19.703 rows=300000 loops=1)
   ->  Index Only Scan using blogs_author_id on blogs  (cost=0.42..25992.42 rows=1000000 width=4) (actual time=0.040..44.631 rows=1000000 loops=1)
         Heap Fetches: 0
 Planning Time: 0.415 ms
 Execution Time: 116.221 ms
(7 rows)
```

In this approach semi-join is performed, and the exists short-circuits the filter query as soon as the first matching row is found.

| JOIN (inner join) | SEMI JOIN (where exists) |
| ----------------- | ------------------------ |
| 148.116           | 116.073                  |
| 158.137           | 121.852                  |
| 139.534           | 112.830                  |
| 136.839           | 111.900                  |
| 143.235           | 115.967                  |
based on the above iterations, the **semi-join** performs **20%** faster than normal **join** on average.

Not ends here, in **INNER JOIN**, there is an obvious duplication issue, say author has more than one blog then the author name value gets duplicated, now to de-duplicate the results, we can perform the **DISTINCT** or the **GROUP BY** approach, so let's check the performances for those,

-> Using **DISTINCT**,
```sql
select distinct authors.name from authors inner join blogs on blogs.author_id = authors.id;

--- EXPLAIN ANALYZE OUTPUT
 Unique  (cost=204009.80..209009.80 rows=1000000 width=33) (actual time=1180.678..1540.446 rows=289288 loops=1)
   ->  Sort  (cost=204009.80..206509.80 rows=1000000 width=33) (actual time=1180.676..1480.833 rows=1000000 loops=1)
         Sort Key: authors.name
         Sort Method: external merge  Disk: 42096kB
         ->  Merge Join  (cost=4.33..49660.96 rows=1000000 width=33) (actual time=2.727..142.405 rows=1000000 loops=1)
               Merge Cond: (authors.id = blogs.author_id)
               ->  Index Scan using authors_pkey on authors  (cost=0.42..34317.43 rows=1000000 width=37) (actual time=0.006..23.055 rows=300000 loops=1)
               ->  Index Only Scan using blogs_author_id on blogs  (cost=0.42..25992.42 rows=1000000 width=4) (actual time=0.015..48.093 rows=1000000 loops=1)
                     Heap Fetches: 0
 Planning Time: 0.279 ms
 JIT:
   Functions: 6
   Options: Inlining false, Optimization false, Expressions true, Deforming true
   Timing: Generation 0.775 ms, Inlining 0.000 ms, Optimization 0.177 ms, Emission 2.443 ms, Total 3.396 ms
 Execution Time: 1550.252 ms
(15 rows)
```

**Bruh! 🫢**


