TUNED SYSTEM PERFORMANCE

set dynamic tuning to 1 by /etc/tuned/tuned-main.conf 

tuned profiles are stored in /usr/lib/tuned 

[ashmit-1@localhost ~]$ ls /usr/lib/tuned
accelerator-performance  desktop      latency-performance      powersave               virtual-host
aws                      functions    network-latency          recommend.d
balanced                 hpc-compute  network-throughput       throughput-performance
balanced-battery         intel-sst    optimize-serial-console  virtual-guest
[ashmit-1@localhost ~]$ 

Currently active profile --->
[ashmit-1@localhost ~]$ tuned-adm active
Current active profile: balanced
[ashmit-1@localhost ~]$ 

Set new profile ---->
[root@localhost ~]# tuned-adm profile virtual-guest
[root@localhost ~]# tuned-adm active
Current active profile: virtual-guest
[root@localhost ~]# 


DIRTY RATIO
If dirty memory exceeds this % → processes are forced to wait until data is flushed to disk
vm.dirty_ratio = 20
Max 20% of RAM can be dirty
Stop. Write to disk first.”

SWAPPINESS
Controls how aggressively Linux uses swap instead of RAM
Moves inactive data from RAM → swap (disk)
RAM becomes free
But accessing swapped data later = slow
Your system has:
RAM = fast memory
Swap = slow backup memory (on disk)
vm.swappiness = 10
→ “Use RAM as much as possible, avoid swap”

CPU INFO
/proc/cpuinfo

nice -n {5} niceness of a process
value < 0 more priority 

renice to change priority of existing process