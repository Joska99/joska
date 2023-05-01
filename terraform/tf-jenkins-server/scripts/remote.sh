#!bin/bash  

ls ~/.ssh/known_hosts

sudo apt-get update
sudo apt-get install -y ansible
ansible-playbook  /tmp/playbook.yml

