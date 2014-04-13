#!/usr/bin/bash

UNIVPN_SUBNET=141.89.0.0/16
UNIVPN_REMOTE=172.16.3.253

if [ $UNIVPN_REMOTE = $5 ]
then 
    /usr/bin/ip route delete $UNIVPN_SUBNET dev $1
fi

exit 0

