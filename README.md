# SSI_Materials

In the course *Seguridad de Sistemas Informáticos* (SSI, Computer Systems Security) from the *Escuela de Ingeniería Informática* of the University of Oviedo (https://ingenieriainformatica.uniovi.es/) we have developed a series of automated infrastructure deployment scripts that we think it may be useful for some people, so we decided to share them to enable our students (or anyone ;)) to use and experiment with them if they please. We will be updating this repo over time with new materials we can share. At the moment we have:

## Vagrantfiles ##

The goal of these files is to create a folder, download them to it, install *Vagrant* (https://www.vagrantup.com/) in your OS (it is multiplatform!) and review and/or modify the files to build a VM automatically adapted to your needs.

### Ubuntu_full ###

A full *Ubuntu 18.04* machine VM, 2 cores, 2Gb of RAM and 80Gb of dynamic hard disk. It has been prepared for *VirtualBox*, *Hyper-V* and *VMWare Desktop* (this last one could not be tested). It also includes:
  * Various optimizations for each virtualilzation platform (**NOTE**: in the *VirtualBox* part, one of these optimization might not be implemented in some MAC OS versions, if an error occurs when building the VM, just comment the offending feature line in the file).
  * A custom shared folder (change it at will)
  * Some fancy configuration for the *nano* editor and the TMUX multi-terminal software, including mouse integration, to facilitate editing files (remember that this is a VM for teaching! :)).
  * A custom provision bash script installing: full updates, the XFC4 GUI (yes, I know, but, again, this is a teaching VM ;)), some common tools for our course, a sudoer user (*ssiuser*) with a known password (please change it!), *Docker* and *Docker Compose*. It also changes they keyboard layout to Spanish (we are a Spanish University! :D). **PLEASE DO REVIEW THIS FILE BEFORE INSTALLING ANYTHING**, to adapt their contents to your needs. 
  * Some trivial scripts to do common operations without requiring *Vagrant* knowledge: *build* (run first), *run* (run second), *update* (re-provision the VM) and *destroy* (so you have to rebuild it after) the created VM. 

This VM has been used and tested without problems from over 100 people. It also relies on official repos of all software installed. Hope you find it useful!
      
## Dockerfiles ##

These are a collection of *Dockerfiles* that build *Ubuntu* and *Kali* images suited for specific purposes, such as testing general OS commands, web server, SSH server, etc., all fulfilling a requirement of the different topics of our course. We also supply some utility scripts for your convenience. All *Dockerfiles* use official product repos to build the images, and are configured to minimize the space taken by each image and speed up its build process. 

These images are meant to mimic the behavior of a typical bash command line in a Linux VM because this is the most convenient way of using them in our course. This means that we installed extra stuff to facilitate this, such as the nano editor, TMUX multi-terminal software, and other utilities. You should not install all this stuff if you are using these containers to deploy a product, saving even more space.

We did not use the *Alpine* base image because our students work with *Ubuntu* all the year, and we want to keep this base OS at all times to avoid problems. However, if you give a try to *Alpine* in the FROM clause of the *Dockerfiles* and this image has everything you need, the image size will greatly decrease.

**IMPORTANT NOTICE: These images are created exclusively for teaching, thus we did not take image hardening into consideration. Images are run as root and no explicit security measure was taken into consideration to build them. Thus, if you decide to use this for actual product deployment, you should follow tried and tested Docker hardening procedures like the ones I describe here:**

* https://www.researchgate.net/publication/352106084_Docker_Strong_Foundations_for_Verifiable_Secure_Deployments
* https://www.youtube.com/watch?v=Kx2lxnHRhRs&t=1542s

Please, do take this warning very seriously, these are **NOT** production-ready images, just convenient teaching materials useful for acquiring experience with several tools. 

To use all this you need to install Docker in an OS. The VM build with the previous Vagrantfile installs it precisely with this in mind ;) ;) ;) (yeah, we build labs with different intercommunicated containers inside that VM saving TONS of resources if compared with a "tradition" all-VM approach, and we think it is beatiful! :D). Once this is clarified, let's describe the contents: 

* *build.sh*: Our "workhorse" script to build any image we need. We just need to use the -d parameter to pass a path that should have the following contents (Ex. ./build.sh -d ./ubuntus/ubuntu_base/):
 * A *Dockerfile* with the instructions of the image to build
 * A *img_name.txt* file with the name of the image to be built
 * Any other necessary file used in the Dockerfile
* *start_cmd.sh*: After building an image, this used the same approach with the -d parameter to run a container of the image built with the contents of the specified path (./start_cmd.sh -d ./ubuntus/ubuntu_base/).
* *start_cmd_writable_dir.sh*: Same as previous, but allow to specify a host and a guest path that can be used to easily share files between the host and the containers. Two extra parameters allows to map any path, but if not provided a default one is used (./start_cmd_writable_dir.sh -d ./ubuntus/ubuntu_base/).
* *start_detached.sh*: Same as *start_cmd.sh*, but no bash shell is created. This is meant to run containers that keep a foreground service running. If not, the container will be terminated inmediately!

Once described the utility scripts, let's enumerate the *Docker* images we have uploaded (**NOTE:** We have minimized the size of these images, and that means that the *apt* cache has been deleted. If you wanna install something in these images, please run *apt update* first):

### Ubuntus ###

* *ubuntus/ubuntu_base*: An *Ubuntu 18.04* image with some common commands to test. This is also the base of all the following Ubuntu images, so **you must ensure that this image is built first before using any of the others!**
* *ubuntus/ubuntu_apache*: Uses the previous image and adds the Apache Web Server. Please build the *ubuntus/ubuntu_base* first!
* * *ubuntus/ubuntu_ssh*: Uses the *ubuntus/ubuntu_base* image and adds a SSH server, a user and a trivial password (**NOT SECURE!**). Please build the *ubuntus/ubuntu_base* first!
* * *ubuntus/ubuntu_apache_ssh*: Uses the *ubuntus/ubuntu_apache* image and adds a SSH server, a user and a trivial password (**NOT SECURE!**). Please build the *ubuntus/ubuntu_apache* first!. We also provide a sample script on how you could map any web page you have in the host to be served by this container. 

### Kalis ###
* kalis/kali_base: 
