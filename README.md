# Hadoop on OpenShift Demo

The demo is to show how fast and how easy you can setup a Hadoop cluster with OpenShift.

I had uploaded the demo video to YouTube and 56.com. Here are the links:
YouTube: https://youtu.be/wD6_8REgKuo
56.com: http://www.56.com/u65/v_MTQwNTA5NDc4.html

The demo is based on the Hadoop images of https://github.com/kiwenlau/hadoop-cluster-docker, many thanks to LIU's hard work.
What I have done is to to add a little bit of tricks to make it works with OpenShift and make it more automative while scaling the cluster.

##Seting up

###Clone the repository
    git clone https://github.com/nichochen/openshift3-demo-hadoop

###Bulid the Docker image
    cd openshift3-demo-hadoop/nic-hadoop-master/
    make
  
###Create templates in OpenShift
    cd openshift3-demo-hadoop/nic-hadoop-master/openshift
    oc create -f hadoop-master.json -n openshift
    oc create -f hadoop-slave.json -n openshift

Now you are all set, just process to create your own Hadoop cluster with the web console or command line tool oc.
For more information on how to start and test the Hadoop cluster, please go through the documentation at https://github.com/kiwenlau/hadoop-cluster-docker.

Enjoy~

Thanks,
Nicholas
