#!/bin/bash

echo ">>>>> Installing AIDE <<<<<"
sudo apt-get -y install aide aide-common
sudo aideinit

sudo cp /home/vagrant/hardened_files/root /var/spool/cron/crontabs
