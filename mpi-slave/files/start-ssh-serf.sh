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

sleep 6

serf members

echo -e "\nmpi-cluster-docker developed by gongkun <gongkunjxl@163.com>"
#mount a file 
serf members |grep master | awk -F :7946 '{print $1}' | awk '{print $2}' > tmp
master_IP=($(cat tmp))
mount -t nfs $master_IP:/home/MPI /home/MPI
