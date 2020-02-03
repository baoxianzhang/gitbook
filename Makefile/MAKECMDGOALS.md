# MAKECMDGOALS

http://blog.csdn.net/eddy_liu/article/details/8217835

有一个 make 的环境变量叫“MAKECMDGOALS”，这个变量中会存放你所指定的终极目标的列表，如果在命令行上，你没有指定目标，那么，这个变量是空值。这个变量可以让你使

用在一些比较特殊的情形下。比如下面的例子：

1. sources = foo.c bar.c  
2. ifneq ( $(MAKECMDGOALS),clean)  
3. include $(sources:.c=.d)  
4. endif  

基于上面的这个例子，只要我们输入的命令不是“make clean”，那么 makefile 会自动包含“foo.d”和“bar.d”这两个 makefile。  