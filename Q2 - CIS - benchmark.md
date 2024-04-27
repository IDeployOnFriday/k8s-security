# Create a Default Deny Network Policy

 using link - https://kubernetes.io/docs/concepts/services-networking/network-policies/

6  kubectl config use-context acgk8s
7  vi /home/cloud_user/default-deny.yml
8  k apply -f /home/cloud_user/default-deny.yml
9  vi /home/cloud_user/mtdoom-np.yml
10  k get pod mtdoom -n mordor
11  k get pod mtdoom -n mordor -o yaml
12  k get pod mtdoom -n mordor -o yamlq
13  vi /home/cloud_user/mtdoom-np.yml
14  k apply -f /home/cloud_user/mtdoom-np.yml
15  history
cloud_user@k8s-cli

```
 vi /home/cloud_user/default-deny.yml
```

```agsl
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: default-deny
  namespace: mordor
spec:
  podSelector: {}
  policyTypes:
  - Ingress
```

# Create a Network Policy to Allow Specific Traffic

```agsl
//chceck labels for pod and namespace 
kubectl get pod mtdoom -n mordor --show-labels

kubectl get namespace frodo --show-labels
```
```agsl
 vi /home/cloud_user/mtdoom-np.yml
```
```
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: mtdoom-np
  namespace: mordor
spec:
  podSelector:
    matchLabels:
      app: mtdoom
  policyTypes: ["Ingress"]
  ingress:
  - from:
    - namespaceSelector:
        matchLabels:
          app: frodo
    - podSelector:
        matchLabels:
          app: sam
    ports:
    - protocol: TCP
      port: 80
```

