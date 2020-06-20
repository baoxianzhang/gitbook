# spacemacs 远程操作文件

http://m.blog.csdn.net/sheismylife/article/details/71211396

远程操作文件

这里实际用的是tramp插件，不过spacemacs已经内置了，十分方便

假设有服务器A，开通了ssh服务，为了方便，将本机的ssh公钥放在服务器A上，保证无密码登录

在本机的spacemacs中用C-x C-f如此访问服务器A的文件

/ssh:root@192.168.50.99:/etc/nginx

现在就像浏览自己本地文件目录一样，也可以编辑

响应缓慢的问题可以通过添加这行来解决

  (setq projectile-mode-line "Projectile")

远程跳转多个服务器

从本机->A->B, 然后操作B上的文件

/ssh:root@A#443|ssh:root@B:/etc

\#443表示端口不是默认的22,而是443作为ssh 服务端口

切换帐号

上面的跳转多个服务器的方式也可以用于在一台服务器上做帐号切换

切换到root

 C-x C-f /ssh:you@remotehost|sudo:remotehost:/path/to/file RET

切换到其他帐号

C-x C-f /ssh:you@remotehost|sudo:them@remotehost:/path/to/file RET

保存方便以后快捷操作

M-m f f 而不是C-x C-f，会保留当前正在登录的ssh路径，方便新建一个新的。

但是如果关闭了当前的登录，就没有了。所以建议还是弄一个文本文件保存路径比较好。

远程运行shell

在连接后的bufferi面运行M-x shell，就进入了远程shell，非常好用.

这样就打开了一扇门，可以编译，也可以做任何其他操作。

远程gdb

和shell一样，M-x gdb，然后在mini-buffer中输入下面的命令

gdb -i=mi --annotate=3 /ssh:qfs@192.168.72.19#65522:/data/qfs/bin/meta_server/metaserver

/ssh:后面和远程打开文件的写法格式一样