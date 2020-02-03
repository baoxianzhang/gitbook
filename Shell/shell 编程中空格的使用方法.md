# shell 编程中空格的使用方法

http://www.jb51.net/article/60327.htm

**1.定义变量时, =号的两边不可以留空格.**

eg:

gender=femal————right

gender =femal———–wrong

gender= femal———–wrong

**2.条件测试语句 [ 符号的两边都要留空格.**

eg:

if [ $gender = femal ]; then——-right.

echo “you are femal”;

fi

if[ $gender...-----------------------wrong

if [$gender...----------------------wrong.

**3.条件测试的内容,如果是字符串比较的话, 比较符号两边要留空格!**

eg:

if [ $gender = femal ]; then——-right.

if [ $gender= femal ]; then——–wrong.

if [ $gender=femal ]; then———wrong.

**4.如果if 和 then写在同一行, 那么,注意, then的前面要跟上 ; 号.如果 then 换行写, 那么也没问题.**

eg:

if [ $gender = femal ]; then——-right.

if [ $gender = femal ]

then——————————-right.

if [ $gender = femal ] then——-wrong. then前面少了 ; 号.

提示出错信息:

syntax error near unexpected token then

同理,还有很多出错信息 比如

syntax error near unexpected token fi 等都是这样引起的.

**5.if 后面一定要跟上 then. 同理**

elif 后面一定要跟上 then.

不然提示出错信息:

syntax error near unexpected token else

1）if 语句后面需要跟着then，同时前面要有分号；

2) 空格非常重要，shell 会认为空格前的为一个命令，如果a=3 认为是赋值操作，如果写成a = 3，那么就会认为a为一个命令 this=`ls -l |grep ‘^-' | wc -l `

3) 操作符之间要用空格分开 ，如 test ! -d $1，其中的！和-d就要用空格分开

空格是命令解析中的重要分隔符

**6. 命令和其后的参数或对象之间一定要有空格**

if [ -x"~/Workspace/shell/a.sh" ];then

只有 -x 后有空格才表示紧跟其后的字符串是否指向一个可执行的文件名，否则就成了测试 -x"~/Workspace/shell/a.sh" 这个字符串是不是空。

**7.取变量值的符号'$'和后边的变量或括号不能有空格**