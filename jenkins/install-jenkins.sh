#!/usr/bin/env bash

kubectl config use-context docker-for-desktop
kubectl apply -f jenkins-deployment.yaml

helm repo add stable https://kubernetes-charts.storage.googleapis.com/

helm install jenkins -f ./jenkins-values.yaml stable/jenkins --namespace kubernetes-jenkins --wait

echo "admin password: "
printf $(kubectl get secret --namespace kubernetes-jenkins jenkins -o jsonpath="{.data.jenkins-admin-password}" | base64 --decode);echo
