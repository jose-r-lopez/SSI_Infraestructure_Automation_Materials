#!/bin/bash

echo ">>>>> Add GRUB password for root user (test123...) <<<<<"
sudo chmod ugo+x /home/vagrant/hardened_files/42_custom
sudo chmod o+r /home/vagrant/hardened_files/42_custom
sudo cp /home/vagrant/hardened_files/42_custom /etc/grub.d/42_custom
sudo update-grub

