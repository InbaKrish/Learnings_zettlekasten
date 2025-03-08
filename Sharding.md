---
tags:
  - SystemDesign/Databases
---
Split data into multiple sub-sets (shards). Writes will be shared across shards (based on the shard condition).

-> Distribute data across multiple machines

![[Pasted image 20250308133723.png]]

Each database is thus  a Shard and the data we say is partitioned (split across).

**Note**  - Cross shard queries are expensice,

