a.serf 下载地址: https://releases.hashicorp.com/serf/ 构建mpi-base:0.1.0的镜像  serf-dnsmasq下面
b.构建mpi-master和mpi-slave镜像 mpi-slave需要挂在文件 和mpi-master有点点区别
c.上传到registory仓库 
d.template下创建template 然后可以界面操作了
e.进入/home/MPI目录下 mpicc -o mpi_array mpi_array.c
mpirun --hostfile hostfile -np 4 mpi_array即可运行程序
