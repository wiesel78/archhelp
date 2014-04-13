#!/usr/bin/bash

UNIVPN_SUBNET=141.89.0.0/16
UNIVPN_REMOTE=172.16.3.253

if [ $UNIVPN_REMOTE = $5 ]
then 
    echo "hallo " > /home/wiesel/blublub
    /usr/bin/ip route add $UNIVPN_SUBNET dev $1
fi

exit 0

