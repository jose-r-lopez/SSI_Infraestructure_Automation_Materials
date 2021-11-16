#!/bin/bash

echo ">>>>> Changing default mount options for /dev, /dev/shm and /run <<<<<"
sudo chmod ugo+x /home/vagrant/hardened_files/rc.local
sudo cp /home/vagrant/hardened_files/rc.local /etc/rc.local
# sudo systemctl enable rc-local.service