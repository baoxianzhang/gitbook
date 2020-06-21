# ubuntu设置静态IP 18.04

参考：  

https://blog.csdn.net/qq_36937342/article/details/80876385



主要步骤：

+ 虚拟机使用 Bridged 模式, 使得主机和虚拟机分别有独立的IP

+ 查看自己网卡编号, 注意是无线还是有线的网卡

  ```sh
  ip a # ifconfig
  ```

+ 设置IP， sudo vi /etc/network/interfaces

  ``` sh
  auto lo
  iface lo inet loopback
  auto xxxxx
  iface xxxxx inet static
  address 192.168.xx.x
  netmask 255.255.255.0
  gateway 192.168.xx.1
  ```

+ 输入sudo /etc/init.d/networking restart重启网络

+ 加入DNS, 命令行输入sudo vi /etc/systemd/resolved.conf 修改改文件

  ``` sh
  DNS=8.8.8.8 223.5.5.5
  ```

  

+ 重启电脑