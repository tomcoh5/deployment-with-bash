import socket
# Specify variables
ZABBIX_URL = "http://ip/zabbix"
USERNAME = 'Admin'
PASSWORD = 'zabbix'
# Create API client session
zapi = ZabbixAPI(ZABBIX_URL)
zapi.login(USERNAME, PASSWORD)
print("Connected to Zabbix API Version %s" % zapi.api_version())
HOST_GROUP = "groupname"
hostgroup = zapi.hostgroup.get(filter={"name":HOST_GROUP})
hostgroup_id = str(hostgroup[0]['groupid'])
#with open("/root/linux.txt", "r") as hosts:
#    last = hosts.read().splitlines()


with open("/root/hostnames.txt") as f:
    hostname_list = f.read().splitlines()


with open("/root/addresses.txt") as a:
    address_list = a.read().splitlines()


for name, ip_address in zip(hostname_list, address_list):
          ip_address = ip_address.rstrip()
          print(name + ip_address)
#      ip_address=socket.gethostbyname(name)
          zapi.host.create(
                          host=name,
                          status= 1,
                          interfaces=[{"type": 1, "main": 1, "useip": 1, "ip": ip_address, "dns": "", "port": 10050,
                                        "details":{"community":"{$SNMP_COMMUNITY}", "version":2, "bulk":0}}],
                          groups=[{"groupid": hostgroup_id}],
                          templates=[{"templateid": "10001"}])

