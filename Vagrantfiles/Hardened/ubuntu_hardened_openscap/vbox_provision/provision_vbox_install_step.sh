PROVISIONED="/home/vagrant/PROVISIONED_S1";

if [[ -f $PROVISIONED ]]; then
  echo "Step 1 already executed. Exiting...";
  exit;
else
  echo "Provisioning Step 1 (Installation)";
fi

echo ">>>>> Updating package base <<<<<"
sudo apt-get update

echo ">>>>> Installing apt support for HTTPS <<<<<"
sudo apt-get install -y apt-transport-https

echo ">>>>> Change keyboard layout to Spanish <<<<<"
loadkeys es
DEBIAN_FRONTEND=noninteractive sudo dpkg-reconfigure console-setup
sudo sed -i 's/XKBLAYOUT=\"\w*"/XKBLAYOUT=\"es\"/g' /etc/default/keyboard    
    
sudo wget -O - https://packages.cisofy.com/keys/cisofy-software-public.key | sudo apt-key add -
echo "deb https://packages.cisofy.com/community/lynis/deb/ stable main" | sudo tee /etc/apt/sources.list.d/cisofy-lynis.list

echo ">>>>> Updating package base <<<<<"
sudo apt-get update

echo ">>>>> Installing Lynis audit tool <<<<<"
sudo apt-get -y install lynis

echo ">>>>> Updating packages <<<<<"
sudo apt-get -y full-upgrade

echo ">>>>> Installing necessary software <<<<<"
sudo apt-get install -y --no-install-recommends ca-certificates gnupg-agent software-properties-common unzip curl wget preload tmux gpm mc

echo ">>>>> Installing VirtualBox Additions <<<<<"
sudo apt-get -y install -y virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11
sudo VBoxClient --clipboard
sudo VBoxClient --draganddrop
sudo VBoxClient --vmsvga
sudo VBoxClient --checkhostversion
sudo VBoxClient --seamless
sudo adduser vagrant vboxsf

echo "Configuring OS users"
sudo cp /home/vagrant/.nanorc /root
sudo cp /home/vagrant/tmux.conf /etc/
sudo chmod o+r /etc/tmux.conf
echo "vagrant:Th3W3y0fL4mbd4." | sudo chpasswd

echo ">>>>> Cleaning up <<<<<"
sudo apt-get -y autoremove 
sudo apt-get -y autoclean

touch $PROVISIONED;