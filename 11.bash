# EXC 11.1
# In this exercise, you will change the default system boot timeout value to 8 seconds persistently, and
# validate.

[root@server1 ~]# cat /etc/default/grub
GRUB_TIMEOUT=5
GRUB_DISTRIBUTOR="$(sed 's, release .*$,,g' /etc/system-release)"
GRUB_DEFAULT=saved
GRUB_DISABLE_SUBMENU=true
GRUB_TERMINAL_OUTPUT="console"
GRUB_CMDLINE_LINUX="crashkernel=1G-4G:192M,4G-64G:256M,64G-:512M resume=/dev/mapper/rhel-swap rd.lvm.lv=rhel/root rd.lvm.lv=rhel/swap"
GRUB_DISABLE_RECOVERY="true"
GRUB_ENABLE_BLSCFG=true
[root@server1 ~]# vi /etc/default/grub
[root@server1 ~]# grub2-mkconfig -o /boot/grub2/grub.cfg
Generating grub configuration file ...
Adding boot menu entry for UEFI Firmwa

# EXC 11.2
# For this exercise, assume that the root user password is lost, stolen,
# or forgotten, and it needs to be reset.
# In this exercise, you will terminate the boot process at an early stage
# to be placed in a special debug shell to reset the root password.

enter grub using esc key
init = /bin/bash
mount -o remount ,rw /
passwd root
touch /.autorelabel
exec /usr/lib/systemd/systemd