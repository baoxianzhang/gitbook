# 普通用户vim编辑root权限文件

http://blog.163.com/ting2jun@126/blog/static/60511481201331095134149/

当一个普通用户用vim编辑一个root权限文件在保存的时候，提示没有权限保存。这是我们就要用到sudo来提升到root权限保存该文件。具体如下：

:w !sudo tee %

:w 保存该文件

!sudo 使用shell命令sudo提升到root权限。

tee - The output of write (vim :w) command is redirected using tee. The % is nothing but current file name i.e. /etc/httpd.conf. In other words tee command is run as root and it takes standard input and write it to a file represented by %. However, this will prompt to reload file again (hit L to load changes in vim itself).