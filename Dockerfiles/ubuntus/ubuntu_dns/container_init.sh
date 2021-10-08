#!/bin/bash
# Copy DNS configuration before start

cp -r /dns_conf/* /etc/bind/

service named start

tail -f /dev/null
