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

| JOIN    | SEMI JOIN |
| ------- | --------- |
| 148.116 |           |