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

[[ClusterIP]]  - Exposes the internal IP via service, and accessible within the cluster. (Default type)
[[NodePort]]  - Maps the port from external to internal (within node). `<NodeIP>:<NodePort>`

#### Example
```yaml
apiVersion: v1
kind: Service
metadata:
  name: example-service
spec:
  selector:
    app: example-app
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
      nodePort: 30007
  type: NodePort
```

In this configuration, the Service routes external traffic from port 30007 on any node to port 80 of the selected Pods.

![[Pasted image 20250219200457.png]]