#!/bin/bash

echo ">>>>> Installing Auditd <<<<<"
sudo apt-get -y install auditd

echo ">>>>> Copying CIS Benchmark Ubuntu 18.04 audit policy rules <<<<<"
sudo cp /home/vagrant/hardened_files/audit/*.rules /etc/audit/rules.d/

