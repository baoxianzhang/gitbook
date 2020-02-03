# git add -u

命令解释:

-u

--update

Update the index just where it already has an entry matching <pathspec>. This removes as well as modifies index entries to match the working tree, but adds no new files.

If no <pathspec> is given when -u option is used, all tracked files in the entire working tree are updated (old versions of Git used to limit the update to the current directory and its subdirectories).

简译: **此命令将更新已经存在于存储库中的文件索引**。删除及修改与与索引条目相匹配的工作树, 但并不会增加新的文件。

不带<pathspec>参数的 git add -u 命令将会更新所有已经包含在存储库中的文件(旧版本Git只会更新到[当前目录](https://www.baidu.com/s?wd=当前目录&tn=44039180_cpr&fenlei=mv6quAkxTZn0IZRqIHckPjm4nH00T1d9mWRvrAnLuH--uH-brHDY0ZwV5Hcvrjm3rH6sPfKWUMw85HfYnjn4nH6sgvPsT6KdThsqpZwYTjCEQLGCpyw9Uz4Bmy-bIi4WUvYETgN-TLwGUv3EnWf1n1Rkn1R3PHcznjcdPWfY)及其子目录)

git push -u

一般只有同时存在多个远程仓库时才会用到--set-upstream。每个git branch可以有个对应的upstream。假设你有两个upstream，分别叫server1和server2，本地master branch的upstream是server1上的master，那么当你不带参数直接输入git pull或者git push时，默认是对server1进行pull/push。如果你成功运行"git push -u server2 master"，那么除了本地branch会被push到server2之外，还会把server2设置成upstream。

作者：付晨

链接：http://www.zhihu.com/question/20019419/answer/13687984

来源：知乎

著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。