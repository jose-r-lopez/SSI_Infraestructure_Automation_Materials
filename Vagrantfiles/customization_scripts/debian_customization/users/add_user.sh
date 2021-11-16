#!/bin/bash

echo "Adding user '$1'"
sudo useradd -m -s /bin/bash -p $(openssl passwd -1 test123...) $1
sudo adduser $1 sudo
sudo adduser $1 vboxsf
sudo cp /home/vagrant/.nanorc /home/$1
sudo chown ssiuser:ssiuser /home/$1/.nanorc
