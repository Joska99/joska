# Joseph Kanzaveli Portfolio

# Topics:

- Kubernetes:
  - [Kubernetes labs](#kubernetes-labs)
- Jenkins:
  - [Jenkins labs](#jenkins-labs)
- Docker:
  - [Docker Compose labs](#docker-compose-labs)
  - [Docker labs](#docker-labs)
- Terraform:
  - [Terraform labs](#terraform-labs)
  - [Terraform modules](#terraform-modules)

# Kubernetes

## Kubernetes-Labs

<!-- TODO: ADD DATREE TEST IN CI -->

1. [Helm chart wit Python Flask app and ArgoCD](https://github.com/Joska99/Targil1090)
<p align="center">
<img src="https://github.com/Joska99/Targil1090/blob/master/helm-flask-html.drawio.svg">
</p>

2. [ArgoCD guide for Kubernetes](https://github.com/Joska99/ArgoCD)
<p align="center">
<img src="https://github.com/Joska99/ArgoCD/blob/main/diagram.drawio.svg">
</p>

3. [Ingres with multiple services](https://github.com/Joska99/joska/blob/main/kubernetes/Lab-1)
<p align="center">
<img src="https://github.com/Joska99/joska/blob/main/kubernetes/Lab-1/diagram.drawio.svg">
</p>

4. [Helm deployment to Kubernetes, Prometheus+Grafana chart](https://github.com/Joska99/joska/blob/main/kubernetes/Lab-2)
<p align="center">
<img src="https://github.com/Joska99/joska/blob/main/kubernetes/Lab-2/diagram.drawio.svg">
</p>

# Jenkins

## Jenkins-Labs

1. [Jenkins CI Pipeline - Build Docker image and Push to DockerHub](https://github.com/Joska99/jenkins-docker)
<p align="center">
<img src="https://github.com/Joska99/jenkins-docker/blob/main/diagram.drawio.svg">
</p>

<!-- TODO: end up kubernetes slaves for jenkins  -->

2. [Jenkins CI/CD pipeline - with slave in kubernetes](https://github.com/Joska99/jenkins-k8s)
<p align="center">
<img src="https://github.com/Joska99/jenkins-k8s/blob/main/diagram.drawio.svg">
</p>

<!-- TODO: update -->

3. [Jenkins CD Pipeline - Terraform deploy AKS to Azure](https://github.com/Joska99/jenkins-terraform)
   <img src="https://github.com/Joska99/jenkins-terraform/blob/main/diagram.drawio.svg">

# Docker

## Docker-Compose-Labs

<!-- [x] -->

1. [Docker-Compose Wazuh SIEM guide](https://github.com/Joska99/joska/blob/main/docker/wazuh)
<p align="center">
<img src="https://github.com/Joska99/joska/blob/main/docker/wazuh/diagram.drawio.svg">
</p>

## Docker-Labs

<!-- [x] -->

1. [Jenkins Container](https://github.com/Joska99/joska/blob/main/docker/jenkins)
   <img src="https://github.com/Joska99/joska/blob/main/docker/jenkins/diagram.drawio.svg">

<!-- [x]  -->

2. [Prometheus with config file and Alert Manager Containers](https://github.com/Joska99/joska/tree/main/docker/prometheus)
   <img src="https://github.com/Joska99/joska/blob/main/docker/prometheus/diagram.drawio.svg">

<!-- [ ] -->

3. [Grafana Container](https://github.com/Joska99/joska/tree/main/docker/grafana)
   <img src="https://github.com/Joska99/joska/blob/main/docker/grafana/diagram.drawio.svg">

<!-- !TEMPLATE -->

4. [<DESCRIPTION>](https://github.com/Joska99/joska/blob/main/docker/<NAME>)
   <img src="https://github.com/Joska99/joska/blob/main/docker/<NAME></NAME>/diagram.drawio.svg">

# Terraform

## Terraform-Labs

### Terraform-Labs AWS

### Terraform-Labs Azure

<!-- [ ] require test -->

1. [Terraform lab - Jenkins server in Azure configured by Ansible](https://github.com/Joska99/joska/blob/main/terraform/modules/tf-jenkins-server)
<p align="center">
<img src="https://github.com/Joska99/joska/blob/main/terraform/modules/tf-jenkins-server/diagram.drawio.svg">
</p>

<!-- [ ] require test -->

2. [Terraform lab - Minecraft Server](https://github.com/Joska99/joska/blob/main/terraform/tf-ex3)
<p align="center">
<img src="https://github.com/Joska99/joska/blob/main/terraform/tf-ex3/diagram.drawio.svg">
<p>

<!-- [ ] require test -->

3. [Simple Terraform lab](https://github.com/Joska99/joska/blob/main/terraform/tf-ex1)
<p align="center">
<img src="https://github.com/Joska99/joska/blob/main/terraform/tf-ex1/diagram.drawio.svg">
</p>

<!-- TODO: update -->

4. [Terraform lab - Hub and Spoke private network](https://github.com/Joska99/joska/blob/main/terraform/tf-ex2/hub-and-spoke-project)
   <img src="https://github.com/Joska99/joska/blob/main/terraform/tf-ex2/hub-and-spoke-project/diagram.drawio.svg">

## Terraform-Modules

### Terraform-Modules AWS

1. [AWS EC2](https://github.com/Joska99/joska/blob/main/terraform/modules/aws/aws_ec2)
2. [AWS Security Group](https://github.com/Joska99/joska/blob/main/terraform/modules/aws/aws_security_group)
3. [AWS VPC with Private and Public Subnets](https://github.com/Joska99/joska/blob/main/terraform/modules/aws/vpc_privat_and_public_subnet)

### Terraform-Modules Azure

<!-- [x] -->

1. [Azure AKS with LogAnalytics and ACR module](https://github.com/Joska99/joska/blob/main/terraform/modules/azure/tf-aks-la)

<!-- [x] -->

2. [Azure Linux VM](https://github.com/Joska99/joska/blob/main/terraform/modules/azure/tf-linux-vm)

<!-- [x] -->

3. [Azure WAN Hub](https://github.com/Joska99/joska/blob/main/terraform/modules/azure/tf-wan-hub)
