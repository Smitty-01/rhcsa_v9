# EXC 8.1
# You will need two terminal sessions to perform this exercise. Let’s call
# them Terminal 1 and Terminal 2.
# In this exercise, you will launch the top program three times and
# observe how the ps command reports the priority and niceness
# values. You will execute the program the first time at the default
# priority, the second time at a lower priority, and the third time at a
# higher priority. You will control which priority to run the program at
# by specifying a niceness value with the nice command. You will verify
# the new niceness and priority after each execution of the top session.


top
nice -n 2 top
ps -efl | grep top
nice -n -10 top
[ashmit12@server1 ~]$ ps -efl | grep top
0 S ashmit12    2549    1943  0  80   0 - 210929 do_pol 12:58 ?       00:00:00 /usr/libexec/xdg-desktop-portal
0 S ashmit12    2566    1943  0  80   0 - 278869 do_pol 12:58 ?       00:00:00 /usr/libexec/xdg-desktop-portal-gnome
0 S ashmit12    2591    1943  0  80   0 - 147854 do_pol 12:58 ?       00:00:00 /usr/libexec/xdg-desktop-portal-gtk
4 S root        3434    3097  0  70 -10 - 56476 -      15:39 pts/1    00:00:00 top
0 S ashmit12    3436    3358  0  80   0 - 55449 pipe_r 15:39 pts/2    00:00:00 grep --color=auto top
[ashmit12@server1 ~]$ renice 


# EXC 8.2
# In this exercise, you will launch the top program at the default
# priority and alter its priority without restarting it. You will set a new
# priority by specifying a niceness value with the renice command. You
# will verify the new niceness and priority after each execution of the
# top session.

[root@server1 ~]# sudo renice -n -5 3452
3452 (process ID) old priority 0, new priority -5
[root@server1 ~]# 


# EXC 8.3
# This exercise should be done on server1 as user1.
# In this exercise, you will submit an at job as user1 to run the date
# command at 11:30 p.m. on March 31, 2023, and have the output and
# any error messages generated redirected to the /tmp/date.out file.
# You will list the submitted job, exhibit its contents for verification, and
# then remove the job.

at 11:30pm 3/21/2026
at>date &> /tmp/date.out
at><EOT>
ls -l /var/spoll/at
at -c 2 #(job id)
at -d 2 

