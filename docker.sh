#!/bin/bash
set -x #echo on

# https://docs.docker.com/engine/install/ubuntu/
# https://docs.docker.com/compose/install/compose-plugin/
# https://linuxhandbook.com/docker-permission-denied/

# Ubuntu Jammy 22.04 (LTS)
# Ubuntu Impish 21.10
# Ubuntu Focal 20.04 (LTS)
# Ubuntu Bionic 18.04 (LTS)

sudo apt-get update
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

docker --version
docker compose version

sudo usermod -aG docker $USER
exit
