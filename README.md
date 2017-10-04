```
vagrant up
export KUBECONFIG=$(pwd)/kube-config
# wait for dns
kubectl get pods --all-namespaces -w
```
