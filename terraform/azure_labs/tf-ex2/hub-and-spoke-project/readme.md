<p align="center">
<h1>Terraform Hub and Spoke</h1>
<img src="https://github.com/Joska99/joska/blob/main/terraform/tf-ex2/hub-and-spoke-project/diagram.drawio.svg">
</p>

<h1> Steps </h1>

1. Login to your Azure account from your IDE terminal:
```bash 
az login 
```

2. init Terraform:
```bash
terraform init 
```
3. Check terraform module and output plan:
```bash
terraform plan -out main.tfplan
```
4. Apply module:
```bash
terraform apply main.tfplan
```

<h1> Linux connection</h1>

- Connect with Display env To Linux Admin VM
```bash
ssh -X -Y -i ~/.ssh/adminkey.pem  adminuser@$PIP
```
- Check connection to Jenkins (10.88.1.4 = jenkins.joska.com)
```bash
ping 10.88.1.4
curl 10.88.1.4:8080
```
- Install to Linux Admin VM
```bash
sudo apt update
# Google chrome 
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt install google-chrome-stable
```
- Open jenkins GUI from Linux Admin VM
```bash
google-chrome jenkins.joska.com:8080
```

<h1> Windows connection</h1>

- Download RDP connection to Win Admin VM and connect to VM
- UserName: adminuser
- Password: J1j2j3j4j5
- Open browser and connect to jenkins.joska.com


<h1>To delete</h1>

1. Run this comand to destroy and add yes
```bash
terraform destroy
``` 