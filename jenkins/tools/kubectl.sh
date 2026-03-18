#!/bin/bash

set -euo pipefail

echo "=== kubectl setup ==="

if command -v &> /dev/null; then
  echo "kubectl already installed"

fi

apt-get update -y
apt-get install curl

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
install -m 0755 kubectl /usr/local/bin/kubectl

kubectl version --client