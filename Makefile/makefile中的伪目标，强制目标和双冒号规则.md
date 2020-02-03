# makefile中的伪目标，强制目标和双冒号规则

http://blog.csdn.net/educast/article/details/9399919



----伪目标----

target ：

commands

如果makefile 所在目录没有target 同名文件：make target 则导致commands 总是被执行。

如果makefile 所在目录下存在target 同名文件：make target 则commands 不被执行，认为target 总是最新的。

 

.PHONY:target

target:

commands

不论makefile 所在目录下存不存在与target 同名文件，make target 导致commands 的执行，与上一种写法的区别是引用'.PHONY' 的意义所在。

 

-----强制目标-----

target:

因为没有命令，所以make target ，与makefile 所在目录下是否存在与target 同名的文件没有直接关系。

 

-----双冒号规则-----

target::

commands

无论makefile 所在目录下存不存在与target 同名文件，make target 导致commands 的执行，与使用'.PHONY' 定义的伪目标效果相同。