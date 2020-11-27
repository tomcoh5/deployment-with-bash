#!/bin/bash
currentip=`hostname -I | awk '{print $1}'`
if [[ `python -mplatform | grep -i ubuntu` ]] || [[ `python -mplatform | grep -i debian` ]];then
        apt install wget -y
        wget https://repo.zabbix.com/zabbix/4.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_4.0-2+bionic_all.deb
        dpkg -i zabbix-release_4.0-2+bionic_all.deb
        apt install zabbix-agent -y
elif [[ `python -mplatform | grep -i centos` ]] || [[ `python -mplatform | grep -i redhat` ]];then

        yum install https://repo.zabbix.com/zabbix/4.2/rhel/7/x86_64/zabbix-release-4.2-1.el7.noarch.rpm -y
        yum install zabbix-agent -y
else
        echo "error"
        echo "$current ip doesntwork " >> /opt/zabbix/cantinstall.txt

fi
sed -i '98d' /etc/zabbix/zabbix_agentd.conf
echo "Server=127.0.0.1, 185.18.205.143" >> /etc/zabbix/zabbix_agentd.conf
csf -a "185.18.205.143"
systemctl restart  zabbix-agent
systemctl enable  zabbix-agent
