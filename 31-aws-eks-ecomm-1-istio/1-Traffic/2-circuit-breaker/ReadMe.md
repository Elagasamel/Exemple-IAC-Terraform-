# Testing Circuit Breaker

We will configure circuit breaking rules and then test the configuration by intentionally “tripping” the circuit breaker

## install fortio and test

Fortio is a microservices (http, grpc) load testing 

1) kubectl apply -f <(istioctl kube-inject -f samples/httpbin/sample-client/fortio-deploy.yaml)

2) export the pod 
 
export FORTIO_POD=$(kubectl get pods -l app=fortio -o 'jsonpath={.items[0].metadata.name}')

3) Log in and use the fortio tool to call productreview

kubectl exec "$FORTIO_POD" -c fortio -- /usr/bin/fortio curl -quiet http://productreviewservice.shoppingportal.svc.cluster.local/productreviewms/check/live

4 ) Call the service with 3 concurrent connections (-c 3) and send 30 requests (-n 30):

kubectl exec "$FORTIO_POD" -c fortio -- /usr/bin/fortio load -c 3 -qps 0 -n 30 -loglevel Warning http://productreviewservice.shoppingportal.svc.cluster.local/productreviewms/check/live

5) Query the istio-proxy stats to see more

kubectl exec "$FORTIO_POD" -c istio-proxy -- pilot-agent request GET stats | grep productreviewservice.shoppingportal.svc.cluster.local | grep pending


