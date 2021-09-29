# Our base Apache and SSH image
FROM ssi/ubuntu_ssh

# Avoid errors from asking for user input
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y full-upgrade \
	&& apt-get install -y --no-install-recommends \
		nginx \
	&& rm -rf /var/lib/apt/lists/*

# Copy and run an initialization script to start the appropriate servers in the containers
COPY container_init.sh container_init.sh
RUN chmod +x container_init.sh
CMD ["./container_init.sh"]

LABEL 	maintainer="Jose Manuel Redondo Lopez" \
	version="1.0" \
	description="Base Ubuntu Reverse Proxy Nginx HTTP web server with SSH image for SSI laboratories"
