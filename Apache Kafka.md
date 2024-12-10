---
tags:
  - SystemDesign
  - Stream
  - DataDriven
Reference:
  - https://sookocheff.com/post/kafka/kafka-in-a-nutshell/
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

Each kafka broker holds n number of partitions and each of these can either be a leader/replica for each topic. All read & writes of the topic goes through 
![[Pasted image 20241210210908.png]]

### Consumer Group
![[Pasted image 20241204205452.png]]
Used to parallel process the messages from a topic by assigning a consumer to a partition.

With Consumer Group we can have Kafka be
-> used as a queue if we have all consumers in one group and assigned to a topic so that no other consumer group exists and the read gets duplicated (mock queue)
-> serve as pub/sub if we have consumers in unique groups

