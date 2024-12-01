---
tags:
  - CPU
Reference:
  - https://www.youtube.com/watch?v=M9HHWFp84f0
---
Basic unit of CPU utilization. Programming way to say the OS to perform certain parts of a task can be handled concurrently.

[[Process]] - runs the application.

Each procees contains the following components,

![[Pasted image 20241201211334.png]]

Program counter handle the program control. Having single program counter handle only one process at a time. 

Instead have multiple program counters under a process, and also stacks and other address components
![[Pasted image 20241201211858.png]]

Example of how OS handles processes and thread.
![[Pasted image 20241201212004.png]]

