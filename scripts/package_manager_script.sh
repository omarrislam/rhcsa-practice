#!/bin/bash
# Package Management Automation Script

# Variables
LOG_FILE="/root/rhcsa-practice/logs/step4_package_management_logs.txt"

echo "_________________________________________________">> $LOG_FILE
# Log start
echo "--- Package Management Script ---" >> $LOG_FILE
echo "Script started at $(date)" >> $LOG_FILE

# Install a package
echo "Installing httpd..." | tee -a $LOG_FILE
dnf install httpd -y >> $LOG_FILE 2>&1

# Update all installed packages
echo "Updating all installed packages..." | tee -a $LOG_FILE
dnf update -y >> $LOG_FILE 2>&1

# Remove a package
echo "Removing httpd..." | tee -a $LOG_FILE
dnf remove httpd -y >> $LOG_FILE 2>&1

# List current repositories
echo "Listing current repositories..." | tee -a $LOG_FILE
dnf repolist >> $LOG_FILE 2>&1

# Log end
echo "Script ended at $(date)" >> $LOG_FILE

