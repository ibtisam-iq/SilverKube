#!/bin/bash

set -e

echo "=============================="
echo " Installing Gateway API CRDs "
echo "=============================="
kubectl kustomize "https://github.com/nginx/nginx-gateway-fabric/config/crd/gateway-api/standard?ref=v1.5.1" | kubectl apply -f -

echo
echo "==========================================="
echo " Installing NGINX Gateway Fabric CRDs "
echo "==========================================="
kubectl apply -f https://raw.githubusercontent.com/nginx/nginx-gateway-fabric/v1.6.1/deploy/crds.yaml

echo
echo "=============================================="
echo " Installing NGINX Gateway Fabric (NodePort) "
echo "=============================================="
kubectl apply -f https://raw.githubusercontent.com/nginx/nginx-gateway-fabric/v1.6.1/deploy/nodeport/deploy.yaml

echo
echo "==============================================="
echo " Installing NGINX Ingress Controller (optional)"
echo "==============================================="
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.13.0/deploy/static/provider/cloud/deploy.yaml

echo
echo "==============================================="
echo " ✔ All components installed successfully! "
echo "==============================================="
