---
tags:
  - SystemDesign
  - Cloud
---
Component of [[Kubernetes]]

### Deployment

-> Blue print to manage the replicas of the pods in different nodes to avoid downtimes.
![[Pasted image 20250223151329.png]]

### Stateful Set

Certain pods can't be replicated via the deployment configs, as they depend on some stateful dependencies (like the data storage for DB pods).
