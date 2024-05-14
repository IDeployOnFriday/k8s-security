
# overview 
The CIS kubernetes benchmark is a set of standards and best practices for a secure kubernetes cluster 

tools like kube-bench automatically check your cluster to see if it conforms to the kubernetes benchmark standards and generates a report 


# 1. Fix CIS Benchmark Issues Detected for kubelet

```
ssh k8s-control
```

```
sudo vi /var/lib/kubelet/config.yaml
```

update yaml 
```
apiVersion: kubelet.config.k8s.io/v1beta1
authentication:
    anonymous:
      enabled: false
    webhook:
      cacheTTL: 0s
      enabled: true
    x509:
      clientCAFile: /etc/kubernetes/pki/ca/crt
 authorization:
    mode: Webhook
```

restart kubelet 
```
sudo systemctl restart kubelet
sudo systemctl status kubelet
```

2. Fix CIS Benchmark Issues Detected for kube-apiserver

```
sudo vi /etc/kubernetes/manifests/kube-apiserver.yaml
```

turn off profiling 

```
spec:
  containers:
  - command:
    - kube-apiserver
    - --profiling=false
```

Change the authorization mode from AlwaysAllow to Node, RBAC

```
spec:
  containers:
  - command:
    - kube-apiserver
    - --profiling=false
    - --advertise-address=10.0.1.101
    - --allow-privileged=true
    - --authorization-mode=Node,RBAC
```

check everything works 
```
kubectl get nodes
```


# Fix CIS Benchmark Issues Detected for etcd


```
sudo mv /etc/kubernetes/manifests/etcd.yaml  /etc/kubernetes/
```

edit the file 
```
sudo vi /etc/kubernetes/etcd.yaml
```

it should now looks like this 

```
spec:
  containers:
  - command:
    - etcd
    - --advertise-client-urls=https://10.0.1.101:2379
    - --cert-file=/etc/kubernetes/pki/etcd/server.crt
    - --client-cert-auth=true
```

```
sudo mv /etc/kubernetes/etcd.yaml  /etc/kubernetes/manifests/
```kubectl get pods -n kube-system

check everything works 

```
kubectl get pods -n kube-system
```
