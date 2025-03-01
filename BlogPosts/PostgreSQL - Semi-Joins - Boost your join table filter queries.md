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
-------------------------------------------------------------------------------------------------------------------------------
 Hash Join  (cost=38647.00..85591.01 rows=1000000 width=33) (actual time=229.004..683.988 rows=1000000 loops=1)
   Hash Cond: (blogs.author_id = authors.id)
   ->  Seq Scan on blogs  (cost=0.00..28692.00 rows=1000000 width=4) (actual time=0.015..61.899 rows=1000000 loops=1)
   ->  Hash  (cost=18334.00..18334.00 rows=1000000 width=37) (actual time=228.572..228.573 rows=1000000 loops=1)
         Buckets: 65536  Batches: 32  Memory Usage: 2717kB
         ->  Seq Scan on authors  (cost=0.00..18334.00 rows=1000000 width=37) (actual time=0.011..60.541 rows=1000000 loops=1)
 Planning Time: 0.896 ms
 Execution Time: 701.660 ms
(8 rows)
```

**Aah, will you accept, 701.660ms 