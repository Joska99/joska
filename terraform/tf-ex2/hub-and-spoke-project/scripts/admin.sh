#! bin/bash

echo "*****connected to admin vm*****"
# prepear ssh key to connect to vm
cp /tmp/linuxkey.pem ~/.ssh
chmod 0600 ~/.ssh/linuxkey.pem
# to avoid fingerprint
ssh-keyscan -H $JENKINS_ANSIBLE_IP >> ~/.ssh/known_hosts
echo "*****ssh linuxkey.pem part completed*****"
# # istall firefox 
# sudo apt update
# sudo apt install firefox
# sudo apt install xdg-utils
# echo "*****updates completed*****"
# coppy playbook and remote skrips
scp -i ~/.ssh/linuxkey.pem /tmp/playbook.yml adminuser@$JENKINS_ANSIBLE_IP:/tmp 
scp -i ~/.ssh/linuxkey.pem /tmp/ansible.sh adminuser@$JENKINS_ANSIBLE_IP:/tmp
echo "*****scp part completed*****"
# install ansible and jenkins
ssh  -i ~/.ssh/linuxkey.pem adminuser@$JENKINS_ANSIBLE_IP '. /tmp/ansible.sh'