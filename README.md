# SSI_Materials

In the course *Seguridad de Sistemas Informáticos* (SSI, Computer Systems Security) from the *Escuela de Ingeniería Informática* of the University of Oviedo (https://ingenieriainformatica.uniovi.es/) we have developed a series of automated infrastructure deployment scripts that we think it may be useful for some people, so we decided to share them to enable our students (or anyone ;)) to use and experiment with them if they please. We will be updating this repo over time with new materials we can share. 

**NOTE**: Make sure you check my tool cheatsheet repository to facilitate learning how to use these tools inside this laboratories! (https://github.com/jose-r-lopez/SSI_Cheatsheets).

At the moment we have:

## Vagrantfiles ##

The goal of these files is to create a folder, download them to it, install *Vagrant* (https://www.vagrantup.com/) in your OS (it is multiplatform!), and review and/or modify the files to build a VM automatically adapted to your needs. **NOTE**: Due to the experimental *disks* features, the default version of *Vagrant* that comes with the *Ubuntu* repos (at least until 20.04) cannot run these VMs. **PLEASE USE THE LATEST VERSION VAGRANT AVAILABLE IN THE OFFICIAL VENDOR PAGE** (or remove the disks feature, but then you cannot resize it to your needs :( ). 

### Ubuntu_full ###

A full *Ubuntu 18.04* machine VM, 2 cores, 2Gb of RAM and 80Gb of dynamic hard disk. It has been prepared for *VirtualBox*, *Hyper-V* and *VMWare Desktop* (this last one could not be tested). It also includes:
  * Various optimizations for each virtualilzation platform (**NOTE**: in the *VirtualBox* part, one of these optimization might not be implemented in some MAC OS versions, if an error occurs when building the VM, just comment the offending feature line in the file).
  * A custom shared folder (change it at will)
  * Some fancy configuration for the *nano* editor and the TMUX multi-terminal software, including mouse integration, to facilitate editing files (remember that this is a VM for teaching! :)) and the *Midnight Commander* text-based file browser.
  * A custom provision bash script installing: full updates, the XFC4 GUI (yes, I know, but, again, this is a teaching VM ;)), some common tools for our course, a *sudoer* user (*ssiuser*) with a known password (please change it!), *Docker* and *Docker Compose*. It also changes they keyboard layout to Spanish (we are a Spanish University! :D). **PLEASE DO REVIEW THIS FILE BEFORE INSTALLING ANYTHING**, to adapt their contents to your needs. 
  * Some trivial scripts to do common operations without requiring *Vagrant* knowledge: *build* (run first), *run* (run second), *update* (re-provision the VM) and *destroy* (so you have to rebuild it after) the created VM. 

### Ubuntu_cmd_docker ###

This is a version of the previous VM without the XFCE4 GUI and associated programs and also minimizing the required installation time and space by not installing recommended packages and wiping the apt cache at the end. The goal is that if you export this VM to an .ova the required space is the less possible. *Docker* and *Docker Compose* (and Guest Additions) are still installed for lab fun :)

### Ubuntu_cmd ###

A version of *Ubuntu_cmd_docker* without *Docker* and *Docker Compose*. It is a throw-away testing VM with all the *Vagrant* optimizations we implemented. Guest Additions are still installed.

These VMs have been used and tested without problems from over 100 people. They also rely on official repos of all software installed. Hope you find them useful!
      
## Dockerfiles ##

These are a collection of *Dockerfiles* that build *Ubuntu* and *Kali* images suited for specific purposes, such as testing general OS commands, web server, SSH server, etc., all fulfilling a requirement of the different topics of our course. We also supply some utility scripts for your convenience. All *Dockerfiles* use official product repos to build the images, and are configured to minimize the space taken by each image and speed up its build process. 

These images are meant to mimic the behavior of a typical bash command line in a Linux VM because this is the most convenient way of using them in our course. This means that we installed extra stuff to facilitate this, such as the nano editor, TMUX multi-terminal software, the *Midnight Commander* text-based file browser, and other utilities. You should not install all this stuff if you are using these containers to deploy a product, saving even more space.

We did not use the *Alpine* base image because our students work with *Ubuntu* all the year, and we want to keep this base OS at all times to avoid problems. However, if you give a try to *Alpine* in the FROM clause of the *Dockerfiles* and this image has everything you need, the image size will greatly decrease.

