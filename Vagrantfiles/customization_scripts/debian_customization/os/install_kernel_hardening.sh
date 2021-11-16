#!/bin/bash

echo ">>>>> Implement Kernel Hardening <<<<<"
sudo cp /home/vagrant/hardened_files/10-kernel-hardening.conf /etc/sysctl.d/10-kernel-hardening.conf
sudo cp /home/vagrant/hardened_files/10-network-security.conf /etc/sysctl.d/10-network-security.conf
sudo cp /home/vagrant/hardened_files/sysctl.conf /etc/sysctl.conf
sudo cp /home/vagrant/hardened_files/sysctl_ufw.conf /etc/ufw/sysctl.conf
sudo systemctl disable apport.service
