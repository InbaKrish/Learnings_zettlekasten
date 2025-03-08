---
tags:
  - SystemDesign/Databases
---
Database for Graph data structure.

-> Stores data that are represented as nodes, edges and relations.
-> Great for running complex graph based algorithms.

We can do the relations using the [[Relational DB]], but when the size of the data increases and hence the index size which makes the search time complexity to `O (log n)`. Where as the graph DB, maintains the pointers between the relations using the disk addresses, which makes the lookup faster at `O (1)`. 


Examples - [[Neo4J]], [[DGraph]], [[Neptune]]