#!/bin/bash
#LOG_FILE="/home/elamrati/auto-update.log"

#exec >> >(
#  while read -r line;
#  do
#    echo "$(date '+%Y-%m-%d %H:%M:%S') $line";
#  done >> "$LOG_FILE"
# ) 2>&1

echo "=== Auto-update started ==="
apt update
apt upgrade -y
apt autoremove -y
echo "=== Auto-update finished ==="

#Reboot if needed
if [ -f /var/run/reboot-required ]; then
        /sbin/shutdown -r now
fi
