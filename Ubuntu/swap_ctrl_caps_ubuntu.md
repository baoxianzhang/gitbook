# 给Ubuntu 交换Ctrl和Caps按键

参考： https://www.tuziang.com/combat/567.html



## 第一种方法

在/etc/default/keyboard文件中添加

```
XKBOPTIONS="ctrl:nocaps"
```

重启后，就可以实现将Caps Lock键替换为Ctrl键。注意：这个不是交换，因为ctrl很容易误触，所以可以不把ctrl换成caps。

如果需要交换，将后面的值改为**“ctrl:swapcaps”**

保存配置文件后，执行

```
sudo dpkg-reconfigure keyboard-configuration
```

执行后出现如下界面，根据自己的需要选择，我是一路按确定走到最后

使用这种方法，重启电脑后修改依然生效。



## 第二种方法

这种方法很方便，但是在笔记本使用外接键盘时可能会出现**打字自动切换大小写**的问题。

终端执行

```
sudo vim /usr/share/X11/xkb/keycodes/evdev
```

搜索 <CAPS> 和 <LCTL>，交换等号后面的数字，**改成下面这样**

```
...
<CAPS> = 37;
...

<LCTL> = 66;
```

注销，**重新登录**以生效。



## 第三种方法

在.zshrc, .bashrc中加入一句话，但是在ubuntu20.04失效，同时每次需要启动终端才生效:

``` shell
/usr/bin/setxkbmap -option "ctrl:swapcaps"
```

