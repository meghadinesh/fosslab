#!/bin/bash
# shell script for system config

x=$(lsb_release -a)
echo "OS info : $x"
echo "Available shells :"
echo `cat /etc/shells` 
echo "CPU info:"
echo $(lscpu)
echo "Memory info:"
echo $(free -m)
echo "Hard disk info:"
echo $(sudo dmidecode -t memory)
echo "File system(Mounted):"
echo $(sudo fdisk -l)
