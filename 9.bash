# CAN ACCESS RPM REPO WITHOUT NET 
# EXC 9.1
# In this exercise, you will attach the RHEL 9 ISO image to the RHEL9-
# VM1 in VirtualBox and mount the image on /mnt directory on server1
# to access and manipulate the software packages in it with the rpm
# command. You will ensure that the image is automatically mounted
# on each system reboot. You will confirm access to the packages by
# listing the subdirectories that store them.

mount the rhel iso 
makethe entry in /etc/fstab for persistent mount
/dev/sr0 /mnt iso9660 ro 0 0 
mount -a 

# EXC 9.2
# In this exercise, you will verify the integrity and authenticity of a
# package called rmt located in the /mnt/BaseOS/Packages directory on
# the installation image and then install it. You will display basic
# information about the package, show files it contains, list
# documentation files, verify the package attributes, and erase the
# package

  166  cd /mnt
  167  cd ls
  168  ls
  171  cd BaseOS
  172  ls
  173  cd Packages/
  174  ls
  175  ls | grep rmt
  176  rpmkeys --help
  178  rpmkeys -K rmt-1.6-6.el9.x86_64.rpm
  179  rpm -ivh rmt-1.6-6.el9.x86_64.rpm
  180  rpm --help
  181  man rpm
  182  rpm -qi rmt
  183  rpm -ve rmt
