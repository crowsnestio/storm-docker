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

if [ -n "$PACEMAKER_SERVICE_HOST" ]; then
	cat >> conf/storm.yaml <<EOF
pacemaker.host: "$PACEMAKER_SERVICE_HOST"
pacemaker.port: $PACEMAKER_SERVICE_PORT
storm.cluster.state.store: "org.apache.storm.pacemaker.pacemaker_state_factory"
EOF
fi

cat conf/storm.yaml
