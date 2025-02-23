---
tags:
  - SystemDesign
  - Cloud
---
Component of the [[Kubernetes]]. 

Central management entity to oversee the entire clusters' operations. It ensures that the cluster maintains the desired state by coordinating all activities, including scheduling, scaling, and updating applications.

Contains the below processes,
1. [[API server - K8s]]
2. [[Scheduler - K8s]]
3. [[Controller Manager - K8s]]
4. [[etcd - K8s]]

A cluster can have multiple master nodes.
