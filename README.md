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
./create-actions-runner.sh
```

## Delete the cluster
```
gcloud container clusters delete <cluster-name>
```
