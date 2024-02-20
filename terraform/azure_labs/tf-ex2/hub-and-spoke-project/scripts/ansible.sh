#!bin/bash  
# install ansible
sudo apt-get update
sudo apt-get install -y ansible
# install jenkins
echo "*****apply playbok*****"
ansible-playbook  /tmp/playbook.yml
