#!/bin/bash

echo "Mock Service : Installations"
echo "4.1 Install the Apps: (UI, Cart, Order, Payment)"
kubectl apply  --filename lambda-namespace.yaml
kubectl apply  --filename lambda-ingress-aws.yaml
kubectl apply  --filename ws-deploy.yaml
kubectl apply  --filename ws-service.yaml
kubectl apply  --filename cart-deploy.yaml
kubectl apply  --filename cart-service.yaml
kubectl apply  --filename order-deploy-v1.yaml --record
kubectl apply  --filename order-service.yaml
kubectl apply  --filename order-hpa.yaml
kubectl apply  --filename payment-deploy.yaml
kubectl apply  --filename payment-service.yaml

echo "...."
echo "4.2 Switch the Namespace to Lambda"
kubectl config set-context $(kubectl config current-context) --namespace=lambda

echo "........"
echo "4.3 Show Ingress, Services, Pods, HPA"
kubectl get ing,svc,pods,hpa -o wide
echo "............ Setup Complete!"
echo
