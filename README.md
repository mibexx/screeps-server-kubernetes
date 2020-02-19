# Screeps Server for Kubernetes

Run
```
mkdir -p /data/screeps

kubectl apply -f kubernetes/pv-volume.yaml
kubectl apply -f kubernetes/pv-claim-data.yaml

helm install screeps screeps
```
