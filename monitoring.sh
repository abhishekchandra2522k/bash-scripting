#!/bin/bash

echo "########################################################"
date
path="/var/run/httpd/httpd.pid"
# ls /var/run/httpd/httpd.pid > /dev/null

# if [ $? -eq 0 ]
if [ -e $path ]
then 
        echo "The HTTPD service is up and running"
else
        echo "The HTTPD service is not running. Starting the service...."
        systemctl start httpd
        if [ $? -eq 0 ]
        then 
                echo "Process started successfully."
        else
                echo "Process failed to start, please contact admin."   
        fi
fi
echo "#########################################################"
echo

# crontab -e 
# edit the file and provide the following input to run the above script every minute and store the logs
# * * * * * /opt/scripts/monitoring.sh &>> /var/log/monitoring_httpd.log
# save and exit will install a new cron job in the system which will run every minute