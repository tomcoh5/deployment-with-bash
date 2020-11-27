#!/bin/bash
for line in $(cat /opt/zabbix/ip.txt)
do
  echo "$line"
#  ip=`ping -q -c 1 -t 1 $line | grep PING | sed -e "s/).*//" | sed -e "s/.*(//"`
#  echo $ip
   status=$(ssh -o BatchMode=yes -o ConnectTimeout=40 $line echo ok 2>&1)

   if [[ $status == ok ]] ; then
        echo "ok connection"
        ssh  $line   'bash -s' < /home/tom/zabbix/zabbix_install.sh
   elif [[ $status == "Permission denied"* ]] ; then
        echo no_auth $line >> /opt/zabbix/noauth.txt
   else
        echo other_error $line >> /opt/zabbix/other_error.txt
   fi
done
