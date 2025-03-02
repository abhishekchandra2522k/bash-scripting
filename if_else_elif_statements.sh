#!/bin/bash

value=$(ip addr show | grep -v LOOPBACK | grep -ic mtu)

if [ $value -eq 1 ]
then
        echo "1 Active Network interface found"
elif [ $value -gt 1 ]
then 
        echo "Found multiple active NIC"
else
        echo "No active NIC found"
fi