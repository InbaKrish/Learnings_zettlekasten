---
tags:
  - SystemDesign
  - Cloud
---
Assigns the newly created pods to the respective available worker nodes based on the resource availability and the policies.

![[Pasted image 20250223155505.png]]

Note the [[Kubelet]] starts the pod, whereas the scheduler manage's the pod's node assignment.