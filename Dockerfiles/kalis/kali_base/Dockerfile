# Latest public official Kali Linux (Rolling) image release
FROM kalilinux/kali-rolling

# Avoid errors from asking for user input
ENV DEBIAN_FRONTEND=noninteractive

# Color terminal for better user experience
ENV TERM=xterm-color

# Prepare the base packages with some useful tools in a way image size is reduced.
RUN 	apt-get -y update && apt-get -y full-upgrade \
	&& apt-get install -y --no-install-recommends \
		apt-utils \
		curl \
		iputils-ping \
		nano \
		net-tools \
		wget \
		nmap \
		man \
		less \
		tmux \
		gpm \
		mc \
	&& rm -rf /var/lib/apt/lists/*

COPY tmux.conf /etc/tmux.conf
COPY nanorc /root/.nanorc

WORKDIR /root

LABEL 	maintainer="Jose Manuel Redondo Lopez" \
	version="1.0" \
	description="Base Kali image for SSI laboratories (2020-2021)"
