#!/bin/bash

# Add the helm repo
helm repo add evryfs-oss https://evryfs.github.io/helm-charts/
helm repo update

# Create namespace
kubectl create namespace actions-runner

# Install the helm chart
helm install github-actions-runner-operator evryfs-oss/github-actions-runner-operator \
--namespace actions-runner

# Create CRD
kubectl apply -f runner-resource.yaml
