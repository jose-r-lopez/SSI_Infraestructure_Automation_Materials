#!/bin/bash

echo ">>>>> Avoid using common passwords <<<<<"
sudo apt-get install libpam-cracklib -y
sudo wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/xato-net-10-million-passwords-1000000.txt /usr/share/dict/ -O /usr/share/dict/million.txt
sudo create-cracklib-dict /usr/share/dict/million.txt

