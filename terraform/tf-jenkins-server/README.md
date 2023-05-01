<p align="center">
<h1>Terraform Jenkuns server in Azure configuret by Ansible</h1>
<img src="https://github.com/Joska99/joska/blob/main/terraform/tf-jenkins-server/diagram.drawio.svg">
</p>


<h1> Steps </h1>

1. Terraform init, plan apply with local backend
```bash
terraform init 
terraform plan --out plan
terraform apply plan
```
output 'linuxkey.pem' to local dir

- to connect to VM
```bash
cp linuxkey.pem ~/.ssh/
chmod 0600 ~/.ssh/linuxkey.pem
ssh -i ~/.ssh/linuxkey.pem adminuser@<PIP>
```

<h1> Create Storage Acount in azure by CLI to store .tfstate</h1>

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
6. Uncoment backend in providers and add Storage account Credentials, Init changes and say yes 
```bash
terraform init 
```
<h1>To delete</h1>

1. Run this comand to destroy and add yes
```bash
terraform destroy
``` 