#!/bin/bash -eux

# https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG.md#external-dependencies
export DOCKER_VERSION=".io=1.12.6-0ubuntu1~16.04.1"
export KUBE_VERSION="=1.7.5-00"
export DEBIAN_FRONTEND=noninteractive

curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | apt-key add -
apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
   $(lsb_release -cs) \
   stable"

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF

apt-get update

apt-get update
apt-cache madison docker$(echo $DOCKER_VERSION | awk -F'=' '{ print $1 }')
apt-cache madison kubeadm | head -n 5
apt-cache madison kubelet | head -n 5
apt-cache madison kubectl | head -n 5

apt-get install -yq \
    ebtables \
    ethtool \
    docker$DOCKER_VERSION \
    kubelet$KUBE_VERSION \
    kubeadm$KUBE_VERSION \
    kubectl$KUBE_VERSION
