---
tags:
  - SystemDesign/Databases
---
## Vertical Scaling

-> Adding more CPU, RAM, storage (scaling), the same database.
-> Requires downtime to restart post vertical scale.
-> Contains physical hardware limitation.

## Horizontal Scaling

### Read Replica

-> When read:write = 90:10 (say)
-> Move read operations to another database (read replica)
-> Application (API servers) should know which DB to connect for the logics (Read/Write).
