#!/bin/bash

set -euo pipefail

COMMAND=$1
MAX_RETRIES=3
COUNT=0

echo "===== RETRY LOGIC START ====="

until [ $COUNT -ge $MAX_RETRIES ]
do
  echo "Attempt $((COUNT+1))..."

  if eval "$COMMAND"; then
    echo "✅ Command succeeded"
    exit 0
  fi

  COUNT=$((COUNT+1))
  echo "⚠️ Failed... retrying ($COUNT/$MAX_RETRIES)"
  sleep 5
done

echo "❌ All retries failed"
exit 1