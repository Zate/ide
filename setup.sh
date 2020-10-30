#!/bin/bash
set -euo pipefail

export DEBIAN_FRONTEND=noninteractive
packages=''


for i in `cat packages`; do
    packages="${packages} ${i}"
done

apt-get update
apt-get --no-install-recommends upgrade -y
apt-get --no-install-recommends --no-install-suggests -y install ${packages}
locale-gen en_US.UTF-8
LC_ALL=en_US.UTF-8
adduser --gecos '' --shell /bin/bash --disabled-password ${1}
adduser ${1} sudo
echo "${1} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/nopasswd
echo "alias python=python3" >> /etc/profile
echo "alias pip=pip3" >> /etc/profile
mkdir -p /home/${1}/{bin,.aws,.ssh,.local/bin,project}
chown -R ${1}:${1} /home/${1}
python3 -m pip install --upgrade pip
apt-get clean
rm -rf /var/lib/apt/lists/*