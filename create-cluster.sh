#!/bin/bash

# Create the autoscaling cluster
gcloud beta container --project "rpa-devops" clusters create $1 --zone "us-east1-b" \
  --no-enable-basic-auth --cluster-version "1.17.13-gke.1400" --release-channel "regular" \
  --machine-type "e2-medium" --image-type "COS" --disk-type "pd-standard" --disk-size "100" \
  --metadata disable-legacy-endpoints=true --scopes "https://www.googleapis.com/auth/cloud-platform" \
  --max-pods-per-node "110" --num-nodes "1" --enable-stackdriver-kubernetes --enable-ip-alias \
  --network "projects/rpa-devops/global/networks/default" --subnetwork "projects/rpa-devops/regions/us-east1/subnetworks/default" \
  --default-max-pods-per-node "110" --enable-autoscaling --min-nodes "0" --max-nodes "5" \
  --no-enable-master-authorized-networks --addons HorizontalPodAutoscaling,HttpLoadBalancing \
  --enable-autoupgrade --enable-autorepair --max-surge-upgrade 1 --max-unavailable-upgrade 0 \
  --enable-autoprovisioning --min-cpu 1 --max-cpu 8 --min-memory 1 --max-memory 16 \
  --autoprovisioning-scopes=https://www.googleapis.com/auth/cloud-platform \
  --enable-autoprovisioning-autorepair --enable-autoprovisioning-autoupgrade \
  --autoprovisioning-max-surge-upgrade 1 --autoprovisioning-max-unavailable-upgrade 0 \
  --enable-vertical-pod-autoscaling \
  --resource-usage-bigquery-dataset "usage_metering" --enable-resource-consumption-metering

gcloud container clusters get-credentials $1
