# Observability Under Istio Service Mesh


## Enabling Kiali/Grafana/Jaegar

```
$ cd istio-1.11.2/samples/addons

$ kubectl apply -f prometheus.yaml
$ kubectl apply -f jaeger.yaml
$ kubectl apply -f grafana.yaml
$ kubectl apply -f kiali.yaml
```


## Access Service Outside 

### Jaegar

```
kubectl patch service tracing --patch '{"spec":{"type":"LoadBalancer"}}' -n istio-system
```

### grafana

```
kubectl patch service grafana --patch '{"spec":{"type":"LoadBalancer"}}' -n istio-system
```

### kiali

```
kubectl patch service kiali --patch '{"spec":{"type":"LoadBalancer"}}' -n istio-system
```









