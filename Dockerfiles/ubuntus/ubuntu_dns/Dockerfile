# Start from our base Ubuntu image to have a common toolset
FROM ssi/ubuntu_base

# Avoid errors from asking for user input
ENV DEBIAN_FRONTEND=noninteractive
# Prepare the base packages with some useful tools in a way image size is reduced.
RUN apt-get update && apt-get -y full-upgrade \
	&& apt-get install -y --no-install-recommends \
		bind9 \
		bind9-host \
		dnsutils \
	&& rm -rf /var/lib/apt/lists/*


EXPOSE 53

# Copy and run an initialization script to start the appropriate servers in the containers
COPY container_init.sh container_init.sh
RUN chmod +x container_init.sh
CMD ["./container_init.sh"]

LABEL 	maintainer="Jose Manuel Redondo Lopez" \
	version="1.0" \
	description="Ubuntu DNS Server image for SSI laboratories (2020-2021)"
