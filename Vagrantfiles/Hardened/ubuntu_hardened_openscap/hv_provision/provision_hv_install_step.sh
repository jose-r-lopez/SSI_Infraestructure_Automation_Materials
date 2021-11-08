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

echo ">>>>> Enabling Linux Integration Services (LIS) <<<<<"
sudo sed -i '$a hv_vmbus' /etc/initramfs-tools/modules
sudo sed -i '$a hv_storvsc' /etc/initramfs-tools/modules
sudo sed -i '$a hv_blkvsc' /etc/initramfs-tools/modules
sudo sed -i '$a hv_netvsc' /etc/initramfs-tools/modules
# Replace default kernel with linux-virtual for the best LIS experience
sudo apt-get -y install linux-virtual linux-cloud-tools-virtual linux-tools-virtual
# Update Initramfs
sudo update-initramfs -u

echo "Configuring OS users"
sudo cp /home/vagrant/.nanorc /root
sudo cp /home/vagrant/tmux.conf /etc/
sudo chmod o+r /etc/tmux.conf
echo "vagrant:Th3W3y0fL4mbd4." | sudo chpasswd

echo ">>>>> Cleaning up <<<<<"
sudo apt-get -y autoremove 
sudo apt-get -y autoclean

touch $PROVISIONED;