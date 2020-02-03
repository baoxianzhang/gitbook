# **git 新增空文件夹**

在git增加一个空文件，git add 会不起作用

解决方法：

在空文件中加入.gitignore

.gitignore文件里面的内容为：

\# Ignore everything in this directory

*

\#Except this file

!.gitignore

然后，把git add xxx/.gitignore

commit push

既可以把空文件夹加入到git仓库