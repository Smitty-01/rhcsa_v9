
# EXC 15.1

# In this exercise, you will change the hostnames of both lab servers
# persistently. You will rename server1.example.com to
# server10.example.com by editing a file and restarting the
# corresponding service daemon. You will rename server2.example.com
# to server20.example.com using a command. You will validate the
# change on both systems.

hostname
vim /etc/hostname
systemctl restart systemd-hostnamed
reboot
hostname

#EXC 15.2
# In this exercise, you will shut down server10 and server20. You will
# launch VirtualBox Manager and add one network interface to
# server10 and one to server20. You will power on both servers and
# confirm new interfaces.
3: enp7s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 52:54:00:a3:78:90 brd ff:ff:ff:ff:ff:ff
[ashmit12@server1 ~]$ 


# EXC 15.3
# In this exercise, you will create a connection profile for the new
# network interface enp0s8 using a text editing tool. You will assign the
# IP 172.10.10.110/24 with gateway 172.10.10.1 and set it to
# autoactivate at system reboots. You will deactivate and reactivate this
# interface at the command prompt.

nmtui 
add -> enp7s0
add ip and gateway
nmcli c d enp7s0
nmcli c u enp70

# EXC 15.4
# In this exercise, you will create a connection profile using the nmcli
# command for the new network interface enp0s8 that was added to
# server20 in Exercise 15-2. You will assign the IP 172.10.10.120/24
# with gateway 172.10.10.1, and confirm.

[ashmit12@server1 ~]$ nmcli connection add con-name mycon
 ifname enp0s8 ipv4.addresses 172.10.10.120/24 ipv4.gateway 172.10.10.1
 type ethernet  ipv4.method manual


