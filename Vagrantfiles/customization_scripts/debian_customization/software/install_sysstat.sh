#!/bin/bash

echo ">>>>> Installing SysStat <<<<<"
sudo apt-get -y install sysstat
sudo cp /home/vagrant/hardened_files/sysstat /etc/default/sysstat


