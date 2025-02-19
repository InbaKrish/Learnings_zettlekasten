---
tags:
  - SystemDesign
  - Cloud
---


[[Ingress]] is handled via the Ingress controller, using a [[Load Balance]] or a [[Proxy Server]]. Based on the configuration done for the ingress rules.
-> Processes the ingress resources. 

**Example of an Ingress Resource**:

Assume you have two Services, `service-a` and `service-b`, and you want to route traffic based on the URL path. You can define an Ingress resource:

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: example-ingress
spec:
  rules:
    - http:
        paths:
          - path: /service-a
            pathType: Prefix
            backend:
              service:
                name: service-a
                port:
                  number: 80
          - path: /service-b
            pathType: Prefix
            backend:
              service:
                name: service-b
                port:
                  number: 80
```

With this configuration, requests to `http://<Ingress-IP>/service-a` are routed to `service-a`, and requests to `http://<Ingress-IP>/service-b` are routed to `service-b`.

To use the Ingress resources, [[Ingress Controller]] needs to be deployed in the cluster.

Popular ingress controllers include [[Nginx]], [[Traefik]], [[HAProxy]]



