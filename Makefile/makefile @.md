# makefile @

archclean:

​     @$(MAKEBOOT)  clean

或者

checkbin:

​     @  /bin/ture

​     @  true

这里面

@$和@代表着什么意思啊？

 

$(MAKEBOOT)   是变量  MAKEBOOT  的值，

@表示在make时不输出make的信息（类似Windows下的echo  off)。