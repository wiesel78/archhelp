#!/usr/bin/bash

# alle pakete die an dieses Subnetz adressiert 
# sind werden ans vpn geroutet
UNIVPN_SUBNET=141.89.0.0/16

# die pakete sollen nur an das subnetz geroutet 
# werden wenn eine vpn verbindung zu den von uns 
# gewuenschten vpn-server aufgebaut wurde
UNIVPN_REMOTE=172.16.3.253

if [ $UNIVPN_REMOTE = $5 ]
then 
    /usr/bin/ip route add $UNIVPN_SUBNET dev $1
fi

exit 0

