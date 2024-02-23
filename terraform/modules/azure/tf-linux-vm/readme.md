<h1>Terraform Linux VM</h1>
<p align="center">
<img src="https://github.com/Joska99/joska/blob/main/terraform/modules/azure/tf-linux-vm/diagram.drawio.svg">
</p>

<h1> Steps: </h1>

- Terraform init, plan with local backend, run those commands from 'iac' directory
```bash
terraform init
terraform plan --out tfplan
```
- Apply plan
```bash
terraform apply tfplan 
```

<h1> To delete </h1>

1. Run this command to destroy and add yes
```bash
terraform destroy
``` 

- Outputs

1. vnet_id - virtual network id to connect
2. linuxkey.pem - shh connection key to local dir
3. vm_pip - linux vm public ip