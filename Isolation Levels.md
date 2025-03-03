---
tags:
  - SystemDesign/Databases
---
## Repeatable Reads

-> Repeat same read value under a transaction even if the value gets updated (committed), in a parallel transaction.
## Read Committed

-> Within a transaction the updated value gets read, if any parallel transaction commits the update. So there may be inconsistent reads within a transaction based on parallel transaction commits.

**PostgreSQL's default**
## Read Uncommitted (Dirty reads)

-> Reads uncommitted values updated in other parallel transactions.

**Note: Not supported in Postgresql**
## Serializable (Stritght)

Locks the read of a row on other transactions, until the transaction gets committed/rolled back.