#!/bin/bash

echo ">>>>> Installing Fail2Ban <<<<<"
sudo apt-get install -y fail2ban

echo ">>>>> Reconfigure Fail2Ban to the real ssh port <<<<<"
sudo cp /home/vagrant/hardened_files/services /etc/services
