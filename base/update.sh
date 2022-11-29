#!/bin/bash
# set -euo pipefail

# #export DEBIAN_FRONTEND=noninteractive
# packages=''


# for i in `cat /tmp/packages`; do
#     packages="${packages} ${i}"
# done

# apt-get update
# apt-get --no-install-recommends upgrade -y
# apt-get --no-install-recommends --no-install-suggests -y install ${packages}
# locale-gen en_US.UTF-8
# LC_ALL=en_US.UTF-8
# adduser --gecos '' --shell /bin/bash --disabled-password ${USER}
# adduser ${USER} sudo
# echo "${USER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/nopasswd
# echo "alias python=python3" >> /etc/profile
# echo "alias pip=pip3" >> /etc/profile
# mkdir -p /home/${USER}/{bin,.ssh,.local/bin,project,.cache/pip}
# chown -R ${USER}:${USER} /home/${USER}
# apt-get clean
# rm -rf /var/lib/apt/lists/*
# echo ${USER}
# echo ${EMAIL}
# echo ${HOME}