Certainly! Below is the breakdown of the files you need to create, along with their respective contents for **Step 8 (System Logs and Troubleshooting)**.

---

### **1. Documentation File**

- **File Name**: `docs/step8_logs_and_troubleshooting.md`

#### **Content**:
```markdown
# Step 8: System Logs and Troubleshooting

## Objective
The goal of this step is to configure log rotation for system logs, analyze logs for system events, and troubleshoot common issues like failed services or high CPU usage.

## Tasks Performed

### 1. Log Rotation Configuration:
The `/var/log/secure` file was configured for rotation to ensure that logs do not grow indefinitely. A custom configuration was added to `/etc/logrotate.d/secure`.

**Log Rotation Configuration:**

- File: `/etc/logrotate.d/secure`
- Content:
  ```bash
  /var/log/secure {
      weekly
      rotate 4
      compress
      delaycompress
      missingok
      notifempty
      create 0640 root utmp
  }
  ```

### 2. Log Analysis:
Logs were analyzed using the `journalctl` command and specific logs in `/var/log/secure` to review security events and SSH activities.

- **Command used**:  
  ```bash
  journalctl -xe
  ```
  - This shows logs related to system events and errors.

- **SSH Log Example**:  
  A sample output from SSH login:
  ```text
  Jan 25 14:23:45 hostname sshd[2345]: Accepted password for user from 192.168.1.50 port 2222 ssh2
  Jan 25 14:24:03 hostname sshd[2389]: Disconnected from user@192.168.1.50 port 2222
  ```

### 3. Troubleshooting:
The issue of a failed service (e.g., `httpd`) was analyzed using `systemctl status` and logs.

- **Command used**:  
  ```bash
  sudo systemctl status httpd
  ```

- **Log Example**:  
  ```text
  httpd.service - Apache HTTP Server
  Loaded: loaded (/usr/lib/systemd/system/httpd.service; enabled; vendor preset: disabled)
  Active: failed (Result: exit-code) since Tue 2025-01-25 12:45:32 UTC
  ```

  The issue was resolved by correcting the `Listen` directive in the Apache configuration.
