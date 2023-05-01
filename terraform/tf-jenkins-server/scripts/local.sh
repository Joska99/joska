#!bin/bash

cp linuxkey.pem ~/.ssh
chmod 0600 ~/.ssh/linuxkey.pem
scp -i ~/.ssh/linuxkey.pem linuxkey.pem adminuser@$AZURE_PUBLIC_IP:/tmp
scp -i ~/.ssh/linuxkey.pem ansible/playbook.yml adminuser@$AZURE_PUBLIC_IP:/tmp
scp -i ~/.ssh/linuxkey.pem scripts/remote.sh adminuser@$AZURE_PUBLIC_IP:/tmp

ssh -i ~/.ssh/linuxkey.pem adminuser@$AZURE_PUBLIC_IP '. /tmp/remote.sh'