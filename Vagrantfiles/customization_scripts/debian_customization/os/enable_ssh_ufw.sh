#!/bin/bash

echo ">>>>> Enabling firewall and authorizing ssh <<<<<"
sudo ufw allow ssh
sudo ufw allow $1
sudo ufw --force enable

echo ">>>>> Hardening SSH daemon <<<<<"
sudo cp /home/vagrant/hardened_files/sshd_config /etc/ssh/sshd_config
