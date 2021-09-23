#!/bin/bash
service ssh start
/etc/init.d/xinetd start
service vsftpd start
service apache2 start
tail -f /dev/null
