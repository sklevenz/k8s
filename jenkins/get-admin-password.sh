#!/usr/bin/env bash

printf $(kubectl get secret --namespace kubernetes-jenkins jenkins -o jsonpath="{.data.jenkins-admin-password}" | base64 --decode);echo
