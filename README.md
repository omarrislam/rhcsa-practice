# RHCSA Practice Project

This project covers the steps for practicing key RHCSA concepts and commands on CentOS/RHEL.

## Step 1: Server Setup

1. **Install CentOS/RHEL**: 
   - Set up a physical or virtual machine with CentOS or RHEL.
   - Ensure the machine is up and running.

2. **Basic System Configuration**:
   - Set the **hostname** using `hostnamectl set-hostname <hostname>`.
   - Configure the **time zone** using `timedatectl set-timezone <timezone>`.
   - Set up **networking** by editing `/etc/sysconfig/network-scripts/ifcfg-eth0` for static IP configuration.

## Step 2: User and Group Management

1. **Create a Group and Users**:
   - Create a `developers` group using:
     ```bash
     groupadd developers
     ```
   - Create users `alice`, `bob`, and `carol` and add them to the `developers` group:
     ```bash
     useradd -G developers alice
     useradd -G developers bob
     useradd -G developers carol
     ```

2. **Set Password Policies**:
   - Configure password policies in `/etc/security/pwquality.conf` for minimum length, expiration, and complexity.

3. **Grant Sudo Access**:
   - Edit `/etc/sudoers` to grant `alice` sudo access:
     ```bash
     alice  ALL=(ALL)       ALL
     ```

## Step 3: File and Directory Management

1. **Create Shared Directory for Developers**:
   - Create the directory `/shared/developers`:
     ```bash
     mkdir -p /shared/developers
     ```
   - Set the ownership and permissions so that only members of the `developers` group can access it:
     ```bash
     chown :developers /shared/developers
     chmod 770 /shared/developers
     ```

2. **Set Special Permissions**:
   - Set the **sticky bit** on the `/shared/developers` directory:
     ```bash
     chmod +t /shared/developers
     ```

3. **Create a Backup Script**:
   - Automate file backups with a script that uses `tar`:
     ```bash
     #!/bin/bash
     BACKUP_DIR="/backup/developers"
     DATE=$(date +'%Y-%m-%d_%I-%M-%S')
     BACKUP_FILE="$BACKUP_DIR/developers_backup_$DATE.tar.gz"
     mkdir -p $BACKUP_DIR
     tar -czf $BACKUP_FILE /shared/developers
     ```

## Step 4: Package Management

1. **Install, Update, and Remove Packages**:
   - Install packages using `dnf`:
     ```bash
     dnf install <package_name>
     ```
   - Remove packages:
     ```bash
     dnf remove <package_name>
     ```

2. **Enable/Disable Repositories**:
   - Enable a repository:
     ```bash
     dnf config-manager --enable <repo_name>
     ```
   - Disable a repository:
     ```bash
     dnf config-manager --disable <repo_name>
     ```

3. **Create a Local Repository**:
   - Set up a local repository by placing packages in a directory and creating a `.repo` file in `/etc/yum.repos.d/`.
     Example repository file (`/etc/yum.repos.d/localrepo.repo`):
     ```ini
     [localrepo]
     name=Local Repository
     baseurl=file:///path/to/local/repo
     enabled=1
     gpgcheck=0
     ```
---

# Step 5: Process and System Monitoring

## Objective
In this step, we aim to implement system monitoring tools and create automated tasks to ensure the system is operating efficiently. This includes monitoring processes, system resources, and scheduling jobs for resource reporting.

### Tasks Covered
- **Monitoring Running Processes**: Using `top`, `ps` to monitor system processes and resource usage.
- **Scheduling Jobs**: Using `cron` to schedule periodic tasks that generate resource usage reports.
- **Script Creation**: Automating resource reporting using a script.
- **System Logs**: Configuring log files to record the outputs of system monitoring.

## Deliverables

### 1. **Process Monitoring**
We used the following tools to monitor system processes:
- **`top`**: Provides an interactive view of system processes.
- **`ps`**: Displays a snapshot of the running processes.

#### Example Commands:
```bash
# Monitor real-time processes
top

# Snapshot of processes with detailed information
ps aux

```

### 2. **Automated Resource Reporting Script**
We wrote a script that generates a report on system resource usage and logs it to a file.

**Script**: `resource_report.sh`
```bash
# Get system resource usage and save to a file
echo "CPU and Memory Usage:" >> /root/rhcsa-practice/logs/resource_report.txt
top -n 1 -b >> /root/rhcsa-practice/logs/resource_report.txt

echo "Disk Usage:" >> /root/rhcsa-practice/logs/resource_report.txt
df -h >> /root/rhcsa-practice/logs/resource_report.txt

echo "Network Statistics:" >> /root/rhcsa-practice/logs/resource_report.txt
netstat -i >> /root/rhcsa-practice/logs/resource_report.txt

```

The script collects details about the system’s:
- CPU usage
- Memory usage
- Disk space usage
- Network Statistics

### 3. **Scheduling the Report Generation**
To ensure that the resource report is generated periodically, we scheduled the script to run every day at midnight using `cron`.

#### Cron Job Entry:
To schedule the script, edit the crontab by running:
```bash
crontab -e
```

Add the following entry to run the report script at every min:
```
* * * * * /path/to/resource_report.sh
```

