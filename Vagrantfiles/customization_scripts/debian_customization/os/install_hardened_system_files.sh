#!/bin/bash

echo ">>>>> Installing System Files with enhanced security configuration <<<<<"
sudo cp /home/vagrant/hardened_files/login.defs /etc/login.defs
sudo cp /home/vagrant/hardened_files/issue /etc/issue
sudo cp /home/vagrant/hardened_files/issue.net /etc/issue.net
sudo cp /home/vagrant/hardened_files/sysstat /etc/default/sysstat
sudo cp /home/vagrant/hardened_files/profile /etc/profile
sudo cp /home/vagrant/hardened_files/bash.bashrc /etc/bash.bashrc
