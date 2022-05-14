# RBAC - Authorization Policies

## To enable RBAC IN namespace - Disable / Deny Access to Namespace

```
$ kubectl apply -f 3-policies/allow-nothing.yml
```

Check in browser RBAC Denied 


## To allow only UI service and GET method
```
$ kubectl apply -f 3-policies/allow_ui_get.yml
```

## To allow only product service and GET method
```
$ kubectl apply -f 3-policies/allow-productservice_get.yml
```

## To allow only productreview service and GET method
```
$ kubectl apply -f 3-policies/allow-productreview.yml
```

