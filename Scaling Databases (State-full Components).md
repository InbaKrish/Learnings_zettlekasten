---
tags:
  - SystemDesign/Databases
---
## Vertical Scaling

-> Adding more CPU, RAM, storage (scaling), the same database.
-> Requires downtime to restart post vertical scale.
-> Contains physical hardware limitation.

## Horizontal Scaling

[[Read Replica]]
[[Sharding]] & [[Partitioning]]

|                           | **No Sharding (0)**(Single DB)                                                                                                                                    | **With Sharding (1)**(Multiple DBs/Replicas)                                                                                                                                                                                                 |
| ------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **No Partitioning (0)**   | **(0,0):** A single PostgreSQL server with a monolithic schema where all data is stored in one table. This is the simplest setup.                                 | **(1,0):** Multiple databases each holding a complete copy of the dataset (like read replicas) for load balancing reads.                                                                                                                     |
| **With Partitioning (1)** | **(0,1):** A single PostgreSQL server that uses table partitioning (e.g., range or hash partitioning) to split a large table into smaller, more manageable parts. | **(1,1):** A distributed setup where data is sharded across multiple PostgreSQL servers and each shard uses table partitioning (e.g., using Citus for horizontal partitioning across nodes, with each shard further partitioned internally). |

