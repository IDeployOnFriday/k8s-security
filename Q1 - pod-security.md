
# describe the role binding 
```
kubectl get rolebinding -n sunnydale -o yaml 
```

# edit the role 
```
kubectl edit role -n sunnydale buffy-role
```

```
 rules:
 - apiGroups:
   - ""
   resources:
   - 'pods'
   verbs:
   - 'list'
   ```

   # Create a New Role and Attach It to the Service Account

   ```
   vi /home/cloud_user/watch-services-secrets.yml
   ```
   ```
   rules:
- apiGroups: [""]
  resources: ["services", "secrets"]
  verbs: ["watch"]
  ```

# bind the service account to the role 





# Fix a Pod Configured to Use an Incorrect Service Account

## Delete the existing ServiceAccount from this namespace.

```
 k get sa -n bespin
 k delete sa lando -n bespin
```

##  Create a new ServiceAccount called lando-sa.
```
k create sa --help
kubectl create serviceaccount lando-sa -n bespin
```
    
    
## Configure the Pod to use the lando-sa ServiceAccount.

```
   11  vi /home/cloud_user/lando.yml
   12  k apply -f /home/cloud_user/lando.yml
```


  
