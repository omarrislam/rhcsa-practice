Step 2: User and Group Management



1. Create a Group: developers:
sudo groupadd developers

Verify the group: To confirm that the group was created successfully,
check the /etc/group file:
cat /etc/group | grep developers

2. Create the users:
useradd alice
useradd bob
useradd carol


3. Add users to the developers group:
usermod -aG developers alice
usermod -aG developers bob
usermod -aG developers carol

4. Set password policies: 
vim /etc/security/pwquality.conf

add 
minlen = 8
minclass = 3
maxrepeat = 3

5. Configure sudo Access for a Specific User:
visudo 

add 
alice    ALL=(ALL)       ALL
this gives alice sudo permissions 
