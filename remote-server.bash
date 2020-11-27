#!/bin/bash
#echo "command[check_php-fpm]=/usr/local/nagios/libexec/php-fpm.sh" >> /etc/nrpe.cfg
#echo "command[check_nginx]=/usr/local/nagios/libexec/nginx.sh" >> /etc/nrpe.cfg
echo "command[check_httpd]=/usr/local/nagios/libexec/httpd.sh" >> /etc/nrpe.cfg
#chown nagios:nagios /usr/local/nagios/libexec/php-fpm.sh
chown nagios:nagios /usr/local/nagios/libexec/httpd.sh
service xinetd restart
~
