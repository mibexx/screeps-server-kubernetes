#!/bin/bash

if [ "$1" == "" ]; then
  echo "First param must be your steam api key"
  exit
fi

if [ "$2" == "" ]; then
  echo "Second param must be your server passord"
  exit
fi

if [ "$3" == "" ]; then
  echo "Third param must be your hostname or domain"
  exit
fi

STEAM_API=$1
SERVER_PASSWORD=$2
SERVER_HOST=$3

mkdir -p /data/screeps

kubectl apply -f kubernetes/pv-volume.yaml
kubectl apply -f kubernetes/pv-volume-config.yaml
kubectl apply -f kubernetes/pv-claim-data.yaml
kubectl apply -f kubernetes/pv-claim-data-config.yaml

helm install screeps screeps --set screeps.steam_api_key=$STEAM_API --set screeps.server_password=$SERVER_PASSWORD --set ingress.host=$SERVER_HOST
