# C中的#和##

一个例子：

\#define PRINT（FORMAT, VALUE） printf( "The value is " FORMAT "\n", VALUE)

...

PRINT( "%d", x + 3 );

这种技巧只有当字符串常量作为宏参数给出时才能使用。

使用预处理器把一个宏参数转换为一个字符串。#argument 这种结构被预处理器翻译为"argument"。这种翻译可以让你像下面这样编写代码：

\#define PRINT(FORMAT, VALUE)  printf( "The value of " #VLAUE " is " FORMAT "\n", VALUE)

...

PRINT("%d", x+3);

它将产生下面的输出：

The value of x + 3 is 25

\##结构把位于它两边的符号连接成一个符号。它允许宏定义从分离的文本片段创建标识符。下面这个例子使用这种连接把一个值添加道几个变量之一：

\#define ADD_TO_SUM( sum_number, value ) sum ## sum_number += value

...

ADD_TO_SUM( 5, 25);

最后一条语句把值25加道变量sum5

宏的一个好处就是市，宏参数可以是一种类型，类型无法作为函数参数进行传递。

\#define MALLOC(n, type) ( (type *)malloc( (n) * sizeof(type) ))