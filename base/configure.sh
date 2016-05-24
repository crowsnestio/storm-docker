#!/bin/sh

export LOCAL_IP=$(ifconfig eth0 | grep inet\ addr | awk '{print $2}' | cut -d: -f2)
cat >> conf/storm.yaml <<EOF
storm.local.dir: "/tmp"
storm.local.hostname: "$LOCAL_IP"
EOF

if [ -n "$1" ]; then
   cat >> conf/storm.yaml <<EOF
storm.zookeeper.servers: ["$1"]
EOF
fi

if [ -n "$2" ]; then
   cat >> conf/storm.yaml <<EOF
nimbus.seeds: ["$2"]
EOF
fi

cat conf/storm.yaml
