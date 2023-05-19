<p align="center">
<h1>Terraform Virual Wan Hub</h1>
<img src="https://github.com/Joska99/joska/blob/main/terraform/modules/tf-vwan-hub/diagram.drawio.svg">
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
1. vhub_id = virtual hub id to connecct