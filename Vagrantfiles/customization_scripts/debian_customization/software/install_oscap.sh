#!/bin/bash

echo ">>>>> Installing OpenSCAP <<<<<"
sudo apt-get -y install libopenscap8
wget https://github.com/ComplianceAsCode/content/releases/download/v0.1.58/scap-security-guide-0.1.58-oval-5.10.zip
unzip scap-security-guide-0.1.58-oval-5.10.zip
sudo oscap xccdf eval --remediate --profile xccdf_org.ssgproject.content_profile_cis --results cis.xml --report cis.html ./scap-security-guide-0.1.58-oval-5.10/ssg-ubuntu1804-ds-1.2.xml

sudo rm -r /home/vagrant/scap-security-guide-0.1.58-oval-5.10
sudo rm /home/vagrant/scap-security-guide-0.1.58-oval-5.10.zip
sudo rm /home/vagrant/cis.html
sudo rm /home/vagrant/cis.xml
sudo rm /home/vagrant/rules.conf