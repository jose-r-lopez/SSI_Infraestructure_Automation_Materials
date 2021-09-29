#!/bin/bash
# Copy cluster configuration before start
cp /cluster_conf/nginx.conf /etc/nginx/nginx.conf
cp /cluster_conf/default /etc/nginx/sites-available/default

service ssh start
service nginx start

tail -f /dev/null
