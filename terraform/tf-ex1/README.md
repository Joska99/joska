<p align="center">
<h1>Simple Terraform lab</h1>
<img src="https://github.com/Joska99/joska/blob/main/terraform/tf-ex1/diagram.drawio.svg">
</p>

<h1> Steps </h1>

1. Login to your Azure account from your IDE terminal:
```bash 
az login 
```
2. Move to "ias" folder and init Terraform:
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

<h1>To delete</h1>

1. Run this comand to destroy and add yes
```bash
terraform destroy
``` 