# Our base Apache and SSH image
FROM ssi/ubuntu_apache_ssh

# Avoid errors from asking for user input
ENV DEBIAN_FRONTEND=noninteractive

# Activate proxy functionality
RUN 	a2enmod proxy && \
	a2enmod proxy_http


# Copy and run an initialization script to start the appropriate servers in the containers
COPY container_init.sh container_init.sh
RUN chmod +x container_init.sh
CMD ["./container_init.sh"]

LABEL 	maintainer="Jose Manuel Redondo Lopez" \
	version="1.0" \
	description="Base Ubuntu Reverse Proxy Apache HTTP web server with SSH image for SSI laboratories (2020-2021)"
