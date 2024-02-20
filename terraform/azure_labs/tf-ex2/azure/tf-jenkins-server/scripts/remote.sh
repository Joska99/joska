#!bin/bash  
# install ansible
sudo apt-get update
sudo apt-get install -y ansible
# install jenkins
ansible-playbook  /tmp/playbook.yml


