# 降低Ubuntu 14.04的内核版本

http://blog.csdn.net/zhengmx100/article/details/55047967

研究某个问题时需要安装一个软件， linux内核需要指定为3.19.0-47。

先用Ubuntu 14.04的镜像安装一台服务器。

**查看内核版本**

$ sudo uname -r

3.19.0-25-generic

**安装3.19.0-47-generic 等3个内核相关的软件包:**

$ sudo apt-get install -y linux-image-3.19.0-47-generic linux-image-extra-3.19.0-47-generic linux-headers-3.19.0-47-generic

**卸载3.19.0-25版本的内核相关的软件包:**

apt-get purge -y linux-image-3.19.0-25 linux-image-extra-3.19.0-25-generic

apt-get purge -y linux-headers-3.19.0-25 linux-headers-3.19.0-25-generic

**重启服务器**

**reboot**