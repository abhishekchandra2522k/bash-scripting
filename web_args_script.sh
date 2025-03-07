#!/bin/bash

# run command ./web_args_script.sh "https://www.tooplate.com/zip-templates/2098_health.zip" "2098_health"
# $0 $1 $2 are the first, second, third, and so on arguments till $9 which is 10th.

#Variables Declaration
PACKAGE="httpd wget unzip"
SVC="httpd"
# URL="https://www.tooplate.com/zip-templates/2098_health.zip"
# ARTIFACT_NAME="2098_health"
TEMPDIR="/tmp/webfiles"
NULL="/dev/null"

#Installing Dependencies
echo "#####################################################################"
echo "Installing packages"
echo "#####################################################################"
sudo yum install $PACKAGE -y > $NULL
echo

# Start & Enable Service
echo "#####################################################################"
echo "Start & Enable HTTPS Service"
echo "#####################################################################"
sudo systemctl start $SVC
sudo systemctl enable $SVC
echo

# Creating Temp directory
echo "#####################################################################"
echo "Starting Artifact Deployment"
echo "#####################################################################"
mkdir -p $TEMPDIR
cd $TEMPDIR
echo

wget $1 > $NULL
unzip $2.zip > $NULL
sudo cp -r $2/* /var/www/html
echo

# Bounce Service
echo "#####################################################################"
echo "Restarting HTTPD Service"
echo "#####################################################################"
systemctl restart $SVC
echo

# Clean up
echo "#####################################################################"
echo "Removing temp files"
echo "#####################################################################"
rm -rf $TEMPDIR
echo

sudo systemctl status $SVC
ls /var/www/html