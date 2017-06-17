# Docker CPU limits


Install docker-machine, create a virtual machine with two CPUs, copy Dockerfile to stressbox:

```
$ docker-machine create -d virtualbox --virtualbox-cpu-count 2 stressbox
$ docker-machine scp Dockerfile stressbox:/home/docker
```


From now on, all below commands should be executed in virtualmachine. Do NOT run these commands in your host. You have been warned.


```
stressbox> docker build -t stress .
stressbox> tce-load -wi htop
stressbox> export TERM=xterm-color
stressbox> htop
```

You should be able to see stressbox has two CPUs, press 'q' to exit htop.


run stress, all the two CPUs are 100% in use.

```
worker1> docker run -d --rm --name stresstest stress
worker1> htop
worker1> docker stop stresstest
```


Limit stress into CPU #0.

```
worker1> docker run -d --rm --name stresstest --cpuset-cpus 0 stress
worker1> htop
worker1> docker stop stresstest
```


Let's set CPU limit to less than 1.

```
worker1> docker run -d --rm --name stresstest --cpus 0.75 stress
worker1> htop
worker1> docker stop stresstest
```
