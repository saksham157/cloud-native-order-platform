#!/bin/bash

set -euo pipefail

echo "===aws cli setup===="

if command -v aws &> /dev/null; then
    echo "aws cli already installed: $(aws --version)"
  exit 0

fi

apt-get update -y
apt-get install -y unzip curl

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip -q awscliv2.zip
./aws/install

echo "aws cli installed successfully"
