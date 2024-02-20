#! bin/bash

# prepear ssh key to connect to vm
cp linuxkey.pem ~/.ssh
chmod 0600 ~/.ssh/linuxkey.pem
ssh-keyscan -H $JENKINS_ANSIBLE_IP >> ~/.ssh/known_hosts
# coppy playbook and remote skrips
scp -i ~/.ssh/linuxkey.pem ansible/playbook.yml adminuser@$AZURE_PUBLIC_IP:/tmp 
scp -i ~/.ssh/linuxkey.pem scripts/remote.sh adminuser@$AZURE_PUBLIC_IP:/tmp
# install ansible and jenkins
ssh -i ~/.ssh/linuxkey.pem adminuser@$AZURE_PUBLIC_IP '. /tmp/remote.sh'