#!/bin/sh

/configure.sh ${ZOOKEEPER_SERVICE_HOST:-$1} ${NIMBUS_SERVICE_HOST:-$2}

# Make sure we override the worker local.hostname so workers can find each other easier.
export LOCAL_IP=$(ifconfig eth0 | grep inet\ addr | awk '{print $2}' | cut -d: -f2)

cat >> conf/storm.yaml <<EOF
storm.local.hostname: "$LOCAL_IP"
EOF

exec /opt/apache-storm/bin/storm supervisor
