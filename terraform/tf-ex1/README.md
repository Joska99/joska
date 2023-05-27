<p align="center">
<h1>Simple Terraform lab</h1>
<img src="https://github.com/Joska99/joska/blob/main/terraform/tf-ex1/diagram.drawio.svg">
</p>

<h1> Steps </h1>

1. Login to your Azure account from your IDE terminal:
```bash 
az login 
```
2. Move to "IaC" folder and init Terraform:
```bash
terraform init 
```
3. Chek terraform module and output plan:
```bash
terraform plan -out main.tfplan
```
4. Apply module:
```bash
terraform apply main.tfplan
```

<h1> Create Storage Account in azure by CLI to store .tfstate</h1>

1. Create variables
```bash
RG_NAME=aks-rg
SA_NAME=sa4tstfstate
CONTAINER_NAME=tf-state
```

2. Create Storage Acount
```bash
az storage acount create --resource-group $RG_NAME --name $SA_NAME --sku Standard_LRS --encryption-services blob 
```
3. Create BLOB Container
```bash
az storage container create --name $CONTAINER_NAME --account-name $SA_NAME 
```
4. Get key 
```bash
ACCOUNT_KEY=$(az storage account keys list --resource-group aks-rg  --account-name sa4tstfstate --query '[0].value' -o tsv)
```
5. Add it to ARM 
```bash
$env:ARM_ACCESS_KEY=$ACCOUNT_KEY
```
6. Init changes and say yes 
```bash
terraform init 
```

<h1>To delete</h1>

1. Run this comand to destroy and add yes
```bash
terraform destroy
``` 