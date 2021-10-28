    echo ">>>>> Installing necessary software to download applications packages <<<<<"
    sudo apt-get -y update
    sudo apt-get -y install apt-transport-https ca-certificates gnupg-agent software-properties-common

    echo ">>>>> Updating package base <<<<<"
    sudo add-apt-repository universe
    sudo add-apt-repository ppa:inkscape.dev/stable

    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
    sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
    rm -f packages.microsoft.gpg

    curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
    sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/ms-teams stable main" > /etc/apt/sources.list.d/teams.list'

    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

    sudo apt-get -y update
     
    echo ">>>>> Upgrading packages <<<<<"
    sudo apt-get -y full-upgrade
    
    echo ">>>>> Change keyboard layout to Spanish <<<<<"
    loadkeys es
    sudo dpkg-reconfigure console-setup
    sudo sed -i 's/XKBLAYOUT=\"\w*"/XKBLAYOUT=\"es\"/g' /etc/default/keyboard  

    echo ">>>>> Installing Gnome Desktop <<<<<"
    sudo apt-get -y install -y ubuntu-desktop

    echo ">>>>> Installing necessary software <<<<<"
    sudo apt-get -y install unzip nmap curl wget tmux preload gpm mc ffmpeg 

    echo ">>>>> Installing VirtualBox Additions <<<<<"
    sudo apt-get -y install -y virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11
    sudo VBoxClient --clipboard
    sudo VBoxClient --draganddrop
    sudo VBoxClient --vmsvga
    sudo VBoxClient --checkhostversion
    sudo VBoxClient --seamless
    sudo adduser vagrant vboxsf

    echo "Configuring OS users"
    sudo cp /home/vagrant/.nanorc /home/ssiuser
    sudo cp /home/vagrant/.nanorc /root
    sudo cp /home/vagrant/tmux.conf /etc/
    sudo chmod o+r /etc/tmux.conf

    echo "vagrant:test123..." | sudo chpasswd 
 
    echo ">>>>> Installing Clam TK Antimalware <<<<<"
    sudo apt-get -y install clamtk

    echo ">>>>> Installing GIMP <<<<<"
    sudo snap install gimp

    echo ">>>>> Installing Inkscape <<<<<"
    sudo apt-get -y install inkscape

    echo ">>>>> Installing Krita <<<<<" 
    sudo snap install krita

    echo ">>>>> Installing Visual Studio Code <<<<<"
    sudo apt-get -y install code
    
    echo ">>>>> Installing TexMaker <<<<<" 
    sudo apt-get -y install texmaker
    
    echo ">>>>> Installing Teams <<<<<" 
    sudo apt-get -y install teams

    echo ">>>>> Installing Calibre <<<<<"
    sudo apt-get -y install calibre

    echo ">>>>> Installing Filezilla <<<<<"
    sudo apt-get -y install filezilla

    echo ">>>>> Installing OpenShot <<<<<"
    sudo apt-get -y install openshot

    echo ">>>>> Installing Okular <<<<<"
    sudo apt-get -y install okular

    echo ">>>>> Installing Kodi <<<<<"
    sudo apt-get -y install kodi

    echo ">>>>> Installing Brave browser <<<<<"
    sudo apt-get -y install brave-browser

    echo ">>>>> Cleaning up <<<<<"
    sudo apt-get -y autoremove 
    sudo apt-get -y autoclean
    
    echo ">>>>> Reboot to implement all changes <<<<<"
    sudo reboot
