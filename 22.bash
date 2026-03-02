# EXC 22.1
# In this exercise, you will install the necessary software to set the
# foundation for completing the exercises in the remainder of the
# chapter. The standard RHEL 9.1 image includes a package called
# container-tools that consists of all the required components and
# commands. You will use the standard dnf command to install the
# package.

[root@server1 ~]# dnf install  -y container-tools
Updating Subscription Management repositories.
Base OS software                                2.7 MB/s | 2.7 kB     00:00    
Application software                            3.1 MB/s | 3.2 kB     00:00    
Dependencies resolved.

# EXC 22.2
# In this exercise, you will log in to the registry.access.redhat.com
# registry with the Red Hat credentials that you created in Chapter 01
# “Local Installation” to download the RHEL 9.1 image. You will look for
# an image called mysql-80 in the registry, examine its details, pull it to
# your system, confirm the retrieval, and finally erase it from the local
# storage. You will use the podman and skopeo commands as required
# for these operations.

[root@server1 ~]# podman login registry.redhat.io
Username: @shmit123
Password: 
Login Succeeded!
[root@server1 ~]# podman search registry.redhat.io/mysql-80
NAME                                     DESCRIPTION
registry.redhat.io/rhel8/mysql-80        MySQL 8.0 SQL database server
registry.redhat.io/rhel9/mysql-80        MySQL 8.0 SQL database server
registry.redhat.io/rhscl/mysql-80-rhel7  MySQL 8.0 SQL database server

[root@server1 ~]# podman pull docker://registry.redhat.io/rhel9/mysql-80
Trying to pull registry.redhat.io/rhel9/mysql-80:latest...
Getting image source signatures
Checking if image destination supports signatures
Copying blob e39d8e001810 done   | 
Copying blob 56b2ec53eb90 done   | 
Copying blob f3a0a6a8ea45 done   | 
Copying config 6015d2da4e done   | 
Writing manifest to image destination
Storing signatures
6015d2da4eb73e4030aa51f1c753b03fa0a7fe96

[root@server1 ~]# podman images
REPOSITORY                         TAG         IMAGE ID      CREATED     SIZE
registry.redhat.io/rhel9/mysql-80  latest      6015d2da4eb7  2 days ago  553 MB
[root@server1 ~]# podman rmi mysql-80
Untagged: registry.redhat.io/rhel9/mysql-80:latest
Deleted: 6015d2da4eb73e4030aa51f1c753b03fa0a7fe96831fc6d5df77cbf9cc429b5d
[root@server1 ~]# 

# EXC 22.4
# In this exercise, you will run a container based on the latest version
# of the RHEL 8 ubi available in the Red Hat container registry. You will
# assign this container a name and run a few native Linux commands
# in a terminal window interactively. You will exit out of the container to
# mark the completion of the exercise.

[ashmit12@server1 ~]$ podman run -ti --name rhel8 ubi8
Resolved "ubi8" as an alias (/etc/containers/registries.conf.d/001-rhel-shortnames.conf)
Trying to pull registry.access.redhat.com/ubi8:latest...
Getting image source signatures
Checking if image destination supports signatures
Copying blob 67191b575927 done   | 
Copying config d4059916b2 done   | 
Writing manifest to image destination
Storing signatures
[root@5dc44b7af599 /]# pwd
/
[root@5dc44b7af599 /]# ls
bin  boot  dev	etc  home  lib	lib64  media  mnt  opt	proc  root  run  sbin  srv  sys  tmp  usr  var
[root@5dc44b7af599 /]# cd home
[root@5dc44b7af599 home]# ls
[root@5dc44b7af599 home]# exit
exit
[ashmit12@server1 ~]$ podman stop rhel8
rhel8
[ashmit12@server1 ~]$ podman rm rhel8
rhel8
[ashmit12@server1 ~]$ 


# EXC 22.5
# In this exercise, you will launch a container based on the latest
# version of RHEL 7 ubi available in a Red Hat container registry. This
# image provides the base operating system layer to deploy
# containerized applications. You will enter a Linux command at the
# command line for execution inside the container as an entry point
# command and the container should be automatically deleted right
# after that

