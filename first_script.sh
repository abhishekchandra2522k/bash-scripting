#!/bin/bash

### This script prints system's info ###
echo "Welcome to bash scripting"
echo

# checking system uptime
echo "#############################################"
echo "The uptime of the system is"
uptime
echo

# Memory Utilization
echo "#############################################"
echo "Memory Utilization"
free -m
echo

# Disk Utilization
echo "#############################################"
echo "Disk Utilization"
df -h
echo