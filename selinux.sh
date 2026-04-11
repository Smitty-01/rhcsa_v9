Modes of SELinux
Enforcing : Enforce loaded policies
Permissive: Do no load policies but log violation
Disabled: No access

Persistently change the mode in /etc/selinux/config


EX:
a mariadb server has files with type mysqld_t and all files
in the /data/mysql have mysql_db_t so the server now can only access those files
and not any other file with diff label


default SElinux context is in /etc/selinux/targeted/contexts/files

COPY changes context to parent dir 
MOVE does not change context

SELinux context format
user:role:type:level
system_u:object_r:file_context_t:s0
SELinux user -> system_u
file_context_t (type)
Type (most important part).
This defines what the file is used for.
Here:
file_context_t → file related to SELinux labeling rules.


unconfined_u:object_r:audio_home_t:s0  Music

unconfined_u (user)
SELinux user for regular users (no strict restrictions).
object_r (role)
Standard role for files/directories.
audio_home_t (type)
This is the key part:
audio_home_t → directory meant for audio files (Music)
s0 (level)
Default security level.

semanage fcontext -l lists all SELinux file context rules configured on the system.
/usr/lib/dirsrv/dsgw-cgi-bin(/.*)?                 all files          system_u:object_r:dirsrvadmin_script_exec_t:s0 
/usr/lib/docker/[^/]*plugin                        regular file       system_u:object_r:container_runtime_exec_t:s0 
/usr/lib/docker/docker-novolume-plugin             regular file       system_u:object_r:container_auth_exec_t:s0 
/usr/lib/dotnet/dotnet                             regular file       system_u:object_r:bin_t:s0 
/usr/lib/dovecot/(.*/)?lib.*\.so.*                 regular file       system_u:object_r:lib_t:s0 


DEFAULT POLICIES

[root@localhost ~]# mkdir /virtual
[root@localhost ~]# touch /virtual/index.html
[root@localhost ~]# ls -Zd /virtual
unconfined_u:object_r:default_t:s0 /virtual
[root@localhost ~]# ls -Z /virtual
unconfined_u:object_r:default_t:s0 index.html
[root@localhost ~]# 

semanage fcontext -a -t httpd_sys_content_t '/virtual(/.*)?'

Adds a new SELinux file context rule
Matches:

/virtual
/virtual/anything

restorecon resets SELinux labels on files to what they should be based on the rules defined



