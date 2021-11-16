#!/bin/bash
echo ">>>>> Removing packages and leaving only the Ubuntu Server metapackage <<<<<"

# just in case we are retrying and apt is in a bad state
dpkg --configure -a

# DEBIAN_FRONTEND=noninteractive is useful for scripting. 
# prevents getting prompts that will hang our script.

# ubuntu-server is a meta package that depends on the packages 
# in ubuntu-minimal install. ubuntu-minimal is smaller, but
# unfortunately makes the machine not to boot again :(
# Need aptitude to autoremove everything we don't depend on.
DEBIAN_FRONTEND=noninteractive apt-get --assume-yes --no-install-recommends install aptitude ubuntu-server

# mark all packages as automatically installed except
# ubuntu-server, kernel, systemd, openssh, netplan and sudo.
# These are the minimal ones for Vagrant to work
# All others that aren't dependencies will be removed since
# we have told apt they are automatically installed 
DEBIAN_FRONTEND=noninteractive aptitude --assume-yes markauto '~i!?name(ubuntu-server~|linux-generic~|systemd~|openssh-server|netplan|sudo)'

# purge all removed packages that were not purged.
# removes leftover configuration
DEBIAN_FRONTEND=noninteractive aptitude --assume-yes purge '~c'
