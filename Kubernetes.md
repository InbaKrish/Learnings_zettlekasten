---
tags:
  - SystemDesign
Reference:
  - https://www.youtube.com/watch?v=X48VuDVv0do&t=2s
---

Container orchestration, provides high availability, scalability and disaster recovery

### Nodes
physical/virtual machine which handles the pods runtime, networking, and other services.
Components of node - [[Kubelet]], [[Kube-proxy]], [[Container Runtime]]

### Pods

Smallest deployable unit in Kubernetes. 
-> Can have 1 to n number of containers inside a single pod (usually 1 application per pod), which communicates over localhost.
-> Each pod gets its own IP
-> Each containers insider the pod shares volumes configured.
-> Pods are ephemeral - pods are easy to be replaced/displaced. 

![[Pasted image 20250219193628.png]]

