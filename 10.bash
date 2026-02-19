#EXC 10.1
# In this exercise, you will set up access to the two dnf repositories
# that are available on RHEL 9 image. You’ve already configured an
# automatic mounting of RHEL 9 image on /mnt in Chapter 09 “Basic
# Package Management”. You will create a definition file for the
# repositories and confirm.

[ashmit12@server1 ~]$ df -h | grep mnt
/dev/sr0                12G   12G     0 100% /mnt
[root@server1 ashmit12]# touch local.repo /etc/yum.repos.d

[BaseOS]
name=Base OS software
baseurl=file:///mnt/BaseOS
enabled=1
gpgcheck=0

[Appstream]
name=Application software
baseurl=file:///mnt/AppStream
enabled=1
gpgcheck=0
[root@server1 ashmit12]# dnf repolist -v
Loaded plugins: builddep, changelog, config-manager, copr, debug, debuginfo-install, download, generate_completion_cache, groups-manager, kpatch, needs-restarting, notify-packagekit, playground, product-id, repoclosure, repodiff, repograph, repomanage, reposync, subscription-manager, system-upgrade, uploadprofile
Updating Subscription Management repositories.
DNF version: 4.14.0
cachedir: /var/cache/dnf
Red Hat Enterprise Linux 9 for x86_64 - AppStream (RPMs)                 5.5 kB/s | 4.5 kB     00:00    
Red Hat Enterprise Linux 9 for x86_64 - BaseOS (RPMs)                     13 kB/s | 4.1 kB     00:00    
Base OS software                                                         2.7 MB/s | 2.7 kB     00:00    
Application software                                                     3.1 MB/s | 3.2 kB     00:00    
Repo-id            : Appstream
Repo-name          : Application software
Repo-revision      : 1744153785
Repo-updated       : Wed 09 Apr 2025 04:39:45 AM IST
Repo-pkgs          : 6,262
Repo-available-pkgs: 5,907
Repo-size          : 9.3 G
Repo-baseurl       : file:///mnt/AppStream
Repo-expire        : 172,800 second(s) (last: Thu 19 Feb 2026 11:23:49 AM IST)
Repo-filename      : /etc/yum.repos.d/redhat.repo

Repo-id            : BaseOS
Repo-name          : Base OS software
Repo-revision      : 1744153810
Repo-updated       : Wed 09 Apr 2025 04:40:10 AM IST
Repo-pkgs          : 1,173
Repo-available-pkgs: 1,173
Repo-size          : 1.4 G
Repo-baseurl       : file:///mnt/BaseOS
Repo-expire        : 172,800 second(s) (last: Thu 19 Feb 2026 11:23:49 AM IST)
Repo-filename      : /etc/yum.repos.d/redhat.repo

Repo-id            : rhel-9-for-x86_64-appstream-rpms
Repo-name          : Red Hat Enterprise Linux 9 for x86_64 - AppStream (RPMs)
Repo-revision      : 1771437807
Repo-updated       : Wed 18 Feb 2026 11:33:27 PM IST
Repo-pkgs          : 30,673
Repo-available-pkgs: 29,009
Repo-size          : 119 G
Repo-baseurl       : https://cdn.redhat.com/content/dist/rhel9/9/x86_64/appstream/os
Repo-expire        : 86,400 second(s) (last: Thu 19 Feb 2026 11:23:48 AM IST)
Repo-filename      : /etc/yum.repos.d/redhat.repo

Repo-id            : rhel-9-for-x86_64-baseos-rpms
Repo-name          : Red Hat Enterprise Linux 9 for x86_64 - BaseOS (RPMs)
Repo-revision      : 1771437776
Repo-updated       : Wed 18 Feb 2026 11:32:55 PM IST
Repo-pkgs          : 13,274
Repo-available-pkgs: 13,274
Repo-size          : 53 G
Repo-baseurl       : https://cdn.redhat.com/content/dist/rhel9/9/x86_64/baseos/os
Repo-expire        : 86,400 second(s) (last: Thu 19 Feb 2026 11:23:49 AM IST)
Repo-filename      : /etc/yum.repos.d/redhat.repo
Total packages: 51,382
[root@server1 ashmit12]#


# EXC 10.2
# In this exercise, you will perform management operations on a
# package called cifs-utils. You will determine if this package is already
# installed and if it is available for installation. You will display its
# information before installing it. You will install the package and
# exhibit its information. Finally, you will erase the package along with
# its dependencies and confirm the removal.

  129  dnf list | grep cifs-utils
  131  dnf list installed | grep cifs-utils
  132  dnf info cifs-utils
  

# EXC 10.3
# In this exercise, you will perform management operations on a
# package group called system tools. You will determine if this group is
# already installed and if it is available for installation. You will list the
# packages it contains and install it. Finally, you will remove the group
# along with its dependencies and confirm the removal  

 134  dnf group list installed 'system tools'
  135  dnf group info 'system tools'
  136  dnf group install 'system tools'
  137  history
