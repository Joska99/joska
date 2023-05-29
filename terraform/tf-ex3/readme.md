<p align="center">
<h1>Terraform Jenkuns server in Azure configured by Ansible</h1>
<img src="https://github.com/Joska99/joska/blob/main/terraform/tf-ex3/diagram.drawio.svg">
</p>

<h1> Steps </h1>

- Terraform init, plan apply with local backend
```bash
terraform init 
terraform plan --out plan
terraform apply plan 
```
> output 'akey.pem' to local dir

- Connect to VM
```bash
cp akey.pem ~/.ssh/
chmod 0600 ~/.ssh/akey.pem
ssh -i ~/.ssh/akey.pem minecraft@<VM_PIP>
```

- Delete
```bash
terraform destroy --auto-approve
```

- Check on wich portr server listening
```bash 
sudo netstat -ntlp | grep LISTEN
```