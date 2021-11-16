#!/bin/bash

sudo dnf -y install epel-release
sudo dnf -y install gcc make perl kernel-devel kernel-headers bzip2 dkms
sudo dnf update kernel-*