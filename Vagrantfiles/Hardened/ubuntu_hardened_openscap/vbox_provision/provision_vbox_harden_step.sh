PROVISIONED="/home/vagrant/PROVISIONED_S2";

if [[ -f $PROVISIONED ]]; then
  echo "Step 2 already executed. Exiting...";
  exit;
else
  echo "Provisioning Step 2 (Hardening)";
fi

echo ">>>>> Installing antimalware software <<<<<"
sudo apt-get -y install clamav
sudo apt-get -y install chkrootkit

echo ">>>>> Enabling firewall and authorizing ssh <<<<<"
sudo ufw allow ssh
sudo ufw allow 53245
sudo ufw --force enable

echo ">>>>> Installing packages that increment the base Ubuntu security <<<<<"
sudo apt-get -y install debsums apt-show-versions rand debsecan

echo ">>>>> Installing Process Accounting <<<<<"
sudo apt-get -y install acct
sudo touch /var/log/pacct
sudo accton /var/log/pacct

echo ">>>>> Silently installing PostFix <<<<<"
debconf-set-selections <<< "postfix postfix/mailname string this.is.private"
debconf-set-selections <<< "postfix postfix/main_mailer_type string 'My Server'"
apt-get install --assume-yes postfix

echo ">>>>> Installing Log file checker <<<<<"
sudo apt-get -y install logcheck

echo ">>>>> Installing SysStat <<<<<"
sudo apt-get -y install sysstat
sudo cp /home/vagrant/hardened_files/sysstat /etc/default/sysstat

echo ">>>>> Installing Auditd <<<<<"
sudo apt-get -y install auditd

echo ">>>>> Installing USB Guard <<<<<"
sudo apt-get -y install usbguard
usbguard generate-policy > rules.conf
sudo install -m 0600 -o root -g root rules.conf /etc/usbguard/rules.conf
sudo systemctl restart usbguard

echo ">>>>> Installing Fail2Ban <<<<<"
sudo apt-get install -y fail2ban

echo ">>>>> Installing PortSentry <<<<<"
echo "\n" | sudo DEBIAN_FRONTEND=noninteractive apt-get install -y portsentry

echo ">>>>> Installing System Files with enhanced security configuration <<<<<"
sudo cp /home/vagrant/hardened_files/login.defs /etc/login.defs
sudo cp /home/vagrant/hardened_files/issue /etc/issue
sudo cp /home/vagrant/hardened_files/issue.net /etc/issue.net
sudo cp /home/vagrant/hardened_files/sysstat /etc/default/sysstat
sudo cp /home/vagrant/hardened_files/profile /etc/profile
sudo cp /home/vagrant/hardened_files/bash.bashrc /etc/bash.bashrc

echo ">>>>> Avoid using common passwords <<<<<"
sudo apt-get install libpam-cracklib -y
sudo wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/xato-net-10-million-passwords-1000000.txt /usr/share/dict/ -O /usr/share/dict/million.txt
sudo create-cracklib-dict /usr/share/dict/million.txt

echo ">>>>> Installing OpenSCAP <<<<<"
sudo apt-get -y install libopenscap8
wget https://github.com/ComplianceAsCode/content/releases/download/v0.1.58/scap-security-guide-0.1.58-oval-5.10.zip
unzip scap-security-guide-0.1.58-oval-5.10.zip
sudo oscap xccdf eval --remediate --profile xccdf_org.ssgproject.content_profile_cis --results cis.xml --report cis.html ./scap-security-guide-0.1.58-oval-5.10/ssg-ubuntu1804-ds-1.2.xml

echo ">>>>> Hardening SSH and Postfix daemons <<<<<"
sudo cp /home/vagrant/hardened_files/sshd_config /etc/ssh/sshd_config
sudo cp /home/vagrant/hardened_files/main.cf /etc/postfix/main.cf
sudo postconf -e disable_vrfy_command=yes

echo ">>>>> Implement Kernel Hardening <<<<<"
sudo cp /home/vagrant/hardened_files/10-kernel-hardening.conf /etc/sysctl.d/10-kernel-hardening.conf
sudo cp /home/vagrant/hardened_files/10-network-security.conf /etc/sysctl.d/10-network-security.conf
sudo cp /home/vagrant/hardened_files/sysctl.conf /etc/sysctl.conf
sudo cp /home/vagrant/hardened_files/sysctl_ufw.conf /etc/ufw/sysctl.conf
sudo systemctl disable apport.service

echo ">>>>> Implement Permission Restrictions (Compilers, Directories) <<<<<"
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

echo ">>>>> Disable rare network protocols <<<<<"
sudo cp /home/vagrant/hardened_files/rare_proto.conf /etc/modprobe.d

echo ">>>>> Disable core dumps <<<<<"
sudo cp /home/vagrant/hardened_files/limits.conf /etc/security/limits.conf

echo ">>>>> Reconfigure Fail2Ban to the real ssh port <<<<<"
sudo cp /home/vagrant/hardened_files/services /etc/services

echo ">>>>> Install password policies support <<<<<"
sudo apt-get -y install libpam-cracklib
sudo cp /home/vagrant/hardened_files/common-password a /etc/pam.d/common-password

echo ">>>>> Activate nmap scan permanent blocks to port 22 (PortSentry) <<<<<"
sudo cp /home/vagrant/hardened_files/portsentry /etc/default/portsentry
sudo cp /home/vagrant/hardened_files/portsentry.conf /etc/portsentry/portsentry.conf

echo ">>>>> Enable unattended upgrades <<<<<"
sudo apt-get -y install unattended-upgrades apt-listchanges
sudo dpkg-reconfigure -f noninteractive -plow unattended-upgrades

echo ">>>>> Enable ARP Monitoring Software <<<<<"
sudo apt-get -y install arpwatch
sudo systemctl enable arpwatch@eth0
sudo systemctl start arpwatch@eth0

echo ">>>>> Creating a malicious host black list <<<<<"
sudo cp /home/vagrant/hardened_files/update_hosts.sh /home/vagrant
sudo chmod u+x /home/vagrant/update_hosts.sh
/home/vagrant/update_hosts.sh

echo ">>>>> Cleaning up <<<<<"
sudo apt-get -y autoremove 
sudo apt-get -y autoclean

sudo rm -r /home/vagrant/scap-security-guide-0.1.58-oval-5.10
sudo rm /home/vagrant/scap-security-guide-0.1.58-oval-5.10.zip
sudo rm /home/vagrant/cis.html
sudo rm /home/vagrant/cis.xml
sudo rm /home/vagrant/rules.conf
sudo rm -r /home/vagrant/hardened_files

touch $PROVISIONED;
