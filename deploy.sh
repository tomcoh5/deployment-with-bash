#!/bin/bash
hosts=`cat /home/tom/csfnitro/newhost`
for host in $hosts;do
       echo "running on $host"
        rsync -avz /home/tom/csfnitro/md125_check.sh $host:/usr/local/nagios/libexec/md125_check.sh
        ssh $host   'bash -s' < /home/tom/csfnitro/add.sh
        echo "done on $host"
done
