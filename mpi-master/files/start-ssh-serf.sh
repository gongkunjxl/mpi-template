#!/bin/bash

# start sshd
echo "start sshd..."
service ssh start

#start nfs kernel-server
echo "start rpcbind and  nfs-kernel-server..."
service rpcbind start

service nfs-kernel-server start

# start sef
echo -e "\nstart serf..." 
/etc/serf/start-serf-agent.sh > serf_log &

sleep 5

serf members

echo -e "\nmpi-cluster-docker developed by gongkun <gongkunjxl@163.com>"
