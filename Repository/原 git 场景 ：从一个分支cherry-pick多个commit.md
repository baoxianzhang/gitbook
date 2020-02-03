# 原 git 场景 ：从一个分支cherry-pick多个commit

https://blog.csdn.net/w958796636/article/details/78492017

场景：

在branch1开发，进行多个提交，这是切换到branch2，想把之前branch1分支提交的commit都【复制】过来，怎么办？

首先切换到branch1分支，然后查看提交历史记录，也可以用sourceTree查看，也可以用命令git log

例如我的git log 如下：

commit 023sb6f299849a1fec3bbe72baaf315482522cb6

Author: sunguowei <me@xx.com>

Date:  Thu Nov 9 11:01:13 2017 +0800

   修复bug 3

  Change-Id: I30850819d3dcfb8814b5d67124133215a4469374

commit 5d2c18fsf4b85b4564991963d7c3c3917e951364

Author: sunguowei <me@xx.com>

Date:  Wed Nov 8 16:33:58 2017 +0800

  修复bug 2

  Change-Id: I0c94d305a35ef8372afc127b2eab13f4ebb70386

commit ba51861402b0a18663f2c9ee28ed054b0879b225

Author: shenjiaqi <other@xx.com>

Date:  Sun Nov 5 18:50:28 2017 +0800

修复bug 1

  Change-Id: I32a8e29523f709eed59f6044c7a06311e953727e

我想把bug 2和bu3复制到branch2分支里，只需要这样

切换到branch2分支，然后执行

git cherry-pick ba51861..023sb6f299849a1f

注意中间的两个点，表示把两个commit区间的所有commit多复制过去

cherry-pick用法

单个commit只需要git cherry-pick commitid

多个commit 只需要git cherry-pick commitid1..commitid100

**注意，不包含第一个commitid ， 即  git cherry-pick** **(****commitid1..commitid100****]**