#!/bin/bash

echo ">>>>> Adding Docker repository and updating apt <<<<<"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get -y update


echo ">>>>> Installing Docker <<<<<"
sudo apt-get -y install docker-ce docker-ce-cli containerd.io
sudo groupadd docker
sudo usermod -aG docker vagrant
sudo systemctl enable docker
    
echo ">>>>> Installing Docker Compose <<<<<"
sudo apt-get -y install docker-compose