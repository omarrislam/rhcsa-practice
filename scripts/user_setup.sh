#!/bin/bash

# Step 1: Create the developers group
echo "Creating 'developers' group..."
groupadd developers

# Step 2: Create users and assign them to 'developers' group
echo "Creating users and adding them to 'developers' group..."

# List of users to create
users=("alice" "bob" "carol")

for user in "${users[@]}"; do
    useradd $user  # Create user with home directory
    usermod -aG developers $user  # Add user to 'developers' group
    echo "User $user created and added to 'developers' group."
done

# Step 3: Set password policies
echo "Setting password policies..."
bash -c 'cat > /etc/security/pwquality.conf <<EOL
minlen = 8
minclass = 3
maxrepeat = 3
EOL'

# Step 4: Configure sudo access for 'alice'
echo "Granting sudo access to 'alice'..."
bash -c 'echo "alice    ALL=(ALL)       ALL" >> /etc/sudoers'

# Finish
echo "User setup complete."

