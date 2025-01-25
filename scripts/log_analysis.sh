#!/bin/bash

# Display the last 20 lines of /var/log/secure
echo "Recent security logs:"
tail -n 20 /var/log/secure

# Display SSH service logs
echo "SSH service logs:"
journalctl -u sshd --since "1 hour ago"

# Check for failed services
echo "Checking for failed services:"
systemctl --failed


