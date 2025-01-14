#!bin/bash


INTERFACE="ens36"
IPADDR="192.168.1.55"
PREFIX="24"
GATEWAY="192.168.1.1"
DNS1="8.8.8.8"
DNS2="8.8.4.4"

cat <<EOT> /etc/NetworkManager/system-connections/$INRERFACE.nmconnection

TYPE=Ethernet
BOOTPROTO=none
NAME=$INTERFACE
DEVICE=$INTERFACE
ONBOOT=yes
IPADDR=$IPADDR
PREFIX=$PREFIX
GATEWAY=$GATEWAY
DNS1=$DNS1
DNS2=$DNS2
EOL

systemctl restart NetworkManager
echo "Static IP configured successfully."
