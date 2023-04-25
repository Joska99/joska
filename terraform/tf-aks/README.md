<p align="center">
<h1>Terraform module for AKS,ACR and Log Analitics</h1>
<img src="https://github.com/Joska99/joska/blob/main/terraform/tf-aks/diagram.drawio.svg">
</p>

<h1> Steps </h1>

1. Login to your Azure account from your IDE terminal:
```bash 
az login 
```
2. 
terraform plan -out main.tfplan

terraform apply main.tfplan

az aks get-credentials --resource-group aks-rg --name joska-cluster

mv kubeconfig ~/.kube/config