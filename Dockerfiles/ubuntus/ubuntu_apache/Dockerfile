# Start from our base image to have a common toolset
FROM ssi/ubuntu_base

# Avoid errors from asking for user input
ENV DEBIAN_FRONTEND=noninteractive

# Prepare the base packages with some useful tools in a way image size is reduced.
RUN 	apt-get -y update && \
	apt-get install -y --no-install-recommends \
		apache2 \
	&& rm -rf /var/lib/apt/lists/*

# Copy and run an initialization script to start the appropriate servers in the containers
COPY container_init.sh container_init.sh
RUN chmod +x container_init.sh
CMD ["./container_init.sh"]

# Expose ports
EXPOSE 80

LABEL 	maintainer="Jose Manuel Redondo Lopez" \
	version="1.0" \
	description="Base Ubuntu Apache HTTP web server image for SSI laboratories (2020-2021)"
