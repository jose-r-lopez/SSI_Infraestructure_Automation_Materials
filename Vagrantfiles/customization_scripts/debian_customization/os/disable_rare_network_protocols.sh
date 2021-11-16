#!/bin/bash

echo ">>>>> Disable rare network protocols <<<<<"
sudo cp /home/vagrant/hardened_files/rare_proto.conf /etc/modprobe.d

