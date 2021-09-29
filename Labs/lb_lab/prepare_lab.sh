#!/bin/bash

cd ../../Dockerfiles
sudo ./build.sh -d ./ubuntus/ubuntu_base
sudo ./build.sh -d ./ubuntus/ubuntu_ssh
sudo ./build.sh -d ./ubuntus/ubuntu_nginx_proxy
sudo ./build.sh -d ./kalis/kali_base
cd ../Labs/lb_lab
