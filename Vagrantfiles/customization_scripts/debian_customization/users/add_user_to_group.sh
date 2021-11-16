#!/bin/bash

echo ">>>>> Adding user '$1' to '$2' group <<<<<"
sudo usermod -aG $2 $1