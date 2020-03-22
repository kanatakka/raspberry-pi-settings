#!/bin/bash

/usr/local/vpnserver/vpnserver start

sleep 5
tap=$(/sbin/ifconfig -a| awk '$1 ~ /^tap/ {print $1}')
/sbin/brctl addif br0 $tap