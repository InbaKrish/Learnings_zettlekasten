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

