<h1>Terraform Virtual Wan Hub</h1>
<p align="center">
<img src="https://github.com/Joska99/joska/blob/main/terraform/modules/tf-wan-hub/diagram.drawio.svg">
</p>

<h1> Steps </h1>

- Terraform init, plan apply with local backend from 'iac' directory
```bash
terraform init
terraform plan --out tfplan
terraform apply tfplan 
```

- Delete
```bash
terraform destroy --auto-approve
```
