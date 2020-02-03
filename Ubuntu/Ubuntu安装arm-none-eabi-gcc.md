# Ubuntu安装arm-none-eabi-gcc

Intall the arm-none-eabi-gcc compile tool

\1. Download the tar file from:

https://launchpad.net/gcc-arm-embedded/+download

In the follwing, the tar name is gcc-arm-none-eabi-4_9-2015q2-20150609-linux.tar.bz2

\2. extract the tar file

tar -xjvf gcc-arm-none-eabi-4_9-2015q2-20150609-linux.tar.bz2

\3. cp the extracted file to the /usr/src or some other directory

sudo cp -r gcc-arm-none-eabi-4_9-2015q2 /usr/src

\4. add export PATH=$PATH:/usr/src/gcc-arm-none-eabi-4_9-2015q2/bin at the end of the /etc/profile

\5. source /etc/profile

**6. If 64 bit system, it can't find the arm-none-eabi-gcc, please install the ia32-libs**

sudo apt-get install ia32-libs

http://stackoverflow.com/questions/23182765/how-to-install-ia32-libs-in-ubuntu-14-04-lts-trusty-tahr

Ubuntu has removed the ia32-libs since Ubuntu 13.10 (Saucy Salamander).

in 14.04/13.10 in the root:

cd /etc/apt/sources.list.d

echo "deb http://old-releases.ubuntu.com/ubuntu/ raring main restricted universe multiverse" >ia32-libs-raring.list

apt-get update

apt-get install ia32-libs

PS: In this way, you can install ia32-libs. However, we add the source of 13.04 instead, so, there may be some unknown problem. After installing ia32-libs, I recommend you to remove the ia32-libs-raring.list in /etc/apt/sources.list.d, and do sudo apt-get update.

\7. Another way, add the 5th step at the end of the ~/.bashrc, to setup the environment every terminal start.

**/bin/sh: 1: arm-none-eabi-gcc: not found**

apt-get install ia32-libs

However the following packages replace it:

 lib32z1 lib32ncurses5 lib32bz2-1.0

make USE_SWD_JTAG=y PLATFORM=photon clean all program-dfu