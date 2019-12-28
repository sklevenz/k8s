#!/usr/bin/env bash


kubectl delete ns kubernetes-jenkins --wait=true --timeout=60s
kubectl delete ns kubernetes-volumes --wait=true --timeout=60s

kubectl delete persistentvolume jenkins-pv
