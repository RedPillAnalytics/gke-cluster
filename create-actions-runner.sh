#!/bin/bash

# Add the helm repo
helm repo add evryfs-oss https://evryfs.github.io/helm-charts/
helm repo update

# Create namespace
kubectl create namespace actions-runner

# Install the helm chart
helm install github-actions-runner-operator evryfs-oss/github-actions-runner-operator \
--namespace actions-runner

# Create GitHub Token
kubectl create secret generic actions-runner --from-literal=GH_TOKEN=$1

# Create CRD
kubectl apply -f runner-resource.yaml
