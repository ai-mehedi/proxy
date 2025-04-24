#!/bin/bash

# Install required packages
sudo apt update
sudo apt install -y squid apache2-utils ufw

# Prompt for username and password
read -p "Enter username for Squid authentication: " squid_user
read -s -p "Enter password for $squid_user: " squid_pass
echo

# Backup original config
sudo cp /etc/squid/squid.conf /etc/squid/squid.conf.bak

# Modify Squid configuration
sudo sed -i 's/^http_access allow localhost/#http_access allow localhost/' /etc/squid/squid.conf
sudo sed -i 's/^http_access deny all/#http_access deny all/' /etc/squid/squid.conf

# Add authentication settings
cat <<EOL | sudo tee -a /etc/squid/squid.conf

auth_param basic program /usr/lib/squid/basic_ncsa_auth /etc/squid/passwd
auth_param basic credentialsttl 6 hours
acl authenticated proxy_auth REQUIRED
http_access allow authenticated
http_access deny all
EOL

# Create the password file and set credentials
sudo htpasswd -cb /etc/squid/passwd "$squid_user" "$squid_pass"

# Open firewall for Squid
sudo ufw allow 3128/tcp

# Restart Squid
sudo systemctl restart squid

echo "✅ Squid proxy with basic auth is set up. Listening on port 3128."
