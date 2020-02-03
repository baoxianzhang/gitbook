# binary_to_ascii

程序的目的是把一个整数从二进制形式转换为可打印的字符形式。例如， 4267 /10 = 427 ， 余数7， 然后加上 '0'。，这里有个问题就是它产生的次序是相反的。这个可以通过递归来修正这个问题。

代码如下：

\#include <stdio.h>

void binary_to_ascii( unsigned int value )

{

​    unsigned int quotient;

​    quotient = value / 10;

​    if( quotient != 0 )

​        binary_to_ascii( quotient );

​    putchar( value % 10 + '0' );

}