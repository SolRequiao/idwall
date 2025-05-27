#! /bin/bash

eval $(minikube docker-env)
docker build -t id-wall-sol:latest .