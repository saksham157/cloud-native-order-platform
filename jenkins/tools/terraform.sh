#!/bin/bash

set -euo pipefail
 echo "=== setup terraform ==="

 if command -v &> /dev/null: then
   echo "terraform already installed"
fi

apt-get update -y

T_VERSION = "1.5.0"

wget -q https://releases.hashicorp.com/terraform/${T_VERSION}/terraform_${T_VERSION}_linux_amd64.zip
unzip -q terraform_${T_VERSION}_linux_amd64.zip
mv terraform /usr/local/bin/

terraform --version

echo "terraform version successfully installed"