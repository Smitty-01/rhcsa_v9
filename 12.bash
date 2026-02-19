# EXC 12.1
# In this exercise, you will run the necessary steps to enable and
# confirm persistent storage for the journals.
[root@server1 ~]# grep -i storage /etc/systemd/journald.conf
#Storage=auto
[root@server1 ~]# ls /var/log/journal
[root@server1 ~]# ls /var/log
anaconda           boot.log-20260219  firewalld            maillog            secure
audit              btmp               gdm                  maillog-20260215   secure-20260215
boot.log           chrony             hawkey.log           messages           speech-dispatcher
boot.log-20260213  cron               hawkey.log-20260218  messages-20260215  spooler
boot.log-20260214  cron-20260215      insights-client      private            spooler-20260215
boot.log-20260215  cups               journal              qemu-ga            sssd
boot.log-20260216  dnf.librepo.log    lastlog              README             tallylog
boot.log-20260217  dnf.log            lat.log              rhsm               tuned
boot.log-20260218  dnf.rpm.log        lat_metrics.prom     samba              wtmp
[root@server1 ~]# mkdir -p /var/log/journal
[root@server1 ~]# systemctl restart systemd-journald
[root@server1 ~]# ls /var/log/journal
[root@server1 ~]# 

# EXC 12.2
# In this exercise, you will install and start the tuned service and enable
# it for auto-restart upon future system reboots. You will display all
# available profiles and the current active profile. You will switch to one
# of the available profiles and confirm. You will determine the
# recommended profile for the system and switch to it. Finally, you will
# deactivate tuning and reactivate it. You will confirm the activation to
# conclude the exercise.

[root@server1 ~]# dnf install -y tuned
[root@server1 ~]# systemctl --now enable tuned
[root@server1 ~]# tuned-adm list
Available profiles:
- accelerator-performance     - Throughput performance based tuning with disabled higher latency STOP states
- aws                         - Optimize for aws ec2 instances
- balanced                    - General non-specialized tuned profile
- balanced-battery            - Balanced profile biased towards power savings changes for battery
- desktop                     - Optimize for the desktop use-case
- hpc-compute                 - Optimize for HPC compute workloads
- intel-sst                   - Configure for Intel Speed Select Base Frequency
- latency-performance         - Optimize for deterministic performance at the cost of increased power consumption
- network-latency             - Optimize for deterministic performance at the cost of increased power consumption, focused on low latency network performance
- network-throughput          - Optimize for streaming network throughput, generally only necessary on older CPUs or 40G+ networks
- optimize-serial-console     - Optimize for serial console use.
- powersave                   - Optimize for low power consumption
- throughput-performance      - Broadly applicable tuning that provides excellent performance across a variety of common server workloads
- virtual-guest               - Optimize for running inside a virtual guest
- virtual-host                - Optimize for running KVM guests
Current active profile: balanced
[root@server1 ~]# tuned-adm 
active        -h            list          profile       profile_mode  -v            --version
auto_profile  --help        off           profile_info  recommend     verify        
[root@server1 ~]# tuned-adm 
active        -h            list          profile       profile_mode  -v            --version
auto_profile  --help        off           profile_info  recommend     verify        
[root@server1 ~]# tuned-adm active
Current active profile: balanced
[root@server1 ~]# tuned-dm recommend
bash: tuned-dm: command not found...
[root@server1 ~]# tuned-adm recommend
virtual-guest
[root@server1 ~]# tuned-adm off
[root@server1 ~]# tuned-adm active
No current active profile.
[root@server1 ~]# tuned-adm profile virtual-guest