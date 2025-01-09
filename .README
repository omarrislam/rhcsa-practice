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


