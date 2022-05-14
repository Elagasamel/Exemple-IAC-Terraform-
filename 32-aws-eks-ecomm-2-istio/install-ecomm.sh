#!/bin/bash

kubectl apply -f istio-deloyment/shopping-ns.yaml
kubectl apply -f istio-deloyment/mongo-secret.yaml
kubectl apply -f auth/auth-k8/
kubectl apply -f order/order-k8/
kubectl apply -f payment/payment-k8/
kubectl apply -f product/product-k8/
kubectl apply -f productreview/productreview-k8/
kubectl apply -f shoppingcart/shoppingcart-k8/
kubectl apply -f shoppingportal-ui-shell/shoppingportalui-k8/
