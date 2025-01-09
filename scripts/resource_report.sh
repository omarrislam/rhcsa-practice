#!/bin/bash

# Get system resource usage and save to a file
echo "CPU and Memory Usage:" >> /root/rhcsa-practice/logs/resource_report.txt
top -n 1 -b >> /root/rhcsa-practice/logs/resource_report.txt

echo "Disk Usage:" >> /root/rhcsa-practice/logs/resource_report.txt
df -h >> /root/rhcsa-practice/logs/resource_report.txt

echo "Network Statistics:" >> /root/rhcsa-practice/logs/resource_report.txt
netstat -i >> /root/rhcsa-practice/logs/resource_report.txt

