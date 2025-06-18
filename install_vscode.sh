#!/bin/bash

set -e

echo "🔧 Installing Visual Studio Code..."

# 1. Update package index
sudo apt update

# 2. Install required tools
sudo apt install -y wget gpg software-properties-common apt-transport-https

# 3. Import Microsoft GPG key
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /usr/share/keyrings/packages.microsoft.gpg
rm microsoft.gpg

# 4. Add VS Code repository
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] \
https://packages.microsoft.com/repos/vscode stable main" | \
sudo tee /etc/apt/sources.list.d/vscode.list

# 5. Update package index and install VS Code
sudo apt update
sudo apt install -y code

# 6. Confirm installation
echo "✅ VS Code installed:"
code --version

