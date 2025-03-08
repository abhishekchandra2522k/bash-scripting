#!/bin/bash

USR="devops"

for host in `cat remote_hosts`
do
        echo "#############################################"
        echo "Connecting to $host"
        echo "Pushing script to $host...."
        scp multios_web_vars_script.sh $USR@$host:/tmp/
        echo "Executing script on $host...."
        ssh $USR@$host sudo /tmp/multios_web_vars_script.sh
        ssh $USR@$host sudo rm -rf /tmp/multios_web_vars_script.sh
        echo "#############################################"
        echo
done