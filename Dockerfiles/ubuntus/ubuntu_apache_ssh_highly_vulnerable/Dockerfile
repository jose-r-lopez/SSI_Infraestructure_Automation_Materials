# Running from our previous vulnerable Apache + ssh image
FROM ssi/ubuntu_apache_ssh

# Avoid errors from asking for user input
ENV DEBIAN_FRONTEND=noninteractive

# Prepare the base packages with some useful tools in a way image size is reduced.
RUN 	apt-get -y update && \
	apt-get install -y --no-install-recommends \
		telnetd \
		update-inetd \
		xinetd \
		vsftpd \
	&& rm -rf /var/lib/apt/lists/*


# Add a sudoer user with a crappy password
ARG SSH_PASS=1234
RUN 	useradd -m -s /bin/bash -p $(openssl passwd -1 $SSH_PASS) admin \ 
	&& adduser admin sudo
	
# Replace service configurations for insecure ones
RUN rm /etc/ssh/ssh_config && rm /etc/vsftpd.conf && rm /etc/ftpusers
ADD ./ssh_config /etc/ssh
ADD ./vsftpd.conf /etc/vsftpd.conf
ADD ./ftpusers /etc/ftpusers

# Enable a (very bad) root password
RUN echo "root:letmein" | chpasswd

# Enable telnet service
RUN echo "service telnet \n \
{ \n \
    disable = no \n \
    flags           = REUSE \n \
    socket_type     = stream \n \
    wait            = no \n \
    user            = root \n \
    server          = /usr/sbin/in.telnetd \n \
    log_on_failure  += USERID \n \
}" | tee -a /etc/xinetd.d/telnet && \
    rm -f /etc/securetty

# Copy and run an initialization script to start the appropriate servers in the containers
COPY container_init.sh container_init.sh
RUN chmod +x container_init.sh
CMD ["./container_init.sh"]

LABEL 	maintainer="Jose Manuel Redondo Lopez" \
	version="1.0" \
	description="Base Ubuntu Apache HTTP web server with SSH, a vulnerable user and FTP and Telnet services image for SSI laboratories (2020-2021)"