[ashmit12@server1 ~]$ podman run -it --rm ubi8 ls
bin  boot  dev	etc  home  lib	lib64  media  mnt  opt	proc  root  run  sbin  srv  sys  tmp  usr  var
[ashmit12@server1 ~]$ 


# EXC 22.6
# In this exercise, you will launch a container called rhel7-port-map in
# detached mode (as a daemon) with host port 10000 mapped to port
# 8000 inside the container. You will use a version of the RHEL 7 image
# with Apache web server software pre-installed. This image is
# available from a Red Hat container registry. You will list the running
# container and confirm the port mapping.


[ashmit12@server1 ~]$ podman search registry.redhat.io/rhel7/apache
NAME                                                DESCRIPTION
registry.redhat.io/rhscl/php-72-rhel7               Platform for building and running PHP 7.2 ap...
registry.redhat.io/rhscl/php-73-rhel7               Platform for building and running PHP 7.3 ap...
registry.redhat.io/rhscl/perl-524-rhel7             Platform for building and running Perl 5.24...
registry.redhat.io/rhscl/perl-530-rhel7             Platform for building and running Perl 5.30...
registry.redhat.io/rhscl/httpd-24-rhel7             Platform for running Apache httpd 2.4 or bui...
registry.redhat.io/rhscl/php-70-rhel7               Platform for building and running PHP 7.0 ap...
registry.redhat.io/rhscl/php-71-rhel7               Platform for building and running PHP 7.1 ap...
registry.redhat.io/rhscl/perl-520-rhel7             Perl 5.20 platform for building and running...
registry.redhat.io/rhscl/perl-526-rhel7             Platform for building and running Perl 5.26...
registry.redhat.io/amq7/amq-streams-kafka-26-rhel7  AMQ Streams image for running Apache Kafka,...
registry.redhat.io/amq7/amq-streams-kafka-24-rhel7  AMQ Streams image for running Apache Kafka,...
registry.redhat.io/amq7/amqstreams-bridge-rhel7     AMQ Streams image for running the Apache Kaf...
registry.redhat.io/amq7/amqstreams-kafka-23-rhel7   AMQ Streams image for running Apache Kafka,...
registry.redhat.io/openshift3/php-55-rhel7          PHP 5.5 platform for building and running ap...
registry.redhat.io/amq7/amq-streams-kafka-23-rhel7  AMQ Streams image for running Apache Kafka,...
registry.redhat.io/openshift3/perl-516-rhel7        Perl 5.16 platform for building and running...
[ashmit12@server1 ~]$ podman pull registry.redhat.io/rhscl/httpd-24-rhel7
Trying to pull registry.redhat.io/rhscl/httpd-24-rhel7:latest...
Getting image source signatures
Checking if image destination supports signatures
Copying blob 7f2c2c4492b6 done   | 
Copying blob fd77da0b900b done   | 
Copying blob ea092d7970b2 done   | 
Copying config 847db19d6c done   | 
Writing manifest to image destination
Storing signatures
847db19d6cbc726106c901a7713d30dccc9033031ec812037c4c458319a1b328
[ashmit12@server1 ~]$ podman images
REPOSITORY                               TAG         IMAGE ID      CREATED        SIZE
registry.redhat.io/rhscl/httpd-24-rhel7  latest      847db19d6cbc  21 months ago  332 MB
[ashmit12@server1 ~]$ podman -dp 1000:8000 --name rhel7-port-map httpd-24-rhel7
Error: unknown shorthand flag: 'd' in -dp
See 'podman --help'
[ashmit12@server1 ~]$ podman run -dp 1000:8000 --name rhel7-port-map httpd-24-rhel7
Error: pasta failed with exit code 1:
Failed to bind port 1000 (Permission denied) for option '-t 1000-1000:8000-8000', exiting

