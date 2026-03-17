#!/bin/bash

set -euo pipefail
$ENV = $1
$LOG_FILE = "terraform-$ENV-$(date +%F-%H%M).log"

# trap errors
trap 'handle error $LINENO' ERR
handle_error(){
    echo "error at line $1"
    echo "command failed: $BASH_COMMAND"

    #send log to sns

    bash ../scripts/notify.sh " $ENV deployment failed" "$LOG_FILE"
    exit 1

}

echo "=== run infra ===="
echo "ENV: $ENV" | tee -a $LOG_FILE
echo "PWD:$(pwd)" | tee -a $LOG_FILE

cd terraform/environments/$ENV || {
    echo "folder not found: terraform/environments/$ENV"
    exit 1 
}

echo "initilizing terraform" | tee -a $LOG_FILE
terraform init 2>&1 | tee -a $LOG_FILE

echo "validate terraform" | tee -a $LOG_FILE
terraform validate 2>&1 | tee -a $LOG_FILE

echo "planning"
terraform plan -out=tfplan 2>&1 | tee -a $LOG_FILE

echo "applying terraform on infra and updated"
terraform apply -auto-approve tfplan 2>&1 -a $LOG_FILE

echo "infra applied for $ENV" | tee -a $LOG_FILE

# success notfication
bash ../scripts/notify.sh "$ENV deployment successfull" "$LOG_FILE"
