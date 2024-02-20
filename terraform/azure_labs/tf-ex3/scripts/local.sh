#! bin/bash

echo "##### prepear akey.pem #####"
cp akey.pem ~/.ssh
chmod 0600 ~/.ssh/akey.pem
ssh-keyscan -H $SERVER_PIP >> ~/.ssh/known_hosts

echo "##### ssh coppy #####"
scp -i ~/.ssh/akey.pem ./scripts/minecraft.sh minecraft@$SERVER_PIP:/tmp

echo "##### ssh connection #####"
ssh  -i ~/.ssh/akey.pem minecraft@$SERVER_PIP ". /tmp/minecraft.sh"

