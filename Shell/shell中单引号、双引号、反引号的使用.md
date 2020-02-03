# shell中单引号、双引号、反引号的使用



http://www.2cto.com/os/201305/209954.html

shell中单引号、双引号、反引号的使用

 

在编写shell脚本时，会经常地使用到单引号、双引号、反引号这些特殊的符号。它们在shell中有着不同的作用，但容易被误用和引起混乱。简单总结一下三者的使用和区别。

 

单引号

它关闭shell中所有的特殊符号使用和解释，即单引号间的内容全部以普通字符的含义进行文本使用和解释，不管是特殊字符 $ ，还是转义字符之类的。例子：

 

1

~$ a=12;test='this is a $a \$ `date`';echo $test

2

this is a $a \$ `date`

双引号

它关闭shell中大部分的特殊符号，但是某些保留，比如 $ ，转义字符 \（不包括\n,\t之类），反引号字符，单引号字符在双引号中时作为普通字符，不具有上面的功能作用。例子：

 

01

~$ a=12;test="this is a $a \b `date`";echo $test

02

this is a 12 \b Thu Mar 21 15:24:45 HKT 2013

03

 

04

~$ a=12;test="'this is a $a \b `date`'";echo $test

05

'this is a 12 \b Thu Mar 21 15:32:09 HKT 2013'

06

 

07

~$ a=12;test="this is a $a \n `date`";echo $test

08

this is a 12 \n Thu Mar 21 15:40:09 HKT 2013

09

 

10

~$ a=12;test="this is a $a \$ `date`";echo $test

11

this is a 12 $ Thu Mar 21 15:40:38 HKT 2013

单引号、双引号用于把带有空格的字符串赋值给变量，如果没有单引号或双引号，shell会把空格后的字符串解释为命令，即把空格作为变量赋值的结束。

 

1

~$ a=13;test1=this is a $a \b `date`; echo $test1

2

is: command not found

特别注意：在shell脚本中进行变量的赋值时，变量名、等号和变量值之间不能有空格，否则就是上面一样的错误。

 

反引号

它的作用是命令替换，将其中的字符串当成shell命令执行，返回命令的执行结果，见上面的例子。反引号包括的字符串必须是能执行的命令，否则会出错。例子：

 

1

~$ a=12;test=`this is a $a \b `date``;echo $test

2

No command 'this' found, did you mean:

3

 Command 'thin' from package 'thin' (universe)

4

this: command not found

5

date

符号$( )的作用和反引号的一样，都是命令替换：

 

1

~$ echo $(date)

2

Thu Mar 21 15:54:15 HKT 2013

反斜杠

反斜杠一般用作转义字符,如果echo要让转义字符发生作用,就要使用-e选项,且包含转义字符的字符串要使用双引号

 

1

~$ echo "this is a \n test"

2

this is a \n test

3

~$ echo -e "this is a \n test"

4

this is a

5

 test

反斜杠的另一种作用,就是当反斜杠用于一行的最后一个字符时，shell把行尾的反斜杠作为续行，这种结构在分几行输入长命令时经常使用。