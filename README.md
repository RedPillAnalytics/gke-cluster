# gke-cluster
Scripts to create an auto-scaling cluster on GKE that includes a GitHub Actions runner.

## Installing helm
```
brew install helm
```

## Create the cluster
```
./create-cluster.sh <cluster-name>
```

## Add the GitHub Actions runner
```
./create-actions-runner.sh <personal-access-token>
```

## If desired, delete the cluster
```
gcloud container clusters delete --quiet <cluster-name>
```
