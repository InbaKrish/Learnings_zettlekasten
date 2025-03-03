---
tags:
  - SystemDesign/Databases
---
## Repeatable Reads

-> Repeat same read value under a transaction even if the value gets updated (committed), in a parallel transaction.
## Read Committed

-> Within a transaction the updated value gets read, if any parallel transaction commits the update. So there may be inconsistent reads within a transaction based on parallel transaction commits.
## Read Uncommitted (Dirty reads)

-> Reads uncommitted values updated in other parallel transactions.
