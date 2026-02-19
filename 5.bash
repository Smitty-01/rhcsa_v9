# EXC 5.1
# In this exercise, you will create a user account user2 using the
# defaults defined in the useradd and login.defs files. You will assign
# this user a password and show the new line entries from all four
# authentication files.

[root@server1 ~]# useradd user2
[root@server1 ~]# passwd user2
Changing password for user user2.
New password: 
BAD PASSWORD: The password contains the user name in some form
Retype new password: 
passwd: all authentication tokens updated successfully.
[root@server1 ~]# grep user2 :passwd shadow group gshadow
grep: :passwd: No such file or directory
grep: shadow: No such file or directory
grep: group: No such file or directory
grep: gshadow: No such file or directory
[root@server1 ~]# grep user2 :/etc/passwd /etc/shadow /etc/group /etc/gshadow
grep: :/etc/passwd: No such file or directory
/etc/shadow:user2:$6$rounds=100000$xEJ0bgcvbcVV9uku$cGbTRh0y85KF9AQpxnS/RGwurH9Z5/aIJDSK28Cxw.y8Cg1qScCb/eqhOD50Iey8rZa6j94x2Sd/.i28rutqd0:20503:0:99999:7:::
/etc/group:user2:x:1002:
/etc/gshadow:user2:!::
[root@server1 ~]# 

# EXC 5.2
# In this exercise, you will create an account user3 with UID 1010,
# home directory /usr/user3a, and shell /bin/sh. You will assign this
# user a password and exhibit the new line entries from all four
# authentication files.

[root@server1 ~]# useradd -u 1010 -d /usr/user3a -s /bin/sh user3
[root@server1 ~]# passwd user3
Changing password for user user3.
New password: 
BAD PASSWORD: The password contains the user name in some form
Retype new password: 
passwd: all authentication tokens updated successfully.
[root@server1 ~]# cd /etc ; grep user3 : passwd group shadow gshadow
grep: :: No such file or directory
passwd:user3:x:1010:1010::/usr/user3a:/bin/sh
group:user3:x:1010:
shadow:user3:$6$rounds=100000$mjz03exibP3qe9ge$OhNuE3LRZS4sVx7TqwvtXPFdwyQmsJaIASATpWLrBkybtq3adowYRcJcyXz5QlOhbjSVs7MyZVXAJbsJLWBWr.:20503:0:99999:7:::
gshadow:user3:!::
[root@server1 etc]# 

# EXC 5.3
# In this exercise, you will modify certain attributes for user2 and then
# delete it. You will change the login name to user2new, UID to 2000,
# home directory to /home/user2new, and login shell to /sbin/nologin.
# You will display the line entry for user2new from the passwd file for
# validation. Finally, you will remove this user and confirm the deletion.

usermod -l user2new -m -d /home/user2new -s /sbin/nologin -u 2000 user2
grep user2new /etc/passwd
userdel -r user2mew


# EXC 5.4
# In this exercise, you will create an account user4 with all the default
# attributes but with a non-interactive shell. You will assign this user
# the nologin shell to prevent them from signing in. You will di

[root@server1 ~]# useradd -s /sbin/nologin user4
[root@server1 ~]# passwd user4
Changing password for user user4.
New password: 
BAD PASSWORD: The password contains the user name in some form
Retype new password: 
passwd: all authentication tokens updated successfully.
[root@server1 ~]# grep user4 /etc/passwd
user4:x:1011:1011::/home/user4:/sbin/nologin
[root@server1 ~]# su - user4
This account is currently not available.
[root@server1 ~]# 

