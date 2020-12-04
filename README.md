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

## Get a runner config token using a personal access token
```
curl \
  -X POST \
  -H "Authorization: token <personal-access-token>" \
  -H "Accept: application/vnd.github.machine-man-preview+json" \
  https://api.github.com/orgs/RedPillAnalytics/actions/runners/registration-token
```

## Add the GitHub Actions runner
```
./create-actions-runner.sh <runner-config-token>
```

## Delete the cluster
```
gcloud container clusters delete <cluster-name>
```
