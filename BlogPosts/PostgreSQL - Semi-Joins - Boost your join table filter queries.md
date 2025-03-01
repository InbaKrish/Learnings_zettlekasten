---
tags:
  - PostgreSQL
title: PostgreSQL - Semi-Joins - Boost your join table filter queries
date: 2025-03-25
draft: "false"
---
Think about you have two tables author and blogs, now I need to perform the operation to find out authors without any blogs, so known approach is that we perform left join between the author and blogs and perform filter query to find rows from author table without and matching blog items.

This works, but think twice, in this operation do we need to perform entire table left join to get the filter query (though Postgres handle the join efficiently with the planner). 