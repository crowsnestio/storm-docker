#!/bin/sh

cat >> conf/storm.yaml <<EOF
storm.local.dir: "/tmp"
EOF

if [ -n "$1" ]; then
   cat >> conf/storm.yaml <<EOF
storm.zookeeper.servers: ["$1"]
EOF
fi

if [ -n "$NIMBUS_SERVICE_HOST" ]; then
   cat >> conf/storm.yaml <<EOF
nimbus.seeds:
  - "$NIMBUS_SERVICE_HOST"
EOF
fi

# If there are additional nimbus hosts, make sure to add them.
if [ -n "$NIMBUS_SECONDARY_SERVICE_HOST" ]; then
    cat >> conf/storm.yaml <<EOF
  - "$NIMBUS_SECONDARY_SERVICE_HOST"
EOF
fi

# If there are additional nimbus hosts, make sure to add them.
if [ -n "$NIMBUS_TERTIARY_SERVICE_HOST" ]; then
    cat >> conf/storm.yaml <<EOF
  - "$NIMBUS_TERTIARY_SERVICE_HOST"
EOF
fi

# If pacemaker is enabled, make sure to add that too.

if [ -n "$PACEMAKER_SERVICE_HOST" ]; then
    cat >> conf/storm.yaml <<EOF
pacemaker.host: "$PACEMAKER_SERVICE_HOST"
pacemaker.port: $PACEMAKER_SERVICE_PORT
storm.cluster.state.store: "org.apache.storm.pacemaker.pacemaker_state_factory"
EOF
fi

cat conf/storm.yaml
