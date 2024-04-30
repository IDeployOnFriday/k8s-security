TODO

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
