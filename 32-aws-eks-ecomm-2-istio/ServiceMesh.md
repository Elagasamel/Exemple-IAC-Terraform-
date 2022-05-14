# INSTALLATION ISTIO Linux or macOS

Download ISTIO V 1.11.2 for kubernetes 1.21

curl -L https://istio.io/downloadIstio | ISTIO_VERSION=1.11.2  sh -

cd istio-1.11.2/


export PATH=$PWD/bin:$PATH


istioctl install

## Verify 

kubectl -n istio-system get deploy



## Enabling Kiali/Grafana/Jaegar

cd istio-1.11.2/samples/addons

kubectl apply -f prometheus.yaml

kubectl apply -f jaeger.yaml

kubectl apply -f grafana.yaml

kubectl apply -f kiali.yaml



### Access Service Outside 

## Jaegar

kubectl patch service tracing --patch '{"spec":{"type":"LoadBalancer"}}' -n istio-system




## grafana

kubectl patch service grafana --patch '{"spec":{"type":"LoadBalancer"}}' -n istio-system




## kiali

kubectl patch service kiali --patch '{"spec":{"type":"LoadBalancer"}}' -n istio-system










