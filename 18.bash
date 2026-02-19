# EXC 18.1
# This exercise works under two assumptions: (1) user1 exists on both
# server10 and server20, and (2) hostname and IP mapping is in place
# in the /etc/hosts file (Chapter 16). Use the IP address in lieu of the
# hostname if the mapping is unavailable for server20.

create same user on both servers 
in ( server1) 
/etc/hosts map server2 ip mappings

127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
192.168.122.144 server2 server2
~                                    



[ashmit12@server1 ~]$ ssh server2
ashmit12@server2's password: 
Register this system with Red Hat Insights: rhc connect



[ashmit12@server2 ~]$ 
[ashmit12@server2 ~]$ hostname
server2
[ashmit12@server2 ~]$ logout
Connection to server2 closed.
[ashmit12@server1 ~]$ 


# EXC18.2
# This exercise should be done on server10 and server20 as user1 and
# sudo where required. In this exercise, you will generate a
# passwordless ssh key pair using RSA algorithm for user1 on server10.
# You will display the private and public file contents. You will distribute
# the public key to server20 and attempt to log on to server20 from
# server10. You will show the log file message for the login attempt                                           

ashmit12@server1 ~]$ ssh-keygen
Generating public/private rsa key pair.
Enter file in which to save the key (/home/ashmit12/.ssh/id_rsa): 
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /home/ashmit12/.ssh/id_rsa
Your public key has been saved in /home/ashmit12/.ssh/id_rsa.pub
The key fingerprint is:
SHA256:63tMgvHpsO7zG6D5Q7Lkn9fqckvOVFStsNKz62kayJY ashmit12@server2
The key's randomart image is:
+---[RSA 3072]----+
|            ..   |
|          ..  .  |
|         ..o .   |
|      . ..+ .    |
|      .+So.o     |
|    o++++oo      |
|   oo+E+*= .     |
|    oo=B+o*.     |
|     +*O%Xo      |
+----[SHA256]-----+
[ashmit12@server1 ~]$ ssh-copy-id server2
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/ashmit12/.ssh/id_rsa.pub"
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
ashmit12@server2's password: 

Number of key(s) added: 1

Now try logging into the machine, with:   "ssh 'server2'"
and check to make sure that only the key(s) you wanted were added.

[ashmit12@server1 ~]$ ssh server2
Register this system with Red Hat Insights: rhc connect
[ashmit12@server2 ~]$ logout
Connection to server2 closed.
[ashmit12@server1 ~]$ 



