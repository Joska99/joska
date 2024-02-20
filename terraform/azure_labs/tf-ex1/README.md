<h1>Terraform lab, simple network</h1>
<p align="center">
<img src="https://github.com/Joska99/joska/blob/main/terraform/tf-ex1/diagram.drawio.svg">
</p>

<h1> Steps </h1>

1. Login to your Azure account from your IDE terminal:
```bash 
az login 
```
2. Move to "IaC" folder and init Terraform:
```bash
cd IaC 
```
```bash
terraform init 
```
3. Check terraform module and output plan:
```bash
terraform plan -out main.tfplan
```
4. Apply module:
```bash
terraform apply main.tfplan
```

<h1> Create Storage Account in Azure by CLI to store .tfstate</h1>

1. Create variables
```bash
RG_NAME="resource-groups-name"
SA_NAME="storage-account-name"
CONTAINER_NAME="sa-container-name"
```
2. Create Storage Account, in Azure CLI run those commands:
```bash
az storage account create --resource-group $RG_NAME --name $SA_NAME --sku Standard_LRS --encryption-services blob 
```
3. Create BLOB Container:
```bash
az storage container create --name $CONTAINER_NAME --account-name $SA_NAME 
```
4. Get key:
```bash
ACCOUNT_KEY=$(az storage account keys list --resource-group aks-rg  --account-name $SA_NAME  --query '[0].value' -o tsv)
```
5. Add it to ARM:
```bash
$env:ARM_ACCESS_KEY=$ACCOUNT_KEY
```
6. Init changes and say yes :
```bash
terraform init 
```

<h1>To delete</h1>

1. Run this command to destroy 
```bash
terraform destroy --auto-approve
``` 