---
tags:
  - SystemDesign
  - Stream
  - DataDriven
---
### Event
Trggeri, notification, when-ness

State - stores the data for current representation, small size, stored as JSON or protocal buffers.

### Kafka Broker
Server listens and communicates between producer and consumer via topic.
![[Pasted image 20241202211932.png]]

Producer pushes the messages to the topic, and consumer polls the message using position pointer.
![[Pasted image 20241202213225.png]]

### Partitions
Splitting up the topic to store large data based on certain criteria.
![[Pasted image 20241204203019.png]]

### Consumer Group
![[Pasted image 20241204205452.png]]
Used to parallel process the messages from a topic by assigning a consumer to a partition.

