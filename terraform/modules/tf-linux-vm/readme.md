<p align="center">
<h1>Terraform Linux VM</h1>
<img src="https://github.com/Joska99/joska/blob/main/terraform/modules/tf-linux-vm/diagram.drawio.svg">
</p>

<h1> Steps </h1>

- Terraform init, plan apply with local backend
```bash
terraform init
terraform plan --out tfplan
terraform apply tfplan 
```

- Delete
```bash
terraform destroy --auto-approve
```

- outputs:
1. vnet_id = virtual network id to connect
2. linuxkey.pem = shh connection key to local dir
3. vm_pip = linux vm public ip