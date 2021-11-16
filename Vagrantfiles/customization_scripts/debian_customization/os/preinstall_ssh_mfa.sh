#!/bin/bash

echo ">>>>> Add Preinstallation for enabling SSH MFA with Google Authenticator <<<<<"
sudo apt-get -y install libpam-google-authenticator

echo ">>>>> Follow this tutorial to complete installation: https://derechodelared.com/segundo-factor-de-autenticacion-ssh/ <<<<<"
