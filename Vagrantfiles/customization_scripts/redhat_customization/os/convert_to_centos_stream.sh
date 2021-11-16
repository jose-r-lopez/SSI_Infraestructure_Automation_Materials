#!/bin/bash

echo ">>>>> Converting distro to CentOS Stream <<<<<"

sudo dnf install centos-release-stream -y
sudo dnf -y swap centos-{linux,stream}-repos
sudo dnf -y distro-sync