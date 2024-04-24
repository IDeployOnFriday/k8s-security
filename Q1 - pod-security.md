
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



  