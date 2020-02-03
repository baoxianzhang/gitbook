# 修复ubuntu启动错误 incompatible license aborted

一大早起来，电脑启动出现错误：

incompatible license

Aborted. Press any key to exit.

解决方法：

使用U 盘，进入ubuntu安装系统

主要思想是，重新更新安装之前的boot分区。

如果/boot是独立分配一个分区。则把这个分区重新安装grub。

如果/boot是和/是在同一个分区，则把/分区下的boot重新安装。

查找系统上的分区，

sudo fdisk -l 

or  

fdisk -l

这会列出一系列的分区。找到/boot所在的分区。

**以下讲解的是/boot是一块独立分区。**

/dev/sda10

首先, 挂载/boot分区，

sudo mount /dev/sda10 /mnt

这时，进入到/mnt里面会有grub文件夹等，

重新安装boot

sudo grub-install --boot-directory=/mnt/ /dev/sda

显示安装成功之后，

取消挂载

sudo umount /mnt

**以下讲解的是/boot和/是在同一块分区。**

/dev/sda12

首先, 挂载/boot分区，

sudo mount /dev/sda12 /mnt

这时，进入到/mnt里面会有boot文件夹等，

重新安装boot

sudo grub-install --boot-directory=/mnt/boot/ /dev/sda

显示安装成功之后，

取消挂载

sudo umount /mnt

**重启就可以正常启动了。**