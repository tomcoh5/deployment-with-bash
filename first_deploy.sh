#!/bin/bash
hosts=`cat /home/tom/nitroflare/nitroflaremain`
for host in $hosts;do
       echo "running on $host"
rsync -avz /home/tom/nitroflare/httpd.sh $host:/usr/local/nagios/libexec/
#rsync -avz /home/tom/nitroflare/mysql.sh $host:/usr/local/nagios/libexec/
#rsync -avz /home/tom/nitroflare/php-fpm.sh $host:/usr/local/nagios/libexec
ssh $host   'bash -s' < /home/tom/nitroflare/remote-server.bash
echo "done on $host"
done

