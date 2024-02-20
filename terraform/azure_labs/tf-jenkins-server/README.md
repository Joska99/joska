# Terraform Jenkins server in Azure configured by Ansible
<p align="center">
<img src="https://github.com/Joska99/joska/blob/main/terraform/modules/tf-jenkins-server/diagram.drawio.svg">
</p>


## Steps 

1. Run Terraform init, plan apply with local backend from "iac' directory 
```bash
terraform init -upgrade
terraform plan --out plan
terraform apply plan 
```
> output 'linuxkey.pem' to local dir

2. In your browser connect to <PUBLIC_IP_VM>:8080 to access the jenkins GUI

## Connect to VM
```bash
cp linuxkey.pem ~/.ssh/
chmod 0600 ~/.ssh/linuxkey.pem
ssh -i ~/.ssh/linuxkey.pem adminuser@<PIP>
```

## Delete
```bash
terraform destroy --auto-approve
```

## Outputs
1. linuxkey.pem = ssh key to jenkins VM to local dir
2. pip = public ip of jenkins-ansible vm
3. private_ip = private ip of jenkins-ansible vm
4. vm_user/vm_pswd = credentials of jenkins-ansible vm
5. vnet_id = virtual-network id of jenkins-ansible vm