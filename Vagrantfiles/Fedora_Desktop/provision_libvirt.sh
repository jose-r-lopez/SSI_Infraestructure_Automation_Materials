    echo ">>>>> Updating package base <<<<<"
    sudo yum -y update
     
    echo ">>>>> Upgrading packages <<<<<"
    sudo yum -y upgrade
    
    echo ">>>>> Installing useful command line software software <<<<<"
    sudo yum -y install wget nano tmux mc gpm unzip curl

    echo ">>>>> Installing Fedora Desktop Environment <<<<<"
    dnf -y group install "Basic Desktop" GNOME

    echo "Configuring command line tools"
    sudo cp /home/vagrant/.nanorc /root
    sudo cp /home/vagrant/tmux.conf /etc/
    sudo chmod o+r /etc/tmux.conf

    echo "vagrant:test123..." | sudo chpasswd
        
    echo ">>>>> Change keyboard layout to Spanish <<<<<"
    sudo localectl set-keymap es

    echo ">>>>> Cleaning up <<<<<"
    sudo yum -y autoremove
    sudo reboot
    