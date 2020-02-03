# Linux系统 利用相对路径创建 软连接

https://www.cnblogs.com/simpleminds/p/7677164.html

linux创建软连接时，需要注意路径。

ln -s source  target_dir

需要注意，source的寻找路径是根据target_dir来计算的，而不是当前路径。

如，当前目录下有x/a/，x/b/两个文件夹，相应把x/a/链接到x/b/下：x/b/a/，那么应该使用：

ln -s ../a/  x/b/