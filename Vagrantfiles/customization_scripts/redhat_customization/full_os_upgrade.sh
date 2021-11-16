#!/bin/bash

echo ">>>>> Updating package base <<<<<"
sudo yum -y update
     
echo ">>>>> Upgrading packages <<<<<"
sudo yum -y upgrade