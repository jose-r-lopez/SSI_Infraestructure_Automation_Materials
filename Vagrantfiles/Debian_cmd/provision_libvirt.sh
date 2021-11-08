    echo ">>>>> Updating package base <<<<<"
    sudo apt-get -y update
     
    echo ">>>>> Upgrading packages <<<<<"
    sudo apt-get -y full-upgrade
    
    echo ">>>>> Installing necessary software <<<<<"
    sudo apt-get install -y --no-install-recommends apt-transport-https ca-certificates gnupg-agent software-properties-common unzip curl wget tmux preload gpm mc

    echo "Configuring OS users"
    sudo cp /home/vagrant/.nanorc /root
    sudo cp /home/vagrant/tmux.conf /etc/
    sudo chmod o+r /etc/tmux.conf

    echo "vagrant:test123..." | sudo chpasswd
    
    echo ">>>>> Change keyboard layout to Spanish <<<<<"
    loadkeys es
    sudo dpkg-reconfigure console-setup
    sudo sed -i 's/XKBLAYOUT=\"\w*"/XKBLAYOUT=\"es\"/g' /etc/default/keyboard    
    
    echo ">>>>> Cleaning up <<<<<"
    sudo apt-get -y autoremove 
    sudo apt-get -y autoclean
    sudo rm -rf /var/lib/apt/lists/*
    
    echo ">>>>> Reboot to implement all changes <<<<<"
    sudo reboot