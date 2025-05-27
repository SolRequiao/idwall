#!/bin/bash

set -e

minikube start
minikube addons enable ingress

nohup minikube tunnel > /dev/null 2>&1 &

MINIKUBE_IP=$(minikube ip)
HOSTNAME="localhost.js-idwall"

if ! grep -q "$HOSTNAME" /etc/hosts; then
    echo "$MINIKUBE_IP $HOSTNAME" | sudo tee -a /etc/hosts > /dev/null
fi

kubectl apply -f ./k8s/configmap-env.yaml
kubectl apply -f ./k8s/pod.yaml
kubectl apply -f ./k8s/replicaset.yaml
kubectl apply -f ./k8s/deployment.yaml
kubectl apply -f ./k8s/service.yaml
kubectl apply -f ./k8s/ingress.yaml