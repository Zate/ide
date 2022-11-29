#!/bin/bash
# set -euo pipefail

packages=''

echo "Setup for ${IDE_LANG}"
source ~/.local/.bash_inc

echo $(date --iso-8601=seconds) > ~/.bts
cat ~/.bts

for i in `cat packages`; do
    packages="${packages} ${i}"
done

sudo apt-get update
sudo apt-get --no-install-recommends upgrade -y
sudo apt-get --no-install-recommends --no-install-suggests -y install ${packages}

git config --global user.name ${USER}
git config --global user.email ${EMAIL}
upPath
upPip
echo "Installing Code-Server"
# curl -fsSL https://code-server.dev/install.sh | sh -s --
# upCodeServer
# msft vscode code-server
# curl -fsSL https://aka.ms/install-vscode-server/setup.sh | sh
curl -fsSL https://aka.ms/vscode-server-launcher/x86_64-unknown-linux-gnu -o ~/bin/code-server
chmod +x ~/bin/code-server
# upVSCodeServer

# setup a systemd service that runs update.sh on every boot
echo "Setting up systemd service"
sudo tee /etc/systemd/system/update.service <<EOF
[Unit]
Description=Update
After=network.target
