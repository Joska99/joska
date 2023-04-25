<p align="center">
<h1>Terraform module for AKS,ACR and Log Analitics</h1>
<img src="https://github.com/Joska99/joska/blob/main/terraform/tf-aks/diagram.drawio.svg">
</p>

<h1> Steps </h1>

1. Login to your Azure account from your IDE terminal:
```bash 
az login 
```
2. Nawigate to "ias" folder and init Terraform:
```bash
terraform plan -out main.tfplan
```
3. Apply module:
```bash
terraform apply main.tfplan
```
4. Connect to newly created AKS cluster:
```bash
az aks get-credentials --resource-group aks-rg --name joska-cluster
```
5. Move kubeeconfig to cluster:
```bash
mv kubeconfig ~/.kube/config
```

<h1>To delete</h1>

1. Run this comand to destroy and add yes
```bash
terraform destroy
``` 