---
tags:
  - SystemDesign/Databases
---
-> Understand what type of data we are storing
-> How much data we are storing
-> How the data will be accessed
-> What kind of queries will be triggered (based on the logic)
-> Any special feature we expect

## Examples

1. Data can fit in **single node**, data consistency and correctness - go with relational databases (ACID)
2. **Single node**, complex queries - relational databases
3. Key value based access, really fast access - Redis
4. Advances data structures & algos - Redis
5. Cannot fit in one node, 