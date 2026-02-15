# EXC 3.1
# In this exercise, you will create a tarball called home.tar.gz of the
# /home directory under /tmp and compress it with gzip. You will
# create another tarball called home.tar.bz2 of the /home directory
# under /tmp and compress it with bzip2. You will list the content of
# home.tar.gz without uncompressing it and then extract all the files in
# the current directory. Finally, you will extract the bzip2-compressed
# archive in the /tmp directory.

tar -czf /tmp/home.tar.gz /home
tar -cjf /tmp/home.tar.bz2 /home
tar -tf /tmp/home.tar.gz
tar -xf /tmp/home.tar.gz

# EXC 3.2
# In this exercise, you will create an empty file hard1 under /tmp and
# display its attributes (the inode number, permissions, number of links,
# owning user, owning group, size, and timestamp). You will create two
# hard links hard2 and hard3 for it and list the attributes for all three
# files. You will edit hard2 and add some text. You will list the attributes
# for all three files again and observe identicalness in all attributes
# except for the names of files. You will remove hard1 and hard3 and
# list the attributes again for the remaining file. You will notice a
# decrease in the link count by 2.

cd /tmp
touch hard1
ls -il
ln hard1 hard2
ln hard1 hard3
vi hard2
ls -il
rm hard1 hard3
ls -il


# EXC 3.3
# In this exercise, you will create a soft link soft1 under /root pointing
# to /tmp/hard2. You will display the attributes (the inode number,
# permissions, number of links, owning user, owning group, size, and
# timestamp) for both files. You will open soft1 for edit and list the
# attributes after editing. You will remove hard2 and then list soft1. You
# will notice that soft1 becomes invalid, pointing to something that
# does not exist. Remove soft1 to complete the exercise

ln -s /tmp/hard2 /root/soft1
ls -il /root/soft1
vi /root/soft1
ls -il /tmp/hard2
vi /root/soft1
ls -il /tmp/hard2
ls -il /root/soft1
rm /tmp/hard2
ls -il /root/soft1
rm /root/soft1


