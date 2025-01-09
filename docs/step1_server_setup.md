Step 1:

Install CentOS:
1- Download the CentOS or RHEL ISO from the official website.
2- Create a new VM using the virtualization tool and assign enough resources
 (e.g., 2GB RAM, 20GB disk space).
3- Boot from the ISO and follow the installation wizard.
4- Choose the installation type (Minimal Install is sufficient for this project).
5- Create a user account with sudo privileges during the installation.
6- Once the installation is complete, log into the system as the root user or the created administrator user.

Step 2:
Configuring Hostname:

1- hostnamectl set-hostname omar.server.com

2- hostnamectl --> to verify the hostname

Step 3:
Configuring Timezone:
1- timedatectl set-timezone Africa/Cairo

2- timedatectl --> to verify the timezone

Step 4:

Configuring Network:
The nmcli tool (NetworkManager) is commonly used in CentOS to manage
network connections.

nmcli conn show --> to view available network connections
nmcli conn mod --> conname ipv4.addresses ipaddress/port gw gatewayaddress ipv4.dns dns ipv4.method manual
nmcli connection up conname --> to apply changes
Verification:
nmcli connection show eth0
ip addr show eth0
