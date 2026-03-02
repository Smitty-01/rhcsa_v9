# EXC 13.2
# In this exercise, you will assign partition type “msdos” to /dev/sdb for
# using it as an MBR disk. You will create and confirm a 100MB primary
# partition on the disk


[ashmit12@server1 ~]$ sudo parted /dev/sdb mklabel msdos
[sudo] password for ashmit12: 
Error: Could not stat device /dev/sdb - No such file or directory.
Retry/Cancel? cancel                                                      
[ashmit12@server1 ~]$ sudo parted /dev/vda  mklabel msdos
Warning: Partition(s) on /dev/vda are being used.
Ignore/Cancel? ignore                                                     
Warning: The existing disk label on /dev/vda will be destroyed and all data on
this disk will be lost. Do you want to continue?
Yes/No? yes                                                               
Error: Partition(s) 1, 2 on /dev/vda have been written, but we have been unable
to inform the kernel of the change, probably because it/they are in use.  As a
result, the old partition(s) will remain in use.  You should reboot now before
making further changes.
Ignore/Cancel? ignore
Information: You may need to update /etc/fstab.

[ashmit12@server1 ~]$ lsblk                                               
NAME          MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
sda             8:0    0   20G  0 disk 
sr0            11:0    1 11.9G  0 rom  /mnt
vda           252:0    0   40G  0 disk 
\u251c\u2500vda1        252:1    0    1G  0 part /boot
\u2514\u2500vda2        252:2    0   39G  0 part 
  \u251c\u2500rhel-root 253:0    0 35.9G  0 lvm  /
  \u2514\u2500rhel-swap 253:1    0  3.1G  0 lvm  [SWAP]
vdb           252:16   0  256M  0 disk 
vdc           252:32   0  256M  0 disk 
vdd           252:48   0  256M  0 disk 
vde           252:64   0  256M  0 disk 
[ashmit12@server1 ~]$ sudo parted /dev/vda print
Model: Virtio Block Device (virtblk)
Disk /dev/vda: 42.9GB
Sector size (logical/physical): 512B/512B
Partition Table: msdos
Disk Flags: 

Number  Start  End  Size  Type  File system  Flags

[ashmit12@server1 ~]$ 
[root@server1 ~]# fdisk /dev/vda

Welcome to fdisk (util-linux 2.37.4).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.
]

Command (m for help): p

Disk /dev/vda: 40 GiB, 42949672960 bytes, 83886080 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x5c888400

Device     Boot Start    End Sectors Size Id Type
/dev/vda1        2048 196607  194560  95M 83 Linux

Command (m for help): 



# EXC 13.3
# This exercise should be done on server2 as user1 with sudo where
# required.
# In this exercise, you will delete the sdb1 partition that was created in
# Exercise 13-2 and confirm the deletion.

[root@server1 ~]# lsblk
NAME          MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
sda             8:0    0   20G  0 disk 
sr0            11:0    1 11.9G  0 rom  /mnt
vda           252:0    0   40G  0 disk 
\u251c\u2500vda1        252:1    0   95M  0 part /boot
\u2514\u2500vda2        252:2    0   39G  0 part 
  \u251c\u2500rhel-root 253:0    0 35.9G  0 lvm  /
  \u2514\u2500rhel-swap 253:1    0  3.1G  0 lvm  [SWAP]
vdb           252:16   0  256M  0 disk 
vdc           252:32   0  256M  0 disk 
vdd           252:48   0  256M  0 disk 
vde           252:64   0  256M  0 disk 
[root@server1 ~]# parted /dev/vda rm vdb
Error: Partition doesn't exist.
[root@server1 ~]# parted /dev/vda rm vda1
Error: Partition doesn't exist.
[root@server1 ~]# parted /dev/vda rm /vda/vda1                            
Error: Partition doesn't exist.
[root@server1 ~]# parted /dev/vda rm 1                                    
Warning: Partition /dev/vda1 is being used. Are you sure you want to continue?
Yes/No? yes                                                               
Error: Partition(s) 1, 2 on /dev/vda have been written, but we have been unable to inform the kernel of the change, probably because it/they
are in use.  As a result, the old partition(s) will remain in use.  You should reboot now before making further changes.
Ignore/Cancel? ignore                                                     
Information: You may need to update /etc/fstab.

