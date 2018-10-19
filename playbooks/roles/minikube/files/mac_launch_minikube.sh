#!/bin/bash

# created by ansible edit your ~/workspace/cfg/
# repository for permanent changes

set -o errexit
set -o nounset
set -o pipefail


#--vm-driver hyperv \

minikube start \
         --insecure-registry localhost:5000 \
         --memory=8192 --cpus=2 \
         --kubernetes-version=v1.10.4 \
         --bootstrapper=kubeadm \
         --network-plugin cni
