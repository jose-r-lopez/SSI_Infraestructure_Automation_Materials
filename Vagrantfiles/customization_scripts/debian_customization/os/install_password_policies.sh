#!/bin/bash

echo ">>>>> Install password policies support <<<<<"
sudo apt-get -y install libpam-cracklib
sudo cp /home/vagrant/hardened_files/common-password /etc/pam.d/common-password

