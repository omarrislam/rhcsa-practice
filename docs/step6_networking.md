###Networking 
The goal of this step is to configure and secure network settings on the CentOS/RHEL system. Tasks include setting up a static IP, managing network connections using nmcli, and securing SSH access.

###Tasks Completed:
1. Static IP Configuration:
Assigned a static IP address and DNS.
# Restart the SSH service
systemctl restart sshd
Verified the configuration using ip and nmcli

2. Network Management with nmcli:
Checked the status of network devices and connections.
Modified network connection settings.

3. SSH Configuration:
Changed the default SSH port.
Disabled root login via SSH for enhanced security.
Verified SSH functionality after changes.

