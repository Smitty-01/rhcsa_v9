
# EXC 4.1
# For this exercise, presume that a file called permfile1 exists with read
# permission for the owner (user1), owning group (user1), and other,
# as shown below. If the permissions vary, bring them to the desired
# state by executing chmod 444 permfile1 prior to starting the exercise.
# In this exercise, you will add an execute bit for the owner and a write
# bit for group and public. You will then revoke the write bit from public
# and assign read, write, and execute bits to the three user categories
# at the same time. Finally, you will revoke write from the owning
# group and write and execute bits from public. The chmod command
# accepts the -v switch to display what it has changed. You may
# alternatively view the long listing after each command execution for
# verification.

   83  chmod u-w permfile1
   84  ls -l permfile1
   85  chmod x+u perfile1 -v
   86  chmod u+x  perfile1 -v
   87  chmod u+x  permfile1 -v
   88  chmod go+w  permfile1 -v
   89  chmod -v o-w permfile1 
   92  chmod u+rwx,g+rwx,o+rwx permfile1
   93  ls -l permfile1
   94  chmod g-w,o-wx permfile1 -v
   95  ls -l
   96  history

# EXC 4.2
# This exercise should be done on server1 as user1.
# For this exercise, a file called permfile2 exists with read permission
# for the owner (user1), owning group (user1), and other, as shown
# below. If the permissions vary, bring them to the desired state by
# executing chmod 444 permfile2 prior to starting the exercise.
# In this exercise, you will add an execute bit for the owner and a write
# permission bit for group and public. You will then revoke the write bit
# from public and assign read, write, and execute permissions to the
# three user categories at the same time. The chmod command
# accepts the -v flag to display what it has changed. You may
# alternatively view the long listing after each command execution for
# verification.

[root@server1 ~]# touch file2
[root@server1 ~]# ls -l 
total 4
-rw-------. 1 root root 998 Feb  9 05:33 anaconda-ks.cfg
-rw-r--r--. 1 root root   0 Feb 15 18:59 file2
drwxr-xr-x. 3 root root  22 Feb  9 05:32 home
-rwxr-xr--. 1 root root   0 Feb 15 18:41 permfile1
[root@server1 ~]# chmod 444 file2
[root@server1 ~]# ls -l
total 4
-rw-------. 1 root root 998 Feb  9 05:33 anaconda-ks.cfg
-r--r--r--. 1 root root   0 Feb 15 18:59 file2
drwxr-xr-x. 3 root root  22 Feb  9 05:32 home
-rwxr-xr--. 1 root root   0 Feb 15 18:41 permfile1
[root@server1 ~]# chmod 766 permfile1
[root@server1 ~]# ls -l
total 4
-rw-------. 1 root root 998 Feb  9 05:33 anaconda-ks.cfg
-r--r--r--. 1 root root   0 Feb 15 18:59 file2
drwxr-xr-x. 3 root root  22 Feb  9 05:32 home
-rwxrw-rw-. 1 root root   0 Feb 15 18:41 permfile1
[root@server1 ~]# chmod 566 file2
[root@server1 ~]# ls -l
total 4
-rw-------. 1 root root 998 Feb  9 05:33 anaconda-ks.cfg
-r-xrw-rw-. 1 root root   0 Feb 15 18:59 file2
drwxr-xr-x. 3 root root  22 Feb  9 05:32 home
-rwxrw-rw-. 1 root root   0 Feb 15 18:41 permfile1
[root@server1 ~]# chmod 545 file2
[root@server1 ~]# chmod 777 file2
[root@server1 ~]# ls -l
total 4
-rw-------. 1 root root 998 Feb  9 05:33 anaconda-ks.cfg
-rwxrwxrwx. 1 root root   0 Feb 15 18:59 file2
drwxr-xr-x. 3 root root  22 Feb  9 05:32 home
-rwxrw-rw-. 1 root root   0 Feb 15 18:41 permfile1
[root@server1 ~]# 


# EXC 4.3
# This exercise should be done on server1 as root and user1.
# In this exercise, you will need two terminal windows, one with a root
# session running and another with user1 on it. As user1, you will
# switch into root and observe what happens. As root, you will then
# revoke the setuid bit from the /usr/bin/su file and retry switching into
# root again. After the completion of the exercise, you will restore the
# setuid bit on /usr/bin/su

[root@server1 ~]# chmod -v u-s /usr/bin/su
mode of '/usr/bin/su' changed from 4755 (rwsr-xr-x) to 0755 (rwxr-xr-x)
[root@server1 ~]# chmod -v u+s /usr/bin/su
mode of '/usr/bin/su' changed from 0755 (rwxr-xr-x) to 4755 (rwsr-xr-x)
[root@server1 ~]# 

# 4.4-4.5-4.6 kal
