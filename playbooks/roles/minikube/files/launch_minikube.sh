#!/bin/bash

# created by ansible edit your ~/workspace/cfg/
# repository for permanent changes
set -o errexit
set -o nounset
set -o pipefail

if [[ "$(. /etc/os-release; echo $NAME)" = "Ubuntu" ]]; then
    sudo systemctl start libvirt-guests
    sudo systemctl start virtlogd.socket
    sudo systemctl start libvirt-bin
else
    sudo systemctl start libvirtd
fi

# Remember to start your VM's like this
# --container-runtime=cri-o \ -> i want to enable this
# but it has issues

minikube start \
      --insecure-registry localhost:5000 \
      --vm-driver kvm2 \
      --memory=8192 --cpus=4 \
      --kubernetes-version=v1.10.7 \
      --bootstrapper=kubeadm \
      --network-plugin cni


eval $(minikube docker-env)

# "registry:2" is: https://github.com/docker/distribution
#  `/data` within minikube is persisted, as documented per:
# https://github.com/kubernetes/minikube/blob/master/docs/persistent_volumes.md#persistent-volumes
docker run -d -p 5000:5000 \
       --restart=always --name registry \
       -v /data/docker-registry:/var/lib/registry registry:2

echo "Please remember to eval \$(minikube docker-env)"
echo "This will cause your local docker to interact w/ the minikube VM"
