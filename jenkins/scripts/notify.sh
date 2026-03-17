#!/bin/bash

MESSGAE = $1
LOG_FILE = $2

echo "sending notification..."

if [-f "$LOG_FILE"]; then

  LOG_CONTENT = $(tail -n 20 $LOG_FILE)
else
  LOG_CONTENT = "mo LOG file found"
fi
FINAL_MESSAGE = "$MESSAGE\n\nlast Logs:\n$LOG_CONTENT"

aws sns publish \ 
| tee -a $LOG_FILE