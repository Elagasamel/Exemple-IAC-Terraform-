# MTLS

 Istio offers mutual TLS as a full stack solution for transport authentication.

 we will testing MTLS  3 namespace "shoppingportal" "shoppingportal2" both ISTIO Enabled  and networking with ISTIO

3 ways to enable MTLS

### 1.mesh-wide


kubectl apply -f 2-Security/mtls-mesh.yaml

./ms-install-apps (shoppingportal)

./ms-install-apps-2 (shoppingportal2)

install web pod in networking namespace without istio
 
kubectl apply -f test-app/networking-ns.yaml

kubectl apply -f test-app/web-pod.yml

##### login into pod  web pod:


kubectl exec -it web /bin/bash  -n networking


#### curl command to test 

curl http://productreviewservice.shoppingportal2.svc.cluster.local/productreviewms/check/live

curl http://productreviewservice.shoppingportal.svc.cluster.local/productreviewms/check/live

Both the curl command will give App is Live

kubectl apply -f 2-Security/mtls-mesh.yaml

repeat the step curl command

error should come 

curl: (56) Recv failure: Connection reset by peer



### 2. workload-specific

Applicable for specific service only


kubectl apply -f 2-Security/mtls-service.yaml

#### login into pod  web pod:

kubectl exec -it web /bin/bash  -n networking

#### curl command to test should give connect reset error 

curl http://k8uiworkshopservice.shoppingportal.svc.cluster.local/ui

##### check other service from same namespace should pass and give app is live

curl http://productreviewservice.shoppingportal.svc.cluster.local/productreviewms/check/live


### 3. namespace-wide

kubectl apply -f 2-Security/mtls-shoppingportal.yaml


#### login into pod  web pod:

kubectl exec -it web /bin/bash  -n networking


#### curl command to test should give connect reset error 

curl http://productreviewservice.shoppingportal.svc.cluster.local/productreviewms/check/live


check  service from different namespace should pass and give app is live

curl http://productreviewservice.shoppingportal2.svc.cluster.local/productreviewms/check/live


