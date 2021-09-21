# Latest public official Ubuntu image release
FROM ubuntu:focal
# Avoid errors from asking for user input
ENV DEBIAN_FRONTEND=noninteractive

# Color terminal for better user experience
ENV TERM=xterm-color

# Do not exclude man pages & other documentation
# RUN rm /etc/dpkg/dpkg.cfg.d/excludes
# COPY excludes /etc/dpkg/dpkg.cfg.d/

# Prepare the base packages with some useful tools in a way image size is reduced.
RUN apt-get update && apt-get -y full-upgrade \
	&& apt-get install -y --no-install-recommends \
		apt-utils \
		curl \
		iputils-ping \
		nano \
		net-tools \
		wget \
		less \
		tmux \
		gpm \
		mc \
	&& rm -rf /var/lib/apt/lists/*

COPY tmux.conf /etc/tmux.conf
COPY nanorc /root/.nanorc

LABEL 	maintainer="Jose Manuel Redondo Lopez" \
	version="1.0" \
	description="Base Ubuntu image for SSI laboratories (2020-2021)"
