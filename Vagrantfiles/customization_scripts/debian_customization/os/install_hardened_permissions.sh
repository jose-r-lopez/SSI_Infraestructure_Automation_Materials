#!/bin/bash

echo ">>>>> Install Hardened Permission Restrictions (Compilers, Directories) <<<<<"
sudo chmod og-rx /usr/bin/as
sudo chmod og-rx /usr/bin/cc
sudo chmod og-rx /usr/bin/gcc
sudo chmod og-rx /usr/bin/g++
sudo chmod og-rx /usr/bin/gcc-7
sudo chmod og-rx /usr/bin/g++-7

sudo chmod o-rx /home/vagrant
sudo chmod o-rx /etc/sudoers.d

sudo chmod og-rwx /etc/crontab
sudo chmod og-rwx /etc/cron.d
sudo chmod og-rwx /etc/cron.daily/
sudo chmod og-rwx /etc/cron.hourly/
sudo chmod og-rwx /etc/cron.monthly/
sudo chmod og-rwx /etc/cron.weekly/
sudo chmod og-rwx /etc/at.deny
sudo chmod og-rwx /etc/ssh/sshd_config