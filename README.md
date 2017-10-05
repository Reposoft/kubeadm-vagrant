```
vagrant up

# fixes Unable to connect to the server: x509: certificate signed by unknown authority
vagrant ssh -c 'sudo cp /etc/kubernetes/admin.conf /vagrant/kube-config' master1

export KUBECONFIG=$(pwd)/kube-config

# wait for dns etc
kubectl get pods --all-namespaces -w
```
