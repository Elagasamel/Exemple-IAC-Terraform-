#!/bin/bash -v
kubectl apply -f App/shopping-ns.yaml
kubectl apply -f mongo/
kubectl apply -f Kafka/01-zookeeper/
kubectl apply -f Kafka/02-kafka/
kubectl apply -f https://raw.githubusercontent.com/MetaArivu/ms-zipkin-server/main/ms-k8-yml/deployment.yml
kubectl apply -f https://raw.githubusercontent.com/MetaArivu/ms-zipkin-server/main/ms-k8-yml/service.yml
kubectl apply -f App/user-k8s/
kubectl apply -f App/product-k8s/
kubectl apply -f App/ui-k8s/
kubectl apply -f App/order-k8s/
kubectl apply -f App/payment-k8s/
kubectl apply -f App/productreview-k8s/
kubectl apply -f App/ms.shopping.cart.aggregator.service/ms-k8-yml/
kubectl apply -f App/ms.shopping.cart.cmd.service/k8-yml/
kubectl apply -f App/ms.shopping.cart.query.service/k8-yml/
kubectl apply -f App/ms.shopping.cart.enhancer.service/k8-yml/
kubectl apply -f App/shoppingportal-ing-aws.yaml