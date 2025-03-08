---
tags:
  - SystemDesign/Databases
Reference:
  - https://www.youtube.com/watch?v=6GebEqt6Ynk&t=59s
---
-> Understand what type of data we are storing
-> How much data we are storing
-> How the data will be accessed
-> What kind of queries will be triggered (based on the logic)
-> Any special feature we expect

## Examples

1. Data can fit in **single node**, data consistency and correctness - go with relational databases (ACID) (SQL Databases)
2. **Single node**, complex queries - relational databases
3. Key value based access, really fast access - Redis
4. Advances data structures & algos - [[Redis]]
5. Cannot fit in one node, having expertise in SQL, and data sharding is possible - relational DB
6. Cannot fit in one node, Simple key value based accessing - [[DynamoDB]], [[MongoDB]] (by storing key values in the doc).
7. Require graph algos - [[Graph Databases]]
8. Nothing specfic/relational, needs sharding (out of the box) making it future proof as the data grows larger - go for [[Document DBs]] like [[MongoDB]]