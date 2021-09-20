    echo ">>>>> Adding Docker repository and updating apt <<<<<"
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    
    echo ">>>>> Updating package base <<<<<"
    sudo apt-get -y update
     
    echo ">>>>> Upgrading packages <<<<<"
    sudo apt-get -y full-upgrade
    
    echo ">>>>> Installing necessary software <<<<<"
    sudo apt-get -y install apt-transport-https ca-certificates gnupg-agent software-properties-common unzip nmap curl wget firefox steghide tmux preload gpm mc
    
    echo ">>>>> Installing XCFE <<<<<"
    sudo apt-get -y install -y xfce4

    echo "Configuring OS users"
    sudo useradd -m -s /bin/bash -p $(openssl passwd -1 test123...) ssiuser
    sudo adduser ssiuser sudo
    sudo cp /home/vagrant/.nanorc /home/ssiuser
    sudo chown ssiuser:ssiuser /home/ssiuser/.nanorc
    sudo cp /home/vagrant/.nanorc /root
    sudo cp /home/vagrant/tmux.conf /etc/
    sudo chmod o+r /etc/tmux.conf


    echo "vagrant:test123..." | sudo chpasswd
    
    echo ">>>>> Installing Docker <<<<<"
    sudo apt-get -y install docker-ce docker-ce-cli containerd.io
    sudo groupadd docker
    sudo usermod -aG docker vagrant
    sudo usermod -aG docker ssiuser
    sudo systemctl enable docker
    
    echo ">>>>> Installing Docker Compose <<<<<"
    sudo apt-get -y install docker-compose
    
    echo ">>>>> Change keyboard layout to Spanish <<<<<"
    loadkeys es
    sudo dpkg-reconfigure console-setup
    sudo sed -i 's/XKBLAYOUT=\"\w*"/XKBLAYOUT=\"es\"/g' /etc/default/keyboard    
    
    echo ">>>>> Cleaning up <<<<<"
    sudo apt-get -y autoremove 
    sudo apt-get -y autoclean
    
    echo ">>>>> Reboot to implement all changes <<<<<"
    sudo reboot
