# Start from our base image to have a common toolset
FROM ssi/ubuntu_base

# Avoid errors from asking for user input
ENV DEBIAN_FRONTEND=noninteractive

# Prepare the base packages with some useful tools in a way image size is reduced.
RUN 	apt-get -y update && \
	apt-get install -y --no-install-recommends \
		openssh-server \
		openssl \
	&& rm -rf /var/lib/apt/lists/*

ARG SSH_USER=ssiuser
ARG SSH_USER_PASS=test123...
RUN useradd -m -s /bin/bash -p $(openssl passwd -1 $SSH_USER_PASS) $SSH_USER

# Copy and run an initialization script to start the appropriate servers in the containers
COPY container_init.sh container_init.sh
RUN chmod +x container_init.sh
CMD ["./container_init.sh"]

# Expose ports
EXPOSE 22

LABEL 	maintainer="Jose Manuel Redondo Lopez" \
	version="1.0" \
	description="Base Ubuntu SSH image for SSI laboratories (2020-2021)"
