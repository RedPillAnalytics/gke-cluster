#!/bin/bash

# Add the helm repo
helm repo add jetstack https://charts.jetstack.io
helm repo update

# Create namespace
kubectl create namespace cert-manager

# Install the helm chart
helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --version v1.1.0 \
  --set installCRDs=true

# Create GitHub Token
kubectl apply -f https://github.com/summerwind/actions-runner-controller/releases/latest/download/actions-runner-controller.yaml
