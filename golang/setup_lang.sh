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

git config --global user.name ${USER}
git config --global user.email ${EMAIL}
upPath
upPip
upCodeServer
upGo
upGoTools
upGoCodeX
