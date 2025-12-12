# Node.js CI/CD Assignment

## Overview
This project demonstrates an end-to-end CI/CD pipeline for a Node.js web application deployed on Azure with Kubernetes and monitoring.

## Folder Structure
- `src/` – Node.js application (`index.js` )
- `Dockerfile` – Multi-stage Docker build
- `.github/workflows/ci.yml` – CI pipeline
- `deployment.yaml` – Kubernetes manifests
- `terraform/` – Azure infrastructure + provisioning scripts

## Local Setup
```bash
# Install dependencies
cd src
npm install

# Start locally
npm start
curl http://localhost:8080/app/health

## Docker

docker build -t <IMAGE>:latest -f Dockerfile .
docker run -p 8080:8080 <IMAGE>:latest

## Terraform

cd terraform
terraform init
terraform plan
terraform apply
# Get VM public IP
terraform output vm_public_ip

## Kubernetes

kubectl create ns app
kubectl apply -f deployment.yaml
kubectl -n app get pods,svc,ingress
curl http://<VM_PUBLIC_IP>/app/health

## Challenges and Solutions

Challenge: While building and running the Docker container, the container remained in a running state and could not be stopped or killed directly because it was running under the node user.

Solution: To manage the container, it was necessary to manually identify the containers PID and terminate it. Future builds may consider handling process signals properly within the container or running as a user with sufficient privileges for container lifecycle management.

Challenge: Using a LoadBalancer service type was not feasible because the Kubernetes cluster was running on a single Azure VM.

Solution: Exposed services via NodePort instead, allowing access to applications using the VM’s public IP and the assigned NodePort. This ensured connectivity without relying on cloud load balancers.


