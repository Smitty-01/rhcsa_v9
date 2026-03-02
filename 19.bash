# EXC 19.1
# In this exercise, you will determine the current active zone. You will
# add and activate a permanent rule to allow HTTP traffic on port 80,
# and then add a runtime rule for traffic intended for TCP port 443 (the
# HTTPS service). You will add a permanent rule to the internal zone
# for TCP port range 5901 to 5910. You will confirm the changes and
# display the contents of the affected zone files. Lastly, you will switch
# the default zone to the internal zone and activate it.

[root@server1 ~]# firewall-cmd --get-default-zone
public
[root@server1 ~]# firewall-cmd --permanent --add-service http
success
[root@server1 ~]# firewall-cmd --reload 
success
[root@server1 ~]# firewall-cmd --list-services
cockpit dhcpv6-client http nfs ssh
[root@server1 ~]# firewall-cmd --add-port 443/tcp
success
[root@server1 ~]# firewall-cmd --add-port 5901-5910/tcp --permanent --zone internal
success
Query whether panic mode is enabled

[root@server1 ~]# firewall-cmd --set-default internal
success
[root@server1 ~]# firewall-cmd --get-default
internal
[root@server1 ~]# 


# EXC 19.2
# In this exercise, you will remove the two permanent rules that were
# added in Exercise 19-1. You will switch the public zone back as the
# default zone, and confirm the changes.

[root@server1 ~]# firewall-cmd --remove-service=http --zone public --permanent 
success
[root@server1 ~]# firewall-cmd --remove-port 5901-5910/tcp public --permanent 
usage: 'firewall-cmd --help' for usage information or see firewall-cmd(1) man page
firewall-cmd: error: unrecognized arguments: public
[root@server1 ~]# firewall-cmd --remove-port 5901-5910/tcp  --permanent 
success
[root@server1 ~]# 
