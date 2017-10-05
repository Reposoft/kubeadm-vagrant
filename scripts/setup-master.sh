#!/bin/bash -eux

kubeadm init --apiserver-advertise-address=$1 \
  --pod-network-cidr=10.244.0.0/16 \
  --skip-preflight-checks #https://issue.k8s.io/53356#issuecomment-333748618

mkdir -p $HOME/.kube
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
cp -i /etc/kubernetes/admin.conf /vagrant/kube-config
chown $(id -u):$(id -g) $HOME/.kube/config

kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/v0.9.0/Documentation/kube-flannel.yml