This will ensure that a new report is generated daily and stored in `/root/rhcsa-practice/logs/resource_report.txt`.

### 4. **Logs**
- **Log File**: `/root/rhcsa-practice/logs/resource_report.txt`
- **Purpose**: Contains the outputs of the resource reporting script, including memory, disk usage, and CPU statistics.
  
#### Example of log output:
```
System Resource Report - Wed Jan  7 00:00:00 UTC 2025
-------------------------------------
top - 00:00:00 up 1 day,  5:43,  1 user,  load average: 0.02, 0.01, 0.05
Tasks: 149 total,   1 running, 148 sleeping,   0 stopped,   0 zombie
%Cpu(s):  3.5 us,  1.2 sy,  0.0 ni, 95.1 id,  0.1 wa,  0.0 hi,  0.1 si,  0.0 st
MiB Mem :   8096.8 total,   2052.6 free,   3257.6 used,   2786.6 buff/cache
MiB Swap:   4096.0 total,   4096.0 free,      0.0 used.   4384.3 avail Mem
```
---

# **Step 6: Networking**

**Objective**  
The objective of this step is to configure networking on the system, set a static IP, and secure the SSH service by changing the default port and disabling root login.

---

#### **SSH Configuration (Port 2222)**

To enhance security, the default SSH port (22) has been changed to port 2222. Additionally, root login via SSH has been disabled to prevent unauthorized access.

##### **Steps Taken:**
1. **SSH Configuration**:  
   The configuration file `/etc/ssh/sshd_config` was updated to:
   ```bash
   Port 2222
   PermitRootLogin no
   PasswordAuthentication yes
   PubkeyAuthentication yes
   ```
   This ensures SSH runs on port 2222, disallows root login, and enables secure password and public key authentication.

2. **Restarting SSH Service**:  
   After making changes, the SSH service was restarted with the following command:
   ```bash
   sudo systemctl restart sshd
   ```

3. **Testing SSH Login**:  
   To test the new SSH configuration, a login attempt was made using port 2222:
   ```bash
   ssh -p 2222 user@<server-ip>
   ```

4. **Log Verification**:  
   The successful login attempt was captured in the system's security log (`/var/log/secure`) and filtered using:
   ```bash
   sudo grep "port 2222" /var/log/secure
   ```

##### **Log Output Example**:
A successful SSH login entry looks like this:
```
Jan 14 12:34:56 hostname sshd[12345]: Accepted password for user from 192.168.1.50 port 2222 ssh2
```

The log has been saved in the project repository for verification purposes.

---

#### **Files and Logs**
- **SSH Configuration File**: `/etc/ssh/sshd_config`
- **Log File**: `logs/step7_ssh.log`

This file contains the logs of successful SSH login attempts via port 2222.

---

# Step 7: System Logs and Troubleshooting

## Objective
In this step, we focused on configuring and analyzing system logs, setting up log rotation for system logs, and troubleshooting common system issues.

## Tasks Performed

### 1. Log Rotation Configuration:
To ensure system logs do not grow indefinitely, we configured log rotation for the `/var/log/secure` file. The log rotation was configured to run weekly, keeping 4 backups, and compressing old logs.

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

### 2. Log Analysis:
We analyzed system logs using the `journalctl` command, focusing on security-related logs, especially SSH logs. We also explored logs to identify and troubleshoot failed services.

- **Command used to check system logs**:
  ```bash
  journalctl -xe
  ```

- **SSH log example**:
  ```text
  Jan 25 14:23:45 hostname sshd[2345]: Accepted password for user from 192.168.1.50 port 2222 ssh2
  Jan 25 14:24:03 hostname sshd[2389]: Disconnected from user@192.168.1.50 port 2222
  ```

- **Checking for failed services**:
  We used the following command to check for failed services on the system:
  ```bash
  sudo systemctl status httpd
  ```

  The `httpd` service was found to have failed, and we resolved the issue by modifying its configuration.

### 3. Troubleshooting:
We used the `systemctl status` command to troubleshoot a failed service (in this case, the `httpd` service). Additionally, we checked for any other services that might have failed using the `systemctl --failed` command.

## Deliverables

### 1. Log Rotation Configuration:
- **File**: `/etc/logrotate.d/secure`
- **Description**: Log rotation configuration for `/var/log/secure`.

### 2. Log Files:
- **File**: `logs/step8_journalctl.log`
  - Contains the output from `journalctl -xe` to display recent system logs.
- **File**: `logs/step8_troubleshooting.log`
  - Contains the output from `systemctl status httpd` to show the status of the `httpd` service.

### 3. Log Analysis Script:
- **File**: `scripts/log_analysis.sh`
  - A script to analyze system logs, check for failed services, and view SSH logs.

---

## Files Created

- **Documentation**: `docs/step8_logs_and_troubleshooting.md`
- **Log Files**:
  - `logs/step8_journalctl.log`
  - `logs/step8_troubleshooting.log`
- **Script**: `scripts/log_analysis.sh`

---

This step helps in configuring the system to manage logs, prevent them from filling up the disk, and enables efficient troubleshooting by analyzing logs and diagnosing service failures.
```

---
