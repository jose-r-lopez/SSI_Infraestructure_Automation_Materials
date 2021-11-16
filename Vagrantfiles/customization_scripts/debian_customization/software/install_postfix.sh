#!/bin/bash

echo ">>>>> Silently installing PostFix <<<<<"
debconf-set-selections <<< "postfix postfix/mailname string this.is.private"
debconf-set-selections <<< "postfix postfix/main_mailer_type string 'My Server'"
apt-get install --assume-yes postfix

echo ">>>>> Hardening Postfix daemon <<<<<"
sudo cp /home/vagrant/hardened_files/main.cf /etc/postfix/main.cf
sudo postconf -e disable_vrfy_command=yes