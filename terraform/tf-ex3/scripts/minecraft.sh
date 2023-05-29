#! bin/bash

echo "##### open port on firewall #####" 
sudo ufw allow 25565/tcp

echo "##### Find disks conectet to VM #####"
sudo lsblk -o NAME,HCTL,SIZE,MOUNTPOINT | grep -i "sd"
sudo ls -l /dev/disk/azure/scsi1
sudo fdisk -l

echo "##### Make format of managed disk #####"
sudo mkfs.ext4 /dev/sdc -y

echo "Mount disk to /datadrive"
sudo mkdir /datadrive
sudo mount /dev/sdc /datadrive

echo "##### Check #####"
sudo blkid


echo "##### Install Java #####"
sudo apt-get install software-properties-common
sudo apt update; sudo apt-get install openjdk-8-jdk-headless -y 
sudo apt update; sudo apt install openjdk-16-jdk-headless -y

echo "##### Install minecraft client in /datadrive/minecraft-server #####"
cd /datadrive
sudo apt-get install unzip
sudo mkdir minecraft-server
cd minecraft-server
sudo wget https://launcher.mojang.com/v1/objects/3dc3d84a581f14691199cf6831b71ed1296a9fdf/server.jar

echo "##### Start Mineccraft server #####"
sudo nohup java -Xmx2G -XX:+UnlockExperimentalVMOptions -XX:+UseG1GC -XX:G1NewSizePercent=20 -XX:G1ReservePercent=20 -XX:MaxGCPauseMillis=50 -XX:G1HeapRegionSize=32M -jar server.jar nogui
sudo sed -i 's/eula=false/eula=true/' eula.txt
sudo java -jar server.jar
