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

Each kafka broker holds n number of partitions and each of these can either be a leader/replica for each topic. All read & writes of the topic goes through the leader. 

**Leader** is a role asssigned to a partition under a broker like in this example,
-> For partition 0 Broker 1 is the leader,
-> For p1 b2
-> For p2 b3
![[Pasted image 20241210210908.png]]

Producer writes to a single leader and it replicates to the follower replicas.
![[Pasted image 20241210212310.png]]

[[Zookeeper]] / [[Kraft]] manages the metadata for leader management, like if any of the broker goes down, it manages and elects the next leader for the partitions.

Having single leader per broker acts as a load balancing strategy, increasing the throughput.

### Replication
During broker, topic and partitions setup based on the `replication_factor`, it determines the partition split. (`replication_factor = 1` means no replication - each partitions are spread across the available brokers)

Say TestTopic with 2 brokers (b1, b2) with 4 partitions (p0,p1,p2,p3),
-> For replication_factor = 1,
	-> b1 hold p0, p1
	-> b2 hold p2, p3
-> For replication_factor = 2 (each partition is replicated on both brokers)
	-> p0, p2 - leader on b1, replica on b2
	-> p1, p3 - leader on b2, replica on b1

in this scenario the consumer group will act like,
**Consumer Group A**:
- 2 consumers (`C1`, `C2`).
- Kafka ensures that **all partitions are assigned** across the consumers:
    - `C1` reads from partitions `P0` and `P1`.
    - `C2` reads from partitions `P2` and `P3`.

**Consumer Group B**:
- 4 consumers (`C1`, `C2`, `C3`, `C4`).
- Kafka can assign **one partition per consumer**:
    - `C1` reads from `P0`.
    - `C2` reads from `P1`.
    - `C3` reads from `P2`.
    - `C4` reads from `P3`.


### Consumer Group
![[Pasted image 20241204205452.png]]
Used to parallel process the messages from a topic by assigning a consumer to a partition.

With Consumer Group we can have Kafka be
-> used as a queue if we have all consumers in one group and assigned to a topic so that no other consumer group exists and the read gets duplicated (mock queue)
-> serve as pub/sub if we have consumers in unique groups

