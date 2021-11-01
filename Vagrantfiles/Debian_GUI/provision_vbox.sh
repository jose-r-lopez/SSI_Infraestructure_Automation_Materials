    echo ">>>>> Updating package base <<<<<"
    sudo apt -y update
     
    echo ">>>>> Upgrading packages <<<<<"
    sudo apt -y full-upgrade
    
    echo ">>>>> Installing necessary software <<<<<"
    sudo apt install -y --no-install-recommends apt-transport-https ca-certificates gnupg-agent software-properties-common unzip curl wget tmux preload gpm mc

    echo ">>>>> Installing Gnome GUI <<<<<"
    sudo apt install -y task-gnome-desktop

    echo ">>>>> Installing VirtualBox Additions <<<<<"
    sudo apt install -y build-essential dkms linux-headers-$(uname -r)
    cd /opt/
    sudo wget http://download.virtualbox.org/virtualbox/LATEST.TXT
    sudo wget -c http://download.virtualbox.org/virtualbox/$(cat LATEST.TXT)/VBoxGuestAdditions_$(cat LATEST.TXT).iso -O /opt/VBGAdd.iso
    sudo mount /opt/VBGAdd.iso -o loop /mnt
    sudo sh /mnt/VBoxLinuxAdditions.run --nox11
    sudo umount /mnt
    sudo rm /opt/VBGAdd.iso
    sudo adduser vagrant vboxsf

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