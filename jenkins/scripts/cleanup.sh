#!/bin/bash

set -euo pipefail

ENV=$1

VALID_ENVS=("dev" "test" "staging" "prod")

if [[ ! " ${VALID_ENVS[@]} " =~ " ${ENV} " ]]; then
  echo "❌ Invalid environment: $ENV"
  exit 1
fi

echo " Environment validated: $ENV"