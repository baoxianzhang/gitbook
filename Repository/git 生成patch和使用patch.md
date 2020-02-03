# git 生成patch和使用patch

http://blog.csdn.net/maybe_windleave/article/details/8703778

​    在android大环境下工作，迟早都会接触到git工具，这里说一下本地获取修改补丁的几种方式。

​    工作中用到的补丁大致可以分为两种，一种是patch文件，即补丁文件拿过来利用某些命令将这个补丁打入当前代码中，另外一种是修改前和修改后的文件对比包，这个对比包可以让我们快速查看到修改点的同时看到修改的上下文。先说说获取修改前和修改后文件的两种常用方法。第一种：调试完成代码之后，在当前仓库下执行如下语句：

​    git stash；

就能恢复到修改前的状态，得到修改文件之后，再执行：

​    git stash pop；

这又恢复了修改之后的状态了。如果你有多个仓库需要管理，可以使用repo forall命令帮助执行。

​    再说说另外一种方法。有时候修改完代码之后，不想马上就提交，可以另外其一个分支，在这个分支上提交，结束之后再切回原来的分支。一般常用命令如下：

​    repo start name . （注意name之后有一个"."，表示当前工程。或者使用git checkout -b name 远程分支名称）

​    git commit -a 

​    git checkout name （或者在新建一个分支）

这两种方法一般本地团队使用比较好。如果涉及到跨公司跨地域的交流，建议还是用下面的patch文件方式。

​    个人理解android开发接触到的patch，一般可以分为两种，一种是UNIX下的patch，可以使用git diff或者其他UNIX的diff命令生成（本人只用过git diff命令，后面的看书有提到过但是自己木有用过），一种是git 工具生成的patch，也可以说是git专用的patch，使用git format-patch命令生成。先来看看git diff生成patch的过程。一般常用命令如下：

​    git diff > patch

​    git diff --cached > patch

​    git diff branchname --cached > patch

这个时候当前目录下就会有一个patch文件，这是一个非git环境也可以使用的patch。对于这种patch，在git上使用要用git apply命令，如下：

​    git apply patch

由于这是一个类似UNIX下更新文件的操作，所以执行完上述操作之后，实际上是等于手动修改了文件，还要做一些git commit之类的操作。另外请注意，git apply 是一个事务性操作的命令，也就是说，要么所有补丁都打上去，要么全部放弃。ProGit上说明在实际打补丁之前，可以先用git apply --check 查看补丁是否能够干净顺利地应用到当前分支中：git apply --check patch，如果执行完该命令之后没有任何输出，表示我们可以顺利采纳该补丁，接下来就是git上的提交了。

​    在接着说说git format-patch生成的补丁，这是git专用的，也是日常工作中最常接触到的补丁类型。常用命令如下：

​    1)两个节点之间的提交： git format-patch 节点A  节点B

​    2)单个节点： git format-patch -1 节点A （-n就表示要生成几个节点的提交）

​    3)最近一次提交节点的patch ：git format-patch HEAD^ 依次类推……

使用git format-patch命令生成的patch文件，包含了提交的附加信息：比如作者，时间等。再次基础上使用git am命令即可将此补丁应用到当前分支。注意应用完之后，你会发现当前分支多了一次提交记录，并且有完整的信息，而不是简单的修改文件。在对比一下，git diff 和git format-patch生成的patch一个重要不同之处，实际使用中会发现git diff一次只会生成一个patch文件，不管差别了多少个提交，都是一个；而git format-patch是根据提交的节点来的，一个节点一个patch。

​    补充小技巧： 如果有额外信息需要补充，但又不想放在提交消息中说明以免搞乱了提交说明。可以编辑这些补丁文件，在第一个“---” 行之前添加说明即可。这样的信息能阅读，但在执行完git am命令之后该节点的提交信息不回包含上述信息。 