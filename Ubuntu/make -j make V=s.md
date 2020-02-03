# make -j make V=s

http://bbs.csdn.net/topics/380072770

make -j4有的是make -j8

make(1)表示在unix手册(man)的第一章，可以用 man 1 make 来查看。

两个处理器的话，一般 -j2 能达到最高效率。

不过也有些进程会花时间在IO上，并不能利用完单个cpu的时间。这样 -j4 可以更快。

   -j [jobs], --jobs[=jobs]

​      Specifies  the  number  of jobs (commands) to run simultaneously.  If there is more than one -j option, the last one is effective.  If the -j option is given without an argument, make will not limit the number of

​      jobs that can run simultaneously.

关于make V=s和make V=99

这两个都能显示出详细的编译过程，请问下它们有差别吗？又有什么不同呢？

make v=s和v=99貌似都不是make的标准参数，应该是某些代码包特有的吧，比如以前编译openwrt就有。

各人感觉没什么区别，你可以在makefile中搜索下，比如对于openwrt，V=99就可以在verbose.mk这个makefile中看到V=99表示输出所有调试信息

是openwrt里面的哈，它们的功能是一样的。

ifeq ($(OPENWRT_VERBOSE),99)

 OPENWRT_VERBOSE:=s

endif

再由OPENWRT_VERBOSE的值定义MESSAGE，当$(warning "$(findstring s,$(OPENWRT_VERBOSE))")findstring的返回不为空时，MESSAGE定义如下：

define MESSAGE

  printf "%s\n" "$(1)"

endef

call MESSAGE的地方就原样输出了。