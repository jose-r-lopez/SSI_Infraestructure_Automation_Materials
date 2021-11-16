#!/bin/bash

echo ">>>>> Updating package base <<<<<"
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/ms-teams stable main" > /etc/apt/sources.list.d/teams.list'

sudo apt-get -y update

echo ">>>>> Installing Teams <<<<<" 
sudo apt-get -y install teams