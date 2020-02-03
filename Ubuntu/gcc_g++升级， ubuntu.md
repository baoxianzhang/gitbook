# gcc_g++升级， ubuntu 

http://blog.csdn.net/gatieme/article/details/52871438

首先添加ppa到库：

sudo add-apt-repository ppa:ubuntu-toolchain-r/test sudo apt-get update

默认在系统中安装的是gcc-4.8, 但现在都什么年代了万一有重要或者好玩的更新呢, 接着就可以选择安装gcc-4.9, gcc-5之类的啦!(注意目前gcc-5实际上是5.3.0，没有5.1或5.2可供选择)

sudo apt-get install gcc-4.8 g++-4.8 sudo apt-get install gcc-4.9 g++-4.9 sudo apt-get install gcc-5 g++-5 sudo apt-get install gcc-6 g++-6

具体希望安装哪个版本, 大家可以自己选择

http://www.douban.com/note/371940291/

Ubuntu12.04 LTS默认GCC G++为4.6.*版本（本机为4.6.3版），其不支持最新的c++11标准。

以下介绍升级GCC/G++：

\#加入此源为必须，否则容易查找不到要升级的版本

sudo add-apt-repository ppa:ubuntu-toolchain-r/test

sudo apt-get install gcc-4.8

sudo apt-get install g++-4.8

**sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 20**

**sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 20**

**sudo update-alternatives --config gcc**

**sudo update-alternatives --config g++**

gcc --version

g++ --version

显示为升级之后的版本，接下来就可以放心使用-std=c++11命令了。