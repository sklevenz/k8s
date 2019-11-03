#!/usr/bin/env bash

kubectl delete ns kubernetes-dashboard --wait=true --timeout=60s

