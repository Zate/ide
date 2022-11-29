#!/bin/bash
set -euo pipefail

source ~/.local/.bash_inc

echo $(date --iso-8601=seconds) > ~/.bts
cat ~/.bts

sudo apt-get update
sudo apt-get --no-install-recommends upgrade -y
code-server update --accept-server-license-terms
