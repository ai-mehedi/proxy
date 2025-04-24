# 🌐 Proxy Setup: Shadowsocks & Squid

This repository provides installation and configuration scripts for two types of proxies:

- ⚡ **Shadowsocks**: Encrypted SOCKS5 proxy
- 🔐 **Squid**: HTTP proxy with basic authentication

These scripts are intended for **Ubuntu 20.04/22.04** systems and configure both proxies with automatic firewall (UFW) setup.

---

## 📦 Installation Instructions

### ✅ Shadowsocks (SOCKS5 Encrypted Proxy)

This script installs and configures Shadowsocks, a secure SOCKS5 proxy.

#### 🔧 Steps to Install Shadowsocks:
```bash
git clone https://github.com/ai-mehedi/proxy.git
cd proxy
chmod +x install-shadowsocks.sh
./install-shadowsocks.sh
```

During installation, you will be prompted for:

- **Password**: Set your Shadowsocks password  
- **Port**: Set the port (default: `8388`)

### 🛠 Features of Shadowsocks:
- ✅ Uses **AES-256-GCM** encryption for secure tunneling
- 🔧 Configures Shadowsocks on the specified port
- 🔥 Opens the necessary ports on the firewall (TCP/UDP)
- ⚡ Automatically enables and starts the service

## 🔐 Squid (HTTP Proxy with Authentication)

This script installs Squid and configures it with Basic Authentication (username/password).

### 🔧 Steps to Install Squid:

```bash
git clone https://github.com/ai-mehedi/proxy.git
cd proxy
chmod +x install_squid_auth.sh
./install_squid_auth.sh
```

## 🔐 Squid Installation

During installation, you will be prompted for:
- **Username**: Set the username for HTTP authentication
- **Password**: Set the password for the chosen username

### 🛠 Features of Squid:
- Installs Squid and configures it with Basic Authentication
- Modifies Squid's configuration to require authentication for access
- Opens port `3128` in the firewall automatically
- Creates backup of original Squid configuration before applying changes

## ⚖️ Feature Comparison

| Feature                  | Shadowsocks (SOCKS5)       | Squid (HTTP Proxy)         |
|--------------------------|----------------------------|----------------------------|
| **Protocol**             | SOCKS5                     | HTTP/HTTPS                 |
| **Authentication**       | Password only              | Basic Auth (User/Pass)     |
| **Encryption**           | ✅ AES-256-GCM             | ❌ No encryption           |
| **Use Case**             | Secure tunneling, bypassing censorship | Internal proxy usage, access control |

## 🛡️ Security Considerations
- 🔑 Always use strong passwords for both Squid and Shadowsocks
- 🔒 Harden your server security (SSH key authentication, firewall rules)
- 🛡️ Consider adding SSL/TLS tunneling (via stunnel or Xray-core) for extra security
- 📛 Regularly update your server and proxy software

## 📜 License
This project is licensed under the **[MIT License](https://opensource.org/licenses/MIT)**.

---

✨ **Tip**: For production environments, consider setting up fail2ban to protect against brute force attacks.

## ✍️ Author
**Created with ❤️ by [ai-mehedi](https://github.com/ai-mehedi)**

[![GitHub](https://img.shields.io/badge/View_on-GitHub-blue?logo=github)](https://github.com/ai-mehedi/proxy)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)

---

Simply copy the entire block above and paste it into your `README.md` file. Let me know if you need any more assistance!
