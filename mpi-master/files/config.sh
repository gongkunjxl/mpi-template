#!/bin/bash
echo master.gongkun.com > /home/MPI/hostfile;
for i in  $(seq $(serf members|grep slave|wc -l)) ; do echo slave$i.gongkun.com >> /home/MPI/hostfile; done;
cat /etc/hosts|grep -v mpi|grep -v master > /tmp/hosts
cat /tmp/hosts > /etc/hosts
serf members |awk -F :7946 '{print $1}'|awk '{print $2 "\t" $1}'>> /etc/hosts;
serf members |grep master|awk -F :  '{print $1}'|awk '{print $2"\tmaster.gongkun.com"}' >> /etc/hosts;
cc=0;cat /etc/hosts|grep mpi-slave|while read line ; do ((cc++)); echo $line slave$cc.gongkun.com >> /etc/hosts; done;
cat /home/MPI/hostfile|grep slave|while read line ; do  scp -o StrictHostKeyChecking=no /etc/hosts $line:/etc/hosts;  done; 
