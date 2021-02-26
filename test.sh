#!/bin/bash

MASTERIP=10.10.90.100
MASTERNAME=master

NODE1IP=10.10.90.101
NODE1NAME=node1

NODE2IP=10.10.90.102
NODE2NAME=node2

echo $MASTERIP
pause

# Update hosts file
echo "[TASK 1] Update /etc/hosts file"
cat >>tmp<<EOF
$MASTERIP $MASTERNAME.example.com
$NODE1IP $NODE1NAME.example.com
$NODE2IP $NODE2NAME.example.com
EOF

