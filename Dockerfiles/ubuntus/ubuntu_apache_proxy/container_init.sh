#!/bin/bash
# Copy cluster configuration before start
cp /cluster_conf/apache2.conf /etc/apache2/apache2.conf

service ssh start
service apache2 start

tail -f /dev/null
