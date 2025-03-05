---
tags:
  - SystemDesign/Databases
---

-> When read:write = 90:10 (say)
-> Move read operations to another database (read replica)
-> Application (API servers) should know which DB to connect for the logics (Read/Write).

1. Synchronous Replication 
	1. Slower writes but Strong consistent.
2. Asynchronous Replication
	1. Faster writes but eventual consistent.

To distribute the read load across the replica, we need to use tools like [[PgPool]], [[HAProxy]].
