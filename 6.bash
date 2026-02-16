#EXC 6.1
# In this exercise, you will configure password aging for user100 using
# the chage command. You will set mindays to 7, maxdays to 28, and
# warndays to 5, and verify the new settings. You will then rerun the
# command and set account expiry to December 31, 2023. You will
# complete the exercise with another confirmation.


[root@server1 ~]# chage -m 7 -M 28 -W 5 user100
[root@server1 ~]# chage -l user100
Last password change					: Feb 15, 2026
Password expires					: Mar 15, 2026
Password inactive					: never
Account expires						: never
Minimum number of days between password change		: 7
Maximum number of days between password change		: 28
Number of days of warning before password expires	: 5
[root@server1 ~]# chage -E 2026-12-31 user100

# EXC 6.2
# In this exercise, you will configure password aging for user200 using
# the passwd command. You will set mindays to 10, maxdays to 90,
# and warndays to 14, and verify the new settings.
# Next, you will set the number of inactivity days to 5 and ensure that
# the user is forced to change their password upon next login. You will
# complete the exercise with another verification.

#EXC 6.3
# In this exercise, you will disable the ability for user200 to log in using
# the usermod and passwd commands. You will verify the change and
# then reverse it.
[root@server1 ~]# usermod -L user200
[root@server1 ~]# usermod -U user100
[root@server1 ~]# grep user200 /etc/shadow
[root@server1 ~]# grep user100 /etc/shadow
user100:$6$rounds=100000$5jNdOhikgAxtozs9$jFSoEXLwtFAoUsDwSZtBq6YtauxqUIyPpMjEgk5iFzXlrxfNUbrL5P2K0.TLLgRqtJ5ImQErYlVMXkAK8sz761:20499:7:28:5::20818:
[root@server1 ~]# 


#EXC 6.4
# In this exercise, you will create a group called linuxadm with GID
# 5000 and another group called dba sharing the GID 5000. You will
# add user1 as a secondary member to group dba.
[root@server1 ~]# groupadd -g 5000 linuxadm
[root@server1 ~]# groupadd -o -g 5000 dba
[root@server1 ~]# cat /etc/group | grep linuxadm
linuxadm:x:5000:
[root@server1 ~]# cat /etc/group | grep dba
dba:x:5000:
[root@server1 ~]# usermod -aG dba user100



# EXC 6.5
# In this exercise, you will change the linuxadm group name to sysadm
# and the GID to 6000. You will add user200 to sysadm group as a
# secondary member. You will remove the sysadm group and verify.

[root@server1 ~]# groupmod -n sysadm linuxadm
[root@server1 ~]# groupmod -g 6000 sysadm
[root@server1 ~]# cat /etc/group | grep sysadm
sysadm:x:6000:
[root@server1 ~]# usermod -aG  sysadm user100
[root@server1 ~]# cat /etc/group | grep sysadm
sysadm:x:6000:user100
[root@server1 ~]# groupdel sysadm

# EXC 6.6
# This exercise should be done on server1 as user1 with sudo where
# required.
# In this exercise, you will first create a file file10 and a directory dir10
# as user1 under /tmp, and then change the ownership for file10 to
# user100 and the owning group to dba in two separate transactions.
# Then you’ll apply ownership on file10 to user200 and owning group
# to user100 at the same time. Finally, you will change the two
# attributes on the directory to user200:dba recursively. Make sure to
# use sudo where necessary.

[root@server1 ~]# chown -c user100 /tmp/dir10/file10
changed ownership of '/tmp/dir10/file10' from root to user100
[root@server1 ~]# chgrp -c dba /tmp/dir10/file10
changed group of '/tmp/dir10/file10' from root to dba
[root@server1 ~]# chgrp -c dba /tmp/dir10/file10
[root@server1 ~]# ls -l /tmp/dir10 | grep file10
-rw-r--r--. 1 user100 dba 0 Feb 16 14:11 file10
[root@server1 ~]# 
[root@server1 ~]# chown ashmit12:dba /tmp/dir10/file10
[root@server1 ~]# 


