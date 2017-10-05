#!/bin/bash

DASHBOARD_VERSION=v1.7.1
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/$DASHBOARD_VERSION/src/deploy/recommended/kubernetes-dashboard.yaml

HEAPSTER_VERSION=v1.5.0-beta.0
kubectl apply -f https://github.com/kubernetes/heapster/raw/$HEAPSTER_VERSION/deploy/kube-config/rbac/heapster-rbac.yaml
kubectl apply -f https://github.com/kubernetes/heapster/raw/$HEAPSTER_VERSION/deploy/kube-config/influxdb/influxdb.yaml
kubectl apply -f https://github.com/kubernetes/heapster/raw/$HEAPSTER_VERSION/deploy/kube-config/influxdb/heapster.yaml
