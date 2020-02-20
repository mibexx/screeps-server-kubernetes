# Screeps Server for Kubernetes

Run
```
mkdir -p /data/screeps

kubectl apply -f kubernetes/pv-volume.yaml
kubectl apply -f kubernetes/pv-volume-config.yaml
kubectl apply -f kubernetes/pv-claim-data.yaml
kubectl apply -f kubernetes/pv-claim-data-config.yaml

helm install screeps screeps --set screeps.steam_api_key=<your-steam-api-key> --set screeps.server_password=<your-server-password>  --set ingress.host=<your-server-host>
```
