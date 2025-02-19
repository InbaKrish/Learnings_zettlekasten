---
tags:
  - SystemDesign
  - Cloud
---
Key components of [[Kubernetes]]

### Ingress

[[Services in K8s]] takes care of exposing the application at the network layer. The **Ingress** provides the HTTP/HTTPS routing to [[Services in K8s]] withing the cluster.

We can configure the rules in the ingress to routing the external traffic to internal services, say based on the hostname or path, etc,.

