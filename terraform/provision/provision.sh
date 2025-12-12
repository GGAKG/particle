#!/bin/bash
USER="${1:-azureuser}"
apt-get update -y
apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release

# Docker
curl -fsSL https://get.docker.com | sh
usermod -aG docker $USER

# kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl

# helm
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# k3s
curl -sfL https://get.k3s.io | sh -
sleep 10
kubectl get nodes

# nginx ingress
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
helm install nginx-ingress ingress-nginx/ingress-nginx --namespace ingress-nginx --create-namespace

kubectl create ns app || true
echo "Provision complete."
