# cpp template函数模板声明与定义相分离

https://www.cnblogs.com/tonychen-tobeTopCoder/p/5199655.html

 最近在仿写stl，发现stl源码中将模板的声明与定义写在一起实在很不优雅。自己尝试用“传统”方法，及在.h文件里声明,在.cpp文件里定义，然后在main函数里包含.h头文件，这样会报链接错误。这是因为函数模板要被实例化后才能成为真正的函数，在使用函数模板的源文件中包含函数模板的头文件，如果该头文件中只有声明，没有定义，那编译器无法实例化该模板，最终导致链接错误。