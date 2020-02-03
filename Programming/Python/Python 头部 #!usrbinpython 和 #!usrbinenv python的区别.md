# Python 头部 #!/usr/bin/python 和 #!/usr/bin/env python的区别

https://www.cnblogs.com/scofi/p/4867851.html

[Python 头部 #!/usr/bin/python 和 #!/usr/bin/env 的区别](https://www.cnblogs.com/scofi/p/4867851.html)

大部分python文件的头部都会写上 #!/usr/bin/python 或者 #!/usr/bin/env ，这个语句主要和运行模式有关，

如果我们用普通运行模式例如(linux) ： python *.py 那么这个语句在此运行模式下无效。如果想让python程序像普通程序一样运行，例如：./*.py (文件要有可执行权限chmod a+x *.py)，这个语句就起作用了，他用来为脚本语言指定解释器，通常认为用 #!/usr/bin/env python 要比 #!/usr/bin/python 更好，因为 python 解释器有时并不安装在默认路径，例如在虚拟环境中。

解释：

\#!/usr/bin/env python

这种写法在你机器上安装了多个版本的python的时候有意义，这样声明的时候，会去取你机器的 PATH 中指定的第一个 python 来执行你的脚本。如果这时候你又配置了虚拟环境的话，那么这样写可以保证脚本会使用你虚拟环境中的 python 来执行。

\#!/usr/bin/python

表示写死了就是要 /usr/bin/python 这个目录下 python 来执行你的脚本。这样写程序的可移植性就差了，如果此路径下python命令不存在就会报错。

所以一般情况还是用第一种写法。