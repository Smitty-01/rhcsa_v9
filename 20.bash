# EXC 20.1
# In this exercise, you will create a directory sedir1 under /tmp and a
# file sefile1 under sedir1. You will check the context on the directory
# and file. You will change the SELinux user and type to user_u and
# public_content_t on both and verify.

[root@server1 ~]# semanage fcontext -a -s user_u -t public_content_t "/tmp/sedir1"
[root@server1 ~]# ls -Z /tmp/sedir1
unconfined_u:object_r:user_tmp_t:s0 sefile1
[root@server1 ~]# restorecon -Rv /tmp/sedir1
Relabeled /tmp/sedir1 from unconfined_u:object_r:user_tmp_t:s0 to unconfined_u:object_r:public_content_t:s0


# EXC 20.3
# In this exercise, you will add a non-standard network port 8010 to
# the SELinux policy database for the httpd service and confirm the
# addition. You will then remove the port from the policy and verify the
# deletion.

[root@server1 ~]# semanage post -at http_port_t -p tco 8010
[root@server1 ~]# semanage port -dp tcp 8010
[root@server1 ~]# 

# EXC 20.4
# In this exercise, you will display the current state of the Boolean
# nfs_export_all_rw. You will toggle its value temporarily, and reboot
# the system. You will flip its value persistently after the system has
# been back up.

  172  sudo getsebool -a | grep nfs_export_all_rw
  174  sudo setsebool nfs_export_all_rw 0
  175  sudo getsebool -a | grep nfs_export_all_rw
  176  reboot
  178  sudo getsebool -a  | grep nfs_export_all_rw
  182  sudo setsebool -P nfs_export_all_rw 0
  183  sudo getsebool -a | grep nfs_export_all_rw
  184  history
[ashmit12@server1 ~]$ 
