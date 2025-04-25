#!/bin/bash

# Update and install Shadowsocks-libev
sudo apt update
sudo apt install -y shadowsocks-libev v2ray-plugin


# Prompt for password
read -p "Enter password for Shadowsocks: " ss_password
read -p "Enter port [default: 8388]: " ss_port
ss_port=${ss_port:-8388}

# Create config
sudo tee /etc/shadowsocks-libev/config.json > /dev/null <<EOF
{
    "server": "0.0.0.0",
    "server_port": $ss_port,
    "local_port": 1080,
    "password": "$ss_password",
    "timeout": 300,
    "method": "aes-256-gcm",
    "fast_open": false,
    "reuse_port": true,
    "no_delay": true
}
EOF

# Open firewall
sudo ufw allow $ss_port/tcp
sudo ufw allow $ss_port/udp

# Enable and restart Shadowsocks
sudo systemctl enable shadowsocks-libev
sudo systemctl restart shadowsocks-libev

echo
echo "✅ Shadowsocks SOCKS5 proxy is running!"
echo "🔑 Server IP: $(curl -s ifconfig.me)"
echo "📡 Port: $ss_port"
echo "🔐 Password: $ss_password"
echo "🔒 Method: aes-256-gcm"
