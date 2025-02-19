---
tags:
  - SystemDesign
  - Cloud
---
### Config Map

Used to store config related ENV values inside the K8s cluste.
-> Used for non confidential data in key-value pairs.
-> Decouple env specific config from container images.

The config maps can be consumed inside the pods as ENVs or as properties file by mapping the volume for the config.

#### Example
-> Configuring
```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: example-configmap
data:
  key1: value1
  key2: value2
```

-> Using inside the pods,
As ENV variables,
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: example-pod
spec:
  containers:
    - name: example-container
      image: nginx
      envFrom:
        - configMapRef:
            name: example-configmap
```