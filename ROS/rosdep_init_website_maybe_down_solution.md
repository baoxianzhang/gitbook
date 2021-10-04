# 解决rosdep init报错“Website may be down”

这个问题在终端翻墙也不成功。

参考：

https://zhuanlan.zhihu.com/p/107218921

https://www.codenong.com/cs105702188/



## 0. 研究背景

由于本机是Debian 10.3，所以采用**源码安装**方式安装ROS。

[melodic/Installation/Source - ROS Wikiwiki.ros.org](https://link.zhihu.com/?target=http%3A//wiki.ros.org/melodic/Installation/Source)

根据官方指引，在进行到“1.2 初始化rosdep“时，执行`rosdep init`时会提示**Website may be down**的错误。

报错部分代码在`/usr/lib/python2.7/dist-packages/rosdep2/main.py`中，原因是`download_default_sources_list()`无法访问**[http://raw.githubusercontent.com](https://link.zhihu.com/?target=http%3A//raw.githubusercontent.com)**网站。

`rosedep update`时也要联网，默认的网站还是`raw.githubusercontent.com`，所以也会报错。

## 1. 国内研究现状

国内某知名搜索引擎排行前列的几种解决方案（已排除广告）：

- [sudo rosdep init出错的解决方案](https://zhuanlan.zhihu.com/p/43345574)
- [Ubuntu16.04下安装ROS kinetic常见问题及解决方法](https://link.zhihu.com/?target=https%3A//www.cnblogs.com/liwe1004/p/11795932.html)
- [rosdep init 显示"Website may be down.](https://link.zhihu.com/?target=https%3A//blog.csdn.net/maolong2725/article/details/82530722)

解决思路是从网络层面入手，用**科学**（科学上网）或**玄学**（手机热点）的方式，如 果出现认证错误的问题，再通过**安装依赖包**或**修改rosdep源码**的方式解决。

## 2. 研究思路

`raw.githubusercontent.com`实际上就是**github的用户数据服务器**，rosdep程序下载的就是`github.com/ros/rosdistro`这个repo里的**yaml文件**。

虽然`raw.githubusercontent.com`服务器无法访问，但是yaml文件可以直接从`git clone`的repo中获得。

所以，只要将[ros/rosdistro](https://link.zhihu.com/?target=https%3A//github.com/ros/rosdistro.git)整个git下来，然后再将

- `20-default.list`(rosdistro/rosdep/sources.list/20-default.list 下载的目录下）
- `/usr/lib/python2.7/dist-packages/rosdep2/main.py`  （16.04版本没有）
- `/usr/lib/python2.7/dist-packages/rosdep2/rep3.py`  （20.04版本没有）
- `/usr/lib/python2.7/dist-packages/rosdistro/__init__.py`
- /usr/lib/python2.7/dist-packages/rosdep2/sources_list.py 

中的**默认url全部指向本地的git**，即可解决这个问题。

**注意**: 以上的路径可能存在变化，最新的20.04下noetic版本的路径（使用`cd /usr/lib && ag "https://raw.githubusercontent.com/ros/rosdistro/master"`查找）
- `20-default.list`(`rosdistro/rosdep/sources.list/20-default.list` 下载的目录下）
- `/usr/lib/python2.7/dist-packages/rosdep2/rep3.py`
- `/usr/lib/python2.7/dist-packages/rosdistro/__init__.py`
- `/usr/lib/python3/dist-packages/rosdep2/sources_list.py`

## 3. 解决步骤

1. `git clone https://github.com/ros/rosdistro.git`；
2. 在本地`rosdistro`中搜索`20-default.list`，将其url指向本地repo；
3. 搜索`rosdep2`和`rosdistro`中出现**http://raw.githubusercontent.com**的位置，将其指向本地repo。

使用下面的file语法：

file:///home/leo/code/rosdistro

4. 把本地的`20-default.list`替换到`/etc/ros/rosdep/sources.list.d`
5. 以上步骤相当于执行了`sudo rosdep init`, 现在只需要执行`rosdep update`

## 4. 20.04的自动化脚本
[rosdep_init_fail_replace_solution.sh](rosdep_init_fail_replace_solution.sh)
