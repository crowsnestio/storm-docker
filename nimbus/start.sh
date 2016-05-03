#!/bin/sh

/configure.sh ${ZOOKEEPER_SERVICE_HOST:-$1}

exec /opt/apache-storm/bin/storm nimbus

