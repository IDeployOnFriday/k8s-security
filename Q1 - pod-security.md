
# describe the role binding 
```
kubectl get rolebinding -n sunnydale
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