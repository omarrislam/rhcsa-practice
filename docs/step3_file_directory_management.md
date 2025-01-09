Step 3: File and Directory Management

We will create a directory /shared/developers that will be accessible only by thedevelopers group.

1. Create the directory:
mkdir -p /shared/developers

2. Ownership:
chown :developers /shared/developers

3. Set permissions so that root and group users have full permissions:
chmod 770 /shared/developers 

4. Special Permissions:
chmod g+s /shared/developers --> this ensures any file created inside developers inherit the group developers.

chmod +t /shared/developers --> this ensures that only only owner or root can modify or delete files in this dir 

5. Creating backup script which you will find in scripts dir then adding execute permission to it 
