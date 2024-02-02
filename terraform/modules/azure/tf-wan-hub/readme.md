<h1>Terraform Virtual Wan Hub</h1>
<p align="center">
<img src="https://github.com/Joska99/joska/blob/main/terraform/modules/tf-wan-hub/diagram.drawio.svg">
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
