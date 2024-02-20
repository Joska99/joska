
1. Terraform init, plan apply with local backend
```bash
terraform init -upgrade
terraform plan --out plan
terraform apply plan 
```
- require approval of "scp" connection
> output 'linuxkey.pem' to local dir

- to connect to VM
```bash
cp linuxkey.pem ~/.ssh/
chmod 0600 ~/.ssh/linuxkey.pem
ssh -i ~/.ssh/linuxkey.pem adminuser@<PIP>
```
 
- to delete
```bash
terraform destroy --auto-approve
```
2. To use as module require "ansible" and "scripts" in root directory

