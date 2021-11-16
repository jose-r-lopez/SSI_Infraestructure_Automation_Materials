#!/bin/bash

echo ">>>>> Creating a malicious host black list <<<<<"
sudo cp /home/vagrant/hardened_files/update_hosts.sh /home/vagrant
sudo chmod u+x /home/vagrant/update_hosts.sh
/home/vagrant/update_hosts.sh

