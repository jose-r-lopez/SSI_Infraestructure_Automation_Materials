# SSI_Materials

In the course Seguridad de Sistemas Informáticos (SSI, Computer Systems Security) from the Escuela de Ingeniería Informática of the University of Oviedo (https://ingenieriainformatica.uniovi.es/) we have developed a series of automated infrastructure deployment scripts that we think it may be useful for some people, so we decided to share them to enable our students or anyone to use and experiment with them if they please. We will be updating this repo over time with new materials we can share. At the moment we have:

## Vagrantfiles ##

The goal of this files is to create a folder, download them to this folder, install Vagrant in your OS and review and/or modify the files to build a VM automatically adapted to your needs.

### Ubuntu_full ###

A full Ubuntu 18.04 machine VM, 2 cores, 2Gb of RAM and 80Gb of dynamic hard disk. It has been prepared for VirtualBox, Hyper-V and VMWare Desktop (this last one could not be tested). It algo includes:
  * Various optimizations for each Virtualilzation Platforms (**NOTE**: in the VirtualBox part, one of these optimization could not be implemented in some MAC OS versions).
  * A custom shared folder (change it at will)
  * Some fancy configuration for the nano editor and the TMUX multi-terminal software, including mouse integration.
  * A custom provision bash script installing: full updates, the XFC4 GUI, some common tools for our course, a sudoer user (ssiuser) with a known password (please change it), Docker and Docker Compose. It also changes they keyboard layour to Spanish. **PLEASE DO REVIEW THIS FILE BEFORE INSTALLING ANYTHING**, to adapt their contents to your needs. 
  * Some trivial scripts to do common operations without requiring Vagrant knowledge: build (run first), run, update (re-provision the VM) and destroy the created VM. 
      
