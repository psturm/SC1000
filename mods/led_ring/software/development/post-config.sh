#!/bin/bash
#
# simple script to send a new pattern config
set -eu

# this IP is hard coded in the AccessPoint config
IP="192.168.23.5"

# Collection of patterns
declare -a PATTERNS=(
    "pattern=0,220,0,0;180,0,0,254;270,0,210,0"
    "pattern=0,0,0,254;120,254,0,0;240,0,220,0"
    "pattern=0,254,0,0;180,254,0,254"
    "pattern=0,1,2,254;90,3,200,254;180,254,4,5;270,6,220,7"
    "pattern=0,254,253,252"
    "pattern=0,254,253,0"
)

# Select a random one
rand=$[$RANDOM % ${#PATTERNS[@]}]
pattern="${PATTERNS[$rand]}"

# Send to LED ring
echo "[SENDING] ${pattern}"
curl \
    --data "${pattern}" \
    --connect-timeout 5 \
    http://${IP}/

echo
