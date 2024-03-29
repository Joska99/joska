<h1>Terraform AKS, ACR and Log Analytics</h1>
<p align="center">
<img src="https://github.com/Joska99/joska/blob/main/terraform/modules/azure/tf-aks-la/diagram.drawio.svg">
</p>

<h1> Steps: </h1>

1. Login to your Azure account from your IDE terminal:
```bash 
az login 
```
2. Move to "iac" folder and init Terraform:
```bash
terraform init 
```
3. Check terraform module and output plan:
```bash
terraform plan --out tfplan
```
4. Apply module:
```bash
terraform apply tfplan
```
5. Connect to newly created AKS cluster:
```bash
az aks get-credentials --resource-group aks-rg --name joska-cluster
```
6. Move kubeeconfig to cluster:
```bash
mv kubeconfig ~/.kube/config
```

<h1> Create Storage Account in azure by CLI to store .tfstate </h1>

1. Create variables
```bash
RG_NAME=aks-rg
SA_NAME=sa4tstfstate
CONTAINER_NAME=tf-state
```

2. Create Storage Account
```bash
az storage account create --resource-group $RG_NAME --name $SA_NAME --sku Standard_LRS --encryption-services blob 
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

6. Uncomment backend in providers and add Storage account Credentials, Init changes and say yes 
```bash
terraform init 
```

<h1> To delete </h1>

1. Run this command to destroy and add yes
```bash
terraform destroy
``` 