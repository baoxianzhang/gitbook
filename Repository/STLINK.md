# STLINK

https://pixhawk.org/dev/nuttx/building_and_flashing_console

http://gpio.kaltpost.de/?page_id=148

https://github.com/baoxianzhang/stlink

git clone git://github.com/texane/stlink.git

cd stlink

./autogen.sh

./configure

make

cd flash

make

cd ..

sudo install -s -m 775 gdbserver/st-util /usr/bin/st-util

sudo install -s -m 775 flash/st-flash /usr/bin/st-flash

if missing package libusb-1.0

sudo apt-get install libsgutils2-dev libusb-1.0.0-dev

sudo install -m 644 49-stlinkv1.rules /etc/udev/rules.d/49-stlinkv1.rules

sudo install -m 644 49-stlinkv2.rules /etc/udev/rules.d/49-stlinkv2.rules

sudo install -m 644 49-stlinkv2-1.rules /etc/udev/rules.d/49-stlinkv2-1.rules

**sudo** **install** -m 644 stlink_v1.modprobe.conf /etc/modprobe.d/stlink_v1.modprobe.conf

sudo udevadm control --reload-rules

Flash Software

Start ST-util:

**《GDB教程》**

**《常用gdb命令》- GDB多线程**

pkill st-util

st-util -p 1234 & ( if fail, unknown chip id! 0 , please try more times!!!!!!!!!!!!!!)

Start GDB (binary for Pixhawk / FMUv2):

arm-none-eabi-gdb ~/src/Firmware/Build/px4fmu-v2_default.build/firmware.elf

Within gdb:

(gdb) tar ext :1234

(gdb) load

(gdb) run

Loading will take a few moments. Watch the gdb output to see when it is completed. When loading is complete you should see something similar to this for gdb output:

Transfer rate: 443 bytes/sec, 11030 bytes/write.

When loading is completed you may stop gdb with the command and reset the board:

(gdb) kill (answer confirmation with y)

(gdb) quit

C-c C-c中断程序

bt列出堆栈位置

GDB常见命令：

comand            abbr         例子                        说明

\-----------------------------------------------------------------------------------------------------

list                 l           list                        列出源码

break               b           break  line_num             设置行号断点

​                              break funtion                设置函数入口断点

info                           info break                   查看断点信息

run                           run                         运行

next                n           next                        运行道下一行

continue            c           continue                    继续运行程序

print                p          print  i                      打印i的值

backtrace            bt          backtrace                    查看函数堆栈

finish                           finish                      退出函数

return                                                     强制函数返回

quit                q           quit                         退出gdb

clear                          clear                        清除所有停止点

​                              clear function

​                              clear line_num

delete 

enable

disable

condition

ignore

command

step <count>

next <count>

examine    缩写为x，  查看内存地址中的值

display 自动显示

break ... if <contidition>

**查看栈信息**

当程序被停住了,你需要做的第一件事就是查看程序是在哪里停住了。当你的程序调用了一个函数,函数的地址,函数的参数,函数内的局部变量都会被压入“栈(stack)”中。你

可以使用 GDB 命令来查看当前的栈中的信息。

下面是一些查看函数调用栈信息的 GDB 命令:

backtrace

bt

打印当前的函数调用栈的所有信息。如:

(gdb) bt

\#0 func (n=250) at tst.c:6

\#1 0x08048524 in main (argc=1, argv=0xbffff674) at tst.c:30

\#2 0x400409ed in __libc_start_main () from /lib/libc.so.6

从上可以看出函数的调用栈信息:__libc_start_main --> main() --> func()

backtrace<n>

bt<n>

n 是一个正整数,表示只打印栈顶上 n 层的栈信息。

backtrace<-n>

bt<-n>

-n 是一个负整数,表示只打印栈底下 n 层的栈信息。

如果你要查看某一层的信息,你需要切换当前的栈,一般来说,程序停止时,最顶层的栈

就是当前的栈,如果你要查看栈下面层的详细信息,首先要做的是切换当前栈。

frame<n>

f<n>

n 是一个从 0 开始的整数,是栈中的层编号。比如:frame 0,表示栈顶,frame ,表

示栈的第二层。

up<n>

表示向栈的上面移动 n 层,可以不打 n,表示向上移动一层。

down<n>

表示向栈的下面移动 n 层,可以不打 n,表示向下移动一层。

上面的命令,都会打印出移动到的栈层的信息。如果你不想让其打印出信息。你可以使用

这三个命令。

select-frame <n> 对应于 frame 命令。

up-silently <n> 对应于 up 命令。

down-silently <n> 对应于 down 命令。

查看当前栈层的信息,你可以用以下 GDB 命令:

frame 或 f

会打印出这些信息:栈的层编号,当前的函数名,函数参数值,函数所在的文件及行号 ,

函数执行到的语句。info frame

info f

这个命令会打印出更为详细的当前栈层的信息,只不过,大多数都是运行时的内存地址 。

比如函数的地址,调用函数的地址,被调用函数的地址,目前的函数是由什么样的程序语

言写成的、函数参数地址及值,局部变量的地址等等。如:

(gdb) info f

Stack level 0, frame at 0xbffff5d4:

eip = 0x804845d in func (tst.c:6); saved eip 0x8048524

called by frame at 0xbffff60c

source language c.

Arglist at 0xbffff5d4, args: n=250

Locals at 0xbffff5d4, Previous frame's sp is 0x0

Saved registers:

ebp at 0xbffff5d4, eip at 0xbffff5d8

info args

打印出当前函数的参数名及其值。

info locals

打印出当前函数中所有局部变量及其值。

info catch

打印出当前函数中的异常处理信息

**多线程如果 dump,**

**多为段错误,一般都涉及内存非法读写。可以这样处理,使用下面的命令打开系统开关,让其可以在死掉**

**的时候生成 core 文件。**

**ulimit -c unlimited**

**这样的话死掉的时候就可以在当前目录看到 core.pid(pid 为进程号)的文件。接着使用 gdb:**

**gdb ./bin ./core.pid**

**进去后,使用 bt 查看死掉时栈的情况,在使用 frame 命令。**

**还有就是里面某个线程停住,也没死,这种情况一般就是死锁或者涉及消息接受的超时问题(听人说**

**的,没有遇到过)。遇到这种情况,可以使用:**

**gcore pid (调试进程的 pid 号)**

**手动生成 core 文件,在使用 pstack(linux 下好像不好使)查看堆栈的情况。如果都看不出来,就仔细查**

**看代码,看看是不是在 if,return,break,continue 这种语句操作是忘记解锁,还有嵌套锁的问题,都需要**

**分析清楚了。**

烧录程序：

stlinkv1 command line: ./st-flash [--debug] [--reset] {read|write} /dev/sgX path addr <size>

stlinkv1 command line: ./st-flash [--debug] /dev/sgX erase

stlinkv2 command line: ./st-flash [--debug] [--reset] {read|write} path addr <size>

stlinkv2 command line: ./st-flash [--debug] erase

​            use hex format for addr and <size>

**./st-flash --reset write ~/code/testintorobotneutron/IntoRobot_Neutron/common-lib/build/firmware.bin 0x8000000**

st-flash --reset erase

arm-none-eabi-gdb nuttx

target remote 192.168.0.109:3333

load

monitor reset halt

b os_start

c

Ctrl -c

l

n

quit