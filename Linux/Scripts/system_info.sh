#!/bin/bash

echo "======================================"
echo "         SYSTEM INFORMATION"
echo "======================================"

echo "Executed By: $(whoami)"
echo "Hostname: $(hostname)"
echo "Server IP: $(hostname -I | awk '{print $1}')"
echo "Public IP: $(curl -fsS --max-time 5 https://api.ipify.org 2>/dev/null || echo 'Unavailable')"

. /etc/os-release
echo "OS Type and Version: $PRETTY_NAME"

echo "Kernel Version: $(uname -r)"
echo "Architecture: $(uname -m)"
echo "Virtualization: $(systemd-detect-virt 2>/dev/null || echo 'Unknown')"

echo "Server Time: $(date)"
echo "Timezone: $(date +%Z)"
echo "Uptime: $(uptime -p)"

echo
echo "======================================"
echo "           RESOURCE USAGE"
echo "======================================"

echo "Total Memory: $(free -h | awk '/^Mem:/ {print $2}')"
echo "Memory Usage: $(free -h | awk '/^Mem:/ {print $3}')"
echo "Swap Usage: $(free -h | awk '/^Swap:/ {print $3 " / " $2}')"
echo "CPU Cores: $(nproc)"

echo "======================================"
