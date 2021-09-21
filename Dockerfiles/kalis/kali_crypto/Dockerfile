# Our base Kali machine
FROM ssi/kali_base

# Avoid errors from asking for user input
ENV DEBIAN_FRONTEND=noninteractive

# Prepare the base packages with some useful tools in a way image size is reduced.
RUN 	apt-get -y update && \
	apt-get install -y --no-install-recommends \
		unzip \
		steghide \
		john \
		exiftool \
		gnupg \
		coreutils \
		openssh-client \
		crunch \
		bzip2 \
	&& rm -rf /var/lib/apt/lists/*

# Copy and uncompress password file
# RUN 	mkdir /wordlist
# COPY rockyou.txt.bz2 /wordlist
# RUN 	chmod o+r /wordlist/rockyou.txt.bz2 \
#	&& bzip2 -d /wordlist/rockyou.txt.bz2

# Copy the passwd and shadow files
# COPY passwd /wordlist
# RUN chmod o+r /wordlist/passwd
# COPY shadow /wordlist
# RUN chmod o+r /wordlist/shadow

WORKDIR /root

LABEL 	maintainer="Jose Manuel Redondo Lopez" \
	version="1.0" \
	description="Base Kali image for SSI laboratories with crypto software (Labs 3 and 4) (2020-2021)"