[ashmit12@server1 ~]$ su
Password: 
[root@server1 ashmit12]# podman run -dp 1000:8000 --name rhel7-port-map httpd-24-rhel7
\u2714 registry.redhat.io/httpd-24-rhel7:latest
Trying to pull registry.redhat.io/httpd-24-rhel7:latest...
Error: initializing source docker://registry.redhat.io/httpd-24-rhel7:latest: reading manifest latest in registry.redhat.io/httpd-24-rhel7: unauthorized: access to the requested resource is not authorized
[root@server1 ashmit12]# podman login registry.redhat.io
Authenticating with existing credentials for registry.redhat.io
Existing credentials are valid. Already logged in to registry.redhat.io
[root@server1 ashmit12]# podman run -dp 1000:8000 --name rhel7-port-map httpd-24-rhel7
\u2714 registry.redhat.io/httpd-24-rhel7:latest
Trying to pull registry.redhat.io/httpd-24-rhel7:latest...
Error: initializing source docker://registry.redhat.io/httpd-24-rhel7:latest: reading manifest latest in registry.redhat.io/httpd-24-rhel7: unauthorized: access to the requested resource is not authorized
[root@server1 ashmit12]# subscription-manager status
+-------------------------------------------+
   System Status Details
+-------------------------------------------+
Overall Status: Disabled
Content Access Mode is set to Simple Content Access. This host has access to content, regardless of subscription status.

System Purpose Status: Disabled

[root@server1 ashmit12]# 




# EXC 22.8
# In this exercise, you will launch a container using the latest version of
# a ubi for RHEL 9 available in a Red Hat container registry. You will
# inject the HISTSIZE environment variable, and a variable called
# SECRET with a value “secret123”. You will name this container rhel9-
# env-vars and have a shell terminal opened to check the variable
# settings. Finally, you will remove this container.




[ashmit12@server1 ~]$ podman run -it -e HISTSIZE SECRET="secret123" --name rhel9-env ubi9
Error: parsing reference "SECRET=secret123": invalid reference format
[ashmit12@server1 ~]$ podman run -it -e HISTSIZE -e SECRET="secret123" --name rhel9-env ubi9
Resolved "ubi9" as an alias (/etc/containers/registries.conf.d/001-rhel-shortnames.conf)
Trying to pull registry.access.redhat.com/ubi9:latest...
Getting image source signatures
Checking if image destination supports signatures
Copying blob 56b2ec53eb90 done   | 
Copying config 0b32f0d6c0 done   | 
Writing manifest to image destination
Storing signatures
[root@70a8f4ab4c3f /]# echo $HISTSIZE
1000
[root@70a8f4ab4c3f /]# exit
exit
[ashmit12@server1 ~]$ podman run  -e HISTSIZE -e SECRET="secret123" --name rhel9-env ubi9
Error: creating container storage: the container name "rhel9-env" is already in use by 70a8f4ab4c3f91272f583a61ad464e715169ffec19133bab7333eaf37cc4581b. You have to remove that container to be able to reuse that name: that name is already in use, or use --replace to instruct Podman to do so.
[ashmit12@server1 ~]$ podman ps -a
CONTAINER ID  IMAGE                                           COMMAND               CREATED        STATUS                     PORTS                                       NAMES
3325e857db6f  registry.redhat.io/rhscl/httpd-24-rhel7:latest  /usr/bin/run-http...  3 hours ago    Created                    0.0.0.0:1000->8000/tcp, 8080/tcp, 8443/tcp  rhel7-port-map
70a8f4ab4c3f  registry.access.redhat.com/ubi9:latest          /bin/bash             2 minutes ago  Exited (0) 26 seconds ago                                              rhel9-env
[ashmit12@server1 ~]$ podman stop rhel9-env
rhel9-env
[ashmit12@server1 ~]$ podman ps -a
CONTAINER ID  IMAGE                                           COMMAND               CREATED      STATUS      PORTS                                       NAMES
3325e857db6f  registry.redhat.io/rhscl/httpd-24-rhel7:latest  /usr/bin/run-http...  3 hours ago  Created     0.0.0.0:1000->8000/tcp, 8080/tcp, 8443/tcp  rhel7-port-map
[ashmit12@server1 ~]$ 

