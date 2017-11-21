FROM gongkunjxl/mpi-base:0.1.0

MAINTAINER gongkun <gongkunjxl@163.com>

WORKDIR /root

# install openssh-server, openjdk and wget
#RUN apt-get update && apt-get install -y nfs-kernel-server gcc build-essential g++
RUN apt-get update && apt-get install -y nfs-kernel-server

#files
COPY files/* /tmp/

#RUN mv /tmp/bashrc ~/.bashrc && \
RUN mv /tmp/mount.sh ~/mount.sh && \
    mv /tmp/config.sh ~/config.sh && \
    mv /tmp/start-ssh-serf.sh ~/start-ssh-serf.sh

RUN chmod -R 777 ~/config.sh && \
    chmod -R 777 ~/mount.sh && \
    chmod -R 777 ~/start-ssh-serf.sh

#mount files
RUN mkdir -p /home/MPI
RUN chmod -R 777 /home/MPI
RUN echo "/home/MPI *(rw,sync,no_subtree_check)" >> /etc/exports

#start cp MPI test 
RUN mkdir -p /user/MPI

COPY MPI/* /user/MPI/
RUN mv /user/MPI/* /home/MPI/

#the privileged
RUN chmod 644 ~/.ssh/config
#CMD [ "sh", "-c", "service ssh start; bash"]

EXPOSE 22 7373 7946 9000 50010 50020 50070 50075 50090 50475 8030 8031 8032 8033 8040 8042 8060 8088 50060

CMD '/root/start-ssh-serf.sh'; 'bash'
















