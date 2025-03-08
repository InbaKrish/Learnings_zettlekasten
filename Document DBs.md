---
tags:
  - SystemDesign/Databases
---
-> Mostly  closest to relational databases.
-> Mostly JSON based. 
-> Supports complex queries (like aggregations).
-> Partial updates to document is possible.
	say I have a doc - `{ "user_id" : 123, "total_posts" : 300 }`, in this case we can do, `total_posts += 1 for user_id = 123`, this just updates the `total_posts` value without entire document re-write.

**Applications** - in-app notifications, 

Examples - [[MongoDB]], [[ElasticSearch]]