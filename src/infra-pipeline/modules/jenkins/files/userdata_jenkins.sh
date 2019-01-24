#!/bin/bash
echo "Install Docker,Jenkins & Ansible"
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" && sudo apt-add-repository ppa:ansible/ansible
sudo apt update
apt-cache policy docker-ce
sudo apt -y install docker-ce ansible
sudo mkdir /home/ubuntu/jenkins && sudo chown ubuntu:ubuntu /home/ubuntu/jenkins && sudo docker run -d -p 8080:8080 -p 50000:50000 -v /home/ubuntu/jenkins:/var/jenkins_home jenkins
