# Step 4: Package Management

This step involves managing software packages and repositories using `dnf` on a RHEL/CentOS system. Tasks include installing, updating, and removing packages, as well as setting up a custom repository

### List Enabled Repositories
dnf repolist 

#Installing a package
dnf install httpd -y 

#Remove a package
dnf remove httpd -y 

#Updating packages
dnf update -y

#Creating a custom repo
vim /etc/yum.repos.d/localrepo.repo
#Contents
[localrepo]
name=Local Repository
baseurl=file:///media/isolinux
enabled=1
gpgcheck=0

#save the repository file for reference
cp /etc/yum.repos.d/localrepo.repo /root/rhcsa-practice/configs/

#verifying
dnf repolist

