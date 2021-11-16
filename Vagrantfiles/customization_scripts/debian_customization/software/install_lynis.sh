#!/bin/bash

echo ">>>>> Adding Lynis repository and updating apt <<<<<"
sudo wget -O - https://packages.cisofy.com/keys/cisofy-software-public.key | sudo apt-key add -
echo "deb https://packages.cisofy.com/community/lynis/deb/ stable main" | sudo tee /etc/apt/sources.list.d/cisofy-lynis.list
sudo apt-get -y update

echo ">>>>> Installing Lynis audit tool <<<<<"
sudo apt-get -y install lynis
