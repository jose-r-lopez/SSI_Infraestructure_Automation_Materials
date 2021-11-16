#!/bin/bash

echo ">>>>> Installing Process Accounting <<<<<"
sudo apt-get -y install acct
sudo touch /var/log/pacct
sudo accton /var/log/pacct
