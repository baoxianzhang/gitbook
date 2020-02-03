# expected unqualified-id before numeric constant问题原因



http://hongbin0720.blog.51cto.com/3305400/640753

 今天编译库的时候出现这个问题unqualified-id before numeric constant，是因为变量重复定义了，主要是变量与宏定义同名了，及以下模式：

一个头文件定义一个接口体，

struct｛

int Size；

｝

 

然后在另外一个文件定义宏如下：

define Size

 

这时就会出现以上的错误，真的需要采用常用的习惯的命名原则，不然真不好查。