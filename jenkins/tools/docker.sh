#!/bin/bash

set -euo pipefail

echo "=== docker setup ==="
if command -v docker &> /dev/null; then
  echo "terraform already installed"

fi

sudo apt-get update -y
apt-get install docker.io

docker --version

echo "docker installed successfully"