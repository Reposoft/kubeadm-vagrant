```
vagrant up

export KUBECONFIG=$(pwd)/kube-config

# wait for dns etc
kubectl get pods --all-namespaces -w
```
