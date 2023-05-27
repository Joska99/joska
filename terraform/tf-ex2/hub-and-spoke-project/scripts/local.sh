#! bin/bash

# prepear ssh key to connect to admin vm
cp adminkey.pem ~/.ssh
chmod 0600 ~/.ssh/adminkey.pem
# to avoid fingerprint 
ssh-keyscan -H $ADMIN_PIP >> ~/.ssh/known_hosts
echo "*****ssh adminkey.pem part completed*****"
# copy ansible files and .peem key for jenkins-ansible-vm
scp  -i ~/.ssh/adminkey.pem ansible/playbook.yml adminuser@$ADMIN_PIP:/tmp 
scp  -i ~/.ssh/adminkey.pem scripts/ansible.sh adminuser@$ADMIN_PIP:/tmp 
scp  -i ~/.ssh/adminkey.pem scripts/admin.sh adminuser@$ADMIN_PIP:/tmp 
scp  -i ~/.ssh/adminkey.pem linuxkey.pem adminuser@$ADMIN_PIP:/tmp 
echo "*****scp part complited*****"

# ssh connet and run scripts on admin vm
ssh  -i ~/.ssh/adminkey.pem  adminuser@$ADMIN_PIP "export JENKINS_ANSIBLE_IP=${JENKINS_ANSIBLE_IP} &&  . /tmp/admin.sh"
#-o StrictHostKeyChecking=no

