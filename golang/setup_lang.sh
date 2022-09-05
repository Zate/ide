#!/bin/bash
set -euo pipefail

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

echo "Setting git user and email"
git config --global user.name ${USER}
git config --global user.email ${EMAIL}
echo "Upating Path"
upPath
echo "Updating pip"
upPip
echo "Updating Code-Server"
# curl -fsSL https://code-server.dev/install.sh | sh -s --
# upCodeServer
# msft vscode code-server
# curl -fsSL https://aka.ms/install-vscode-server/setup.sh | sh
curl -fsSL https://aka.ms/vscode-server-launcher/x86_64-unknown-linux-gnu -o ~/bin/code-server
chmod +x ~/bin/code-server
# upVSCodeServer
# echo "Updating Golang"
# [[ -f /usr/local/go/bin/go ]] && INST_VER=$(go version | cut -d" " -f3) || INST_VER=""
# echo ${INST_VER}
# #REM_VER=$(curl -s https://go.dev/VERSION?m=text)
# REM_VER=$( wget -qO- https://golang.org/dl/ | grep 'id=\"go' | head -1 | grep -oP -e '(go[0-9\.]+)' )
# echo ${REM_VER}
# [[ $INST_VER == $REM_VER ]] && return || echo "Local: ${INST_VER} - Remote: ${REM_VER}"
# sudo rm -rf /usr/local/go
# wget -qO- https://golang.org$( wget -qO- https://golang.org/dl/ | grep -oP '/dl/go([0-9\.]+)\.linux-amd64.tar.gz' | head -1)  | sudo tar zxf - -C /usr/local
# upGo
# upPath
# go version
#upGo
# upGoTools
# upGoCodeX
