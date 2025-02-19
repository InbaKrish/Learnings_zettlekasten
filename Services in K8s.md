---
tags:
  - SystemDesign
  - Cloud
---
Key component of [[Kubernetes]]

### Services

Abstraction config for the pods and a policy to access them, as the pods are ephemeral and the IP gets changed often.
-> It provides stable endpoint for the accessing of the pods for the internal and external requests.

Types of Services include,

[[ClusterIP]]  - Exposes the internal IP of a 