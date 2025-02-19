---
tags:
  - SystemDesign
  - Cloud
---
Key components of [[Kubernetes]]

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
