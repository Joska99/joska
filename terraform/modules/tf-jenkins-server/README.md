<p align="center">
<h1>Terraform Jenkuns server in Azure configured by Ansible</h1>
<img src="https://github.com/Joska99/joska/blob/main/terraform/modules/tf-jenkins-server/diagram.drawio.svg">
</p>


<h1> Steps </h1>

- Terraform init, plan apply with local backend
```bash
terraform init -upgrade
terraform plan --out plan
terraform apply plan 
```
> require approval of "scp" connection to add to ~/.shh/known_hosts
> output 'linuxkey.pem' to local dir

- In your browser connect to <PUBLIC_IP_VM>:8080 to access the jenkins GUI

- Connect to VM
```bash
cp linuxkey.pem ~/.ssh/
chmod 0600 ~/.ssh/linuxkey.pem
ssh -i ~/.ssh/linuxkey.pem adminuser@<PIP>
```

- Delete
```bash
terraform destroy --auto-approve
```

- Outputs:
1. linuxkey.pem = ssh key to jenkins VM to local dir
2. pip = public ip of jenkins-ansible vm
3. private_ip = private ip of jenkins-ansible vm
4. vm_user/vm_pswd = credentials of jenkins-ansible vm
5. vnet_id = vnet id of jenkins-ansible vm