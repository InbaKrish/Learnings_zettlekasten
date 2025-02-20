---
tags:
  - SystemDesign
  - Cloud
---
Components of [[Kubernetes]]
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

Mounted volume,
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: example-pod
spec:
  containers:
    - name: example-container
      image: nginx
      volumeMounts:
        - name: config-volume
          mountPath: /etc/config
  volumes:
    - name: config-volume
      configMap:
        name: example-configmap
```


### Secrets

Similar to configmap, but the values are encrypted. 

	By default the encryption is not followedm and is stored as plain values.

By utilizing ConfigMaps and Secrets, Kubernetes enables the separation of configuration data from application code, enhancing security and flexibility in managing containerized applications.

![[Pasted image 20250219202827.png]]

