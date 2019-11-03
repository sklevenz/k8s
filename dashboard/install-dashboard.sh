#!/usr/bin/env bash

kubectl config use-context docker-for-desktop

kubectl create namespace kubernetes-dashboard
# kubectl create secret generic kubernetes-dashboard-certs --from-file=./certs -n kubernetes-dashboard
# kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0-beta5/aio/deploy/recommended.yaml

kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0-beta5/aio/deploy/alternative.yaml

kubectl apply -f k8s-dashboard-additional-resources.yaml

kubectl wait --namespace=kubernetes-dashboard --for=condition=Ready pod --all=true --timeout=60s

./get-token.sh

open http://localhost:31000/
