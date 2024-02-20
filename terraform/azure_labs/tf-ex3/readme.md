# Terraform Minecraft server in Azure configured by Ansible
<p align="center">
<img src="https://github.com/Joska99/joska/blob/main/terraform/tf-ex3/diagram.drawio.svg">
</p>

## Steps 
- Run Terraform init, plan apply with local backend from "iac' directory 
```bash
terraform init 
terraform plan --out plan
terraform apply plan 
```
> output 'akey.pem' to local directory
## Connect to VM
```bash
cp akey.pem ~/.ssh/
chmod 0600 ~/.ssh/akey.pem
ssh -i ~/.ssh/akey.pem minecraft@<VM_PIP>
```
## Check on witch port server listening
```bash 
sudo netstat -ntlp | grep LISTEN
```
## Delete
```bash
terraform destroy --auto-approve
```
## Outputs
1. akey.pem = ssh key to minecraft VM, outputs to local dir
2. vm_pip = public ip of minecraft vm
3. minecraft_port = port for minecraft
4. rg_name/rg_location = name and location of resource group of vm