**IMPORTANT NOTICE: These images are created exclusively for teaching, thus we did not take image hardening into consideration. Images are run as *root* and no explicit security measure was taken into consideration to build them. Thus, if you decide to use this for actual product deployment, you should follow tried and tested Docker hardening procedures like the ones I describe here:**

* https://www.researchgate.net/publication/352106084_Docker_Strong_Foundations_for_Verifiable_Secure_Deployments
* https://www.youtube.com/watch?v=Kx2lxnHRhRs&t=1542s

Please, do take this warning very seriously, these are **NOT** production-ready images, just convenient teaching materials useful for acquiring experience with several tools. 

To use all this you need to install *Docker* (https://www.docker.com/) in a machine or VM. The VM built with the previous *Vagrantfile* installs it precisely with this in mind ;) ;) ;) (yeah, we build labs with different intercommunicated containers inside that VM, saving TONS of resources if compared with a "traditional" all-VM approach, and we think it is beatiful! :D). Once this is clarified, let's describe the contents: 

* **build.sh**: Our "workhorse" script to build any image we need. We just need to use the -d parameter to pass a path that should have the following contents (Ex. *./build.sh -d ./ubuntus/ubuntu_base/*):
  * A *Dockerfile* with the instructions of the image to build
  * A *img_name.txt* file with the name of the image to be built
  * Any other necessary file used in the Dockerfile
* **start_cmd.sh**: After building an image, this used the same approach with the -d parameter to run a container of the image built with the contents of the specified path (./start_cmd.sh -d ./ubuntus/ubuntu_base/).
* **start_cmd_writable_dir.sh**: Same as previous, but allow to specify a host and a guest path that can be used to easily share files between the host and the containers. Two extra parameters allows to map any path, but if not provided a default one is used (./start_cmd_writable_dir.sh -d ./ubuntus/ubuntu_base/).
* **start_detached.sh**: Same as *start_cmd.sh*, but no bash shell is created. This is meant to run containers that keep a foreground service running. If not, the container will be terminated inmediately!

Once described the utility scripts, let's enumerate the *Docker* images we have uploaded (**NOTE:** We have minimized the size of these images, and that means that the *apt* cache has been deleted. If you wanna install something in these images, please run *apt update* first):

### Ubuntus ###

* **ubuntus/ubuntu_base**: An *Ubuntu 18.04* image with some common commands to test. This is also the base of all the following *Ubuntu* images, so **you must ensure that this image is built first before using any of the others!**
* **ubuntus/ubuntu_apache**: Uses the previous image and adds the Apache Web Server. Please build the *ubuntus/ubuntu_base* first!
* **ubuntus/ubuntu_ssh**: Uses the *ubuntus/ubuntu_base* image and adds a SSH server, a user and a trivial password (**NOT SECURE!**). Please build the *ubuntus/ubuntu_base* first!
* **ubuntus/ubuntu_apache_ssh**: Uses the *ubuntus/ubuntu_apache* image and adds a SSH server, a user and a trivial password (**NOT SECURE!**). Please build the *ubuntus/ubuntu_apache* first!. We also provide a sample script on how you could map any web page you have in the host to be served by this container. 
* **ubuntus/ubuntu_apache_ssh_highly_vulnerable**: Uses the *ubuntus/ubuntu_apache_ssh* image and adds a FTP and a telnet server and a *sudoer* user and a trivial password (**NOT SECURE!**). Please build the *ubuntus/ubuntu_apache_ssh* first!.
* **ubuntus/ubuntu_apache_proxy**: Just uses *ssi/ubuntu_apache_ssh* to enable reverse proxy functionality, installing no additional packages. The initialization script expects to find an *apache2.conf* file to copy to */etc/apache2/* in the */cluster_conf* directory. This way, it is easy using *Docker Compose* to map a custom *apache2.conf* file to this folder and use it to configure different labs with the same infrastructure (see *proxy_lab* for details!).
* **ubuntus/ubuntu_nginx_proxy**: Uses *ssi/ubuntu_ssh* (please build it first) to install *Nginx* and configure it as a load balancer. It is prepared to copy the *nginx.conf* file and the *default* website configuration files from the */cluster_conf* directory (see the *lb_lab* for a working example!)
* **ubuntus/ubuntu_dns**: Uses *ssi/ubuntu_base* (please build it first) to install the DNS service *Bind9* (*named*) and configure it with the contents of the */dns_conf* folder that are copied to the */etc/bind/* folder upon start. Please include there the necessary *named.local.conf*, *named.conf.options* and *zones* folder with the zones you want to define.


### Kalis ###

* **kalis/kali_base**: A *Kali Linux* image with the same interactive capabilities of the equivalent Ubuntu one and also adding nmap. This is also the base of all the following *Kali* images, so **you must ensure that this image is built first before using any of the others!** 
* **kalis/kali_crypto**: Adds to the base *Kali* several tools to perform several password brute-forcing, dictionary generation and metadata extraction operations. It also incoporates commented instructions to add and uncompress the rockyou.txt password dictionary (that you will have to download) and to copy sample passwd and shadow files to test brute-forcing operations (that you will have to provide). Please build the *kalis/kalil_base* first!
* **kalis/kali_exploiting**: Adds to the base *Kali* several tools to perform several exploiting operations, including a *Metasploit Framework* installation. Please build the *kalis/kalil_base* first!. **NOTE: This image is actually quite large! (1.4Gb approximately)**. 

## Labs ##

While the VM is our "test field" and the *Docker* images are our "test subjets", we coordinate *Docker* containers inside the VM thanks to *Docker Compose* (https://docs.docker.com/compose/) files, that run and communicate containers of different images to run the labs we want for each laboratory. To show how we do that, we have provided some labs. Once you install *Docker Compose*, all labs are automated with the following scripts:

* **prepare_lab.sh**: Run this script first to create all the Docker images involved in this lab. Place the Labs directory in the same directory as the Dockerfiles directory, and this wll ensure that all the images will be built automatically without having to worry about the dependencies between them.
* **build_lab.sh**: Runs this lab. Please do not kill the process on the terminal you run this script, or the lab will be destroyed. To continue working, just spawn another terminal.
* **enter_X.sh**: Login on each container of the infrastructure

The provided labs are:

* **sample_lab**: laboratory that communicates a *kali_base* container called *kali_attack* with a *ubuntu_apache_ssh_highly_vulnerable* container called *ubuntu_victim* for testing *nmap*
* **proxy_lab**: laboratory that communicates a Kali container (*labproxy_kali*) with an Ubuntu reverse proxy (*reverse_proxy*) with a custom 198.62.0.0/16 network (*front_net*). Additionally, the reverse proxy communicates with a web server via another different custom 172.106.0.0/16 network (*back_net*). Performing a *curl* from the Kali to the IP 172.62.0.3 (reverse proxy static IP) returns the web page on the web server, served from 172.106.0.3 (web server static IP). Note that the *Kali* is unable to reach the web server IP, and the reverse proxy is the only "gate" to access the web. This schema can be enhanced to create your own reverse proxy "hide all the workings of my network" fun! :D
* **proxy_lab2**: Version of the previous one, but the reverse proxy hide three different websites, so accessing 172.62.0.3/web1, 172.62.0.3/web2 and 172.62.0.3/web3 show three different webpages. This is a more "realistic" use case than the previous one :) 
* **lb_lab**: A Round-Robin Load balancer made with an *Nginx upstream* configuration context and three *Apache* nodes behind it. If from the *Kali* you *curl* to the reverse proxy IP you will obtain a response from different web servers using a Round-Robin algorithm. **NOTE**: If you feel like testing other load distribution algorithms, I strongly recommend you to check this web page: http://nginx.org/en/docs/http/load_balancing.html. This allows you to make simple changes to the *nginx.conf* of this lab to try other approaches. The *ip_hash* directive is specially interesting, as it uses the *sticky session* concept (once a node of a cluster servers a client, this client is served always by the same node) to achieve session persistence (unless the node dies! :D). Thanks Diego Suarez (@mafias in *Twitter*) for reminding me this!  
* **dns_lab**: This is a lab composed by 3 web servers, an "attacking" *Kali* and a *Bind9* DNS container attached to every other container. This way, by using *web1.ssi.es* you can access the first container, while *web2.ssi.es* and *web3.ssi.es* accesses the second and the third. *kali.ssi.es* can be used to address the *Kali* container. This setup makes very easy to create labs that can use DNS names instead of IPs, as you have only to change the contents of the *dns_conf* lab folder to adapt them to your needs. No more IPs! :D

I hope you enjoy experimenting with these materials! 

## Coming soon! ## (if possible, and not necessarily in this order :D)

- A lab with a working the *mod_security* WAF for web bombarding fun :P
- A lab with a working *Suricata* IDS, because the guy from "What If?" is not the only watching :P
- A lab with a vulnerable web that is also part of my portfolio of public tools. Although I don't know if I can pull this one out :P
- Terraform examples
- LXC examples
 
