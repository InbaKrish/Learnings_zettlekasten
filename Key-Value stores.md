---
tags:
  - SystemDesign/Databases
---
-> Simple databases which follows key based access pattern and provides limited functionalities (like GET (key), DELETE (key), PUT(key, values))
-> Provides extreme scalability through [[Sharding]] & [[Partitioning]].
-> Does not support complex queries (aggregations).

**Applications** - to store any key based data like profile data, user data, messages, etc,.

**Note** - we can make any databases like relational or document based DBs to work as key value stores (as this is just an access pattern).
