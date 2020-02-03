# C Traps and Pit Falls

code 1:

char *r, *malloc();

r = malloc(strlen(s) + strlen(t) + 1);

if(!r) {

  complain();

  exit(1);

}

strcpy(r, s);

strcat(r, t);

free(r);

code 2:

void memcpy(char * dest, const char *source, int k)

{

  while(--k >= 0)

​    *dest++ = *source++;

}

void bufwrit(char * p, int n)

{

  while(n > 0)

  {

​    int k, rem;

​    if(bufptr == &buffer[N])

​      flushbuffer();

​    rem = N - (bufptr - buffer);

​    k = n > rem? rem:n;

​    memcpy(bufptr, p, k);

​    bufptr += k;

​    p += k;

​    n -= k;

  }

code 3:

(*(void (*)() ) 0)();

C语言中存在两类整数算术运算，有符号运算和无符号运算。在无符号算术运算中没有所谓的“溢出”一说：所有的无符号运算都是以2的n次方为模，这里n是结果中的位数。如果算术运算符的一个操作数是有符号整数， 另一个是无符号整数，那么有符号整数会被转换为无符号整数， “溢出”也不可能发生。但是， 当两个操作数都是有符号整数时，“溢出”就有可能发生，而且“溢出”的结果是未定义的。当一个运算的结果发生“溢出”时，做出任何假设都是不安全的。

一种方法是把a和b都强制转化为无符号整数：

if((unsigned)a + (unsigned)b > INT_MAX)

  complain();

不需要用到无符号算术运算的另一种可行方法是：

if(a > INT_MAX - b）

  complain();

显式常量： manifest constant

一个函数如果不带参数，在调用时只需要函数名后加上一对括号即可加以调用了。而一个宏如果不带参数，则只需要使用宏名即可， 括号无关紧要。

code 4:

\#define assert(e) \

  ((void)((e) || _assert_error(__FILE__,__LINE__)))

Mark Horton  《How to Write Portable Software in C (Prentice-Hall)》

C语言中为编程者提供了3种不同长度的整数： short， int， long，并对长度做了一些规定：

\1. 3种类型的整数其长度是非递减的。也就是说，short型整数容纳的值肯定能够被int型整数容纳， int型整数容纳的值也肯定能够被long型整数容纳。

\2. 一个普通（int）整数足够大以容纳任何数组下标。

\3. 字符长度由硬件特性决定。

ANSI标准要求long型整数的长度至少应该是32位，而short型和int型整数的长度至少应该是16位。

如果被移位的对象是无符号数，那么空出来的将被0填充。如果被移位的对象是有符号数，那么C语言实现既可以用0填充空出的位，也可以用符号位的副本填充空出的位。

如果被移位的对象长度是n位，那么移位计数必须大于或者等于0,而严格小于n。

需要注意的是，即使C实现将符号位复制到空出的位中，有符号整数的向右移位预算也并不等同于除以2的某次幂。要证明这一点，让我们考虑（-1）>>1， 这个操作的结果一般不可能为0, 但是

（-1）/2在大多数C实现上求值结果都是0。

null指针并不是指向任何对象。因此，除非是用于赋值或比较运算，处于其他任何目的的使用null指针都是非法的。

C语言定义：除法运算中，

假定我们让a除以b，商为q，余数为r：

q = a / b;

r = a % b;

\1. q*b + r == a, 因为这是定义余数的关系。

2.当a>=0且b>0时，保证|r|<|b|以及r >=0.

C语言中a+++++b是什么含义?

[C语言编译器](https://www.baidu.com/s?wd=C语言编译器&tn=44039180_cpr&fenlei=mv6quAkxTZn0IZRqIHckPjm4nH00T1Y4PvF-rjnYrH9WnhD4mhRY0ZwV5Hcvrjm3rH6sPfKWUMw85HfYnjn4nH6sgvPsT6KdThsqpZwYTjCEQLGCpyw9Uz4Bmy-bIi4WUvYETgN-TLwGUv3En1R3rj03PHcz)对于代码的分解采用的是贪心算法

按照贪心算法分解a+++++b为：

((a++)++)+b

因为a++的结果为左值，而左值不能再进行运算，故a+++++b编译不能通过

除非写成a+++ ++b，在++b前面有个空格，这时候根据贪心算法分解为：

(a++)+(++b)

编译通过

假定一个程序在一个源文件中包含了声明：

long foo;

而在另一个源程序中包含了：

extern short foo; 

又进一步假设，如果给long类型的foo赋一个较小的值，例如37,那么short类型的foo就同时获得了一个值37.我们能够对运行该程序的硬件做出什么样的推断？如果short类型的foo得到的值不是37而是0，我们又能够做出什么样的的推断？

《C陷阱与缺陷》给出了如下分析：如果把37赋值给了long型的foo，而short型的foo也得到值37，说明short型的foo与long型的foo包含了值37的有效位的部分，两者在内存中占用的是同一块区域。可能性有二：（1）long型和short型被实现为同一类型，但很少有C语言实现会这样；（2）更有可能的是，long型的foo低位部分与short型的foo共享了相同的内存空间，一般情况下，这个部分所处的内存地址较低。因此我们的一个可能推论就是，运行该程序的硬件是一个低位优先（little-endian）的机器。同样的道理，若short型的foo的值是0是，我们所用的硬件可能是一个高位优先（big-endian）的机器。

存储顺序 - 大小端

对于跨越多字节的程序对象，我们在存储时必须建立两个规则：这个对象的地址是什么，以及在[存储器](http://cpro.baidu.com/cpro/ui/uijs.php?adclass=0&app_id=0&c=news&cf=1001&ch=0&di=128&fv=20&is_app=0&jk=fd06105aae433e07&k=%B4%E6%B4%A2%C6%F7&k0=%B4%E6%B4%A2%C6%F7&kdi0=0&luki=2&mcpm=0&n=10&p=baidu&q=smileking_cpr&rb=0&rs=1&seller_id=1&sid=73e43ae5a1006fd&ssp2=1&stid=9&t=tpclicked3_hc&td=1682280&tu=u1682280&u=http%3A%2F%2Fwww%2Eth7%2Ecn%2FProgram%2Fc%2F201505%2F457293%2Eshtml&urlid=0)中如何排列这些字节——《深入理解计算机系统》。

a）第一个规则：几乎所有的机器上，多字节对象都被存储为连续的字节序列，对象的地址为所使用字节中最小的地址。

例如，假设一个类型为int型的变量x，地址为0x100。也就是说，表达式&x的值为0x100。那么，x的四个字节将被存储在存储器的0x100，0x101，0x102和0x103的位置。

b）第二个规则：排列表示一个对象的字节存在着两种通用的规制。考虑一个w位（即用位表示时，有效位数为w）的整数，位表示为[Xw-1,Xw-2,...,X1,X0]。假设w为8的倍数，则这些位就能被分组为字节，其中最高有效字节包含位[Xw-1,Xw-8]，最低有效字节包含位[X7,X6,...，X0]，其他字节包含中间的位。

某些机器选择在[存储器](http://cpro.baidu.com/cpro/ui/uijs.php?adclass=0&app_id=0&c=news&cf=1001&ch=0&di=128&fv=20&is_app=0&jk=fd06105aae433e07&k=%B4%E6%B4%A2%C6%F7&k0=%B4%E6%B4%A2%C6%F7&kdi0=0&luki=2&mcpm=0&n=10&p=baidu&q=smileking_cpr&rb=0&rs=1&seller_id=1&sid=73e43ae5a1006fd&ssp2=1&stid=9&t=tpclicked3_hc&td=1682280&tu=u1682280&u=http%3A%2F%2Fwww%2Eth7%2Ecn%2FProgram%2Fc%2F201505%2F457293%2Eshtml&urlid=0)中按照从最低有效字节到最高有效字节的顺序存储对象，而另一些机器选择从最高有效字节到最低有效字节的顺序存储。前一种规则——最低有效字节排在前面的方式，称为小端法（little endian），即低位优先；后一种规则——最高有效字节在前面的方式，称为大端法（big endian），即高位优先；（endian）

注意，不管是大端法还是小端法，一个对象的字节存储时，内存都是从低位地址向高位地址按顺序存放的。即：

大端法——最低地址存放高位字节，可称为高位优先，内存从最低地址开始，按顺序存放；

小端法——最低地址存放低位字节，可称为低位优先，内存从最低位地址开始，顺序存储。

这里说的最低位，指的是程序对象的地址，即第一个规则举例中，变量x的地址0x100。

ENDIAN的意思是“数据在内存的字节排列顺序”。

BIG ENDIAN: 最低地址存放高位字节，可称高位优先。内存从最低地址开始，按顺序存放。BIG ENDIAN存放的方式正是我们的书写方式，高数位数字先写（比如，总是按照千、百、十、个位来书写数字）。而起所有的处理器都是按照这个顺序存放数据的。

LITTLE ENDIAN: 最低地址存放地位字节，可称为低位优先。内存从最低地址开始，顺序存放。LITTLE ENDIAN处理器是通过硬件将内存主动的LITTLE ENDIAN排列顺序转换到寄存器的BIG ENDIAN排列顺序的，没有数据加载/存储的开销，不用担心。

CM3这个内核是大小端可配置的：

The processor contains a configuration pin, BIGEND, that enables you to select either

the little-endian or BE-8 big-endian format. This configuration pin is sampled on reset.

You cannot change endianness when out of reset.

STM32是固定配置为小端的：

The bytes are coded in memory in Little Endian format. The lowest numbered byte in a word is considered the word’s least significant byte and the highest numbered byte the most significant.

既可大端，也可小端，默认小端，默认引脚BIGEND来配置大端模式或是小端模式

当一个程序异常终止时，程序输出的最后几行常常会丢失，原因是什么？我们能够采取怎样的措施来解决这个问题？

一个异常终止的程序可能没有机会来清空其输出的缓冲区。

对于试图调试这类程序的编程者来说，这种丢失输出的情况经常会误导他们，因为它会造成这样的一种印象，程序发生的时刻比实际运行失败的真正时刻要早得多。

解决方案就是在调试时强制不允许输出进行缓冲。要做到这一点，不同的系统有不同的做法，这些做法大致如下：

setbuf(stdout, (char *)0);

这个语句必须在任何输出被写入到stdout（包括任何对printf函数的调用）之前执行。该语句最恰当的位置就是作为main函数的第一个语句。

[typedef函数指针用法](http://blog.csdn.net/qll125596718/article/details/6891881)

形式1：返回类型(*函数名)(参数表) 

typedef void (*T) (void *);