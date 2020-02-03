# **ubuntu**开机只显示**空白桌面**解决方案

 

重新安装如下：

 

sudo apt-get install gdm 

 

sudo apt-get install **ubuntu**-desktop 

 

sudo apt-get install gnome-core 

 

顺利安装了gnome，重启，

 

ubuntu只能显示桌面，无任何图标，启动栏也没有？

看起来是unity没起来或者被意外删除了.

试试看:

sudo apt-get install ubuntu-desktop --reinstall 

我曾经也遇到过，是这样解决的

ctrl+alt+f2切换到字符界面，

sudo apt-get remove gnome-desktop

sudo apt-get install gnome-desktop。reboot。