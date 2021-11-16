#!/bin/bash

echo ">>>>> Installing PortSentry <<<<<"
echo "\n" | sudo DEBIAN_FRONTEND=noninteractive apt-get install -y portsentry

echo ">>>>> Activate nmap scan permanent blocks to port 22 (PortSentry) <<<<<"
sudo cp /home/vagrant/hardened_files/portsentry /etc/default/portsentry
sudo cp /home/vagrant/hardened_files/portsentry.conf /etc/portsentry/portsentry.conf