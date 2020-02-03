# nm命令与符号说明  (arm-none-eabi-nm)

http://blog.chinaunix.net/uid-7749031-id-2044727.html

**语法**

nm [ [-A ](http://www.ifpubs.com/books/aix52/nm.htm#a8xsxj236lapw)] [ [-C ](http://www.ifpubs.com/books/aix52/nm.htm#hulaf11bharr)] [ [-X {32|64|32_64}\]](http://www.ifpubs.com/books/aix52/nm.htm#i0816970918mkm) [ [-f ](http://www.ifpubs.com/books/aix52/nm.htm#ahn9740)] [ [-h](http://www.ifpubs.com/books/aix52/nm.htm#a09495b4) ] [ [-l](http://www.ifpubs.com/books/aix52/nm.htm#nm_flags_l) ] [ [-p](http://www.ifpubs.com/books/aix52/nm.htm#f3a6b3c872endr) ] [ [-r ](http://www.ifpubs.com/books/aix52/nm.htm#ahn9742)] [ [-T](http://www.ifpubs.com/books/aix52/nm.htm#a09495b7) ] [ [-v ](http://www.ifpubs.com/books/aix52/nm.htm#a09495b9)] [ [-B ](http://www.ifpubs.com/books/aix52/nm.htm#bwuxj1falapw)| [-P ](http://www.ifpubs.com/books/aix52/nm.htm#wwuxj11blapw)] [ [-e ](http://www.ifpubs.com/books/aix52/nm.htm#a09495b3)| [-g](http://www.ifpubs.com/books/aix52/nm.htm#jquxj40lapw) | [-u ](http://www.ifpubs.com/books/aix52/nm.htm#a09495b8)] [ [-d ](http://www.ifpubs.com/books/aix52/nm.htm#a16393f5)| [-o ](http://www.ifpubs.com/books/aix52/nm.htm#a09495b6)| [-x ](http://www.ifpubs.com/books/aix52/nm.htm#a09495ba)| [-t ](http://www.ifpubs.com/books/aix52/nm.htm#x7vxj6clapw)Format ] File ...

**描述**

nm 命令显示关于指定 File 中符号的信息，文件可以是对象文件、可执行文件或对象文件库。如果文件没有包含符号信息，nm 命令报告该情况，但不把它解释为出错条件。 nm 命令缺省情况下报告十进制符号表示法下的数字值。

nm 命令把以下符号信息写入标准输出：

- 库或对象名

如果您指定了 -A 选项，则 nm 命令只报告与该文件有关的或者库或者对象名。

- 符号名称
- 符号类型

nm 命令使用以下符号（用同样的字符表示弱符号作为全局符号）之一来表示文件符号类型：

| A    | Global absolute 符号。 |
| ---- | ---------------------- |
| a    | Local absolute 符号。  |
| B    | Global bss 符号。      |
| b    | Local bss 符号。       |
| D    | Global data 符号。     |
| d    | Local data 符号。      |
| f    | 源文件名称符号。       |
| T    | Global text 符号。     |
| t    | Local text 符号。      |
| U    | 未定义符号。           |

- 值
- 大小

如果可应用，nm 命令报告与符号有关的大小。

**标志**

| -A        | 每行或者显示全路径名称或者显示对象库名。                     |
| --------- | ------------------------------------------------------------ |
| -B        | 在 Berkeley 软件分发（BSD）格式中显示输出：值   类型   名称  |
| -C        | 限制解码（demangle） C++ 名称。缺省是解码所有 C++ 符号名。注:C++ 对象文件中的符号在被使用前它们的名称已经被解码了。 |
| -d        | 用十进制显示符号的值和大小。这是缺省的。                     |
| -e        | 只显示静态的和外部的（全局）符号。                           |
| -f        | 显示完整的输出，包括冗余的 .text、 .data 以及 .bss 符号，这些在通常都是被限制的。 |
| -g        | 只显示外部的（全局）符号。                                   |
| -h        | 限制输出头数据的显示。                                       |
| -l        | 通过给 WEAK 符号的编码键附加一个 * 来区分 WEAK 和 GLOBAL 符号。如果和 -P 选项一起使用， WEAK 符号的符号类型显示如下：VWeak Data 符号WWeak Text 符号wWeak 未定义符号ZWeak bss 符号 |
| -o        | 用八进制而不是十进制数来显示符号的值和大小。                 |
| -P        | 以标准可移植输出格式显示信息：库／对象名　 名称   类型   值   大小该格式以十六进制符号表示法显示数字值，除非您用 -t、-d 或 -o 标志指定不同的格式。如果您指定了 -A 标志 -P 标志只显示 库／对象名字段。同样，-P 标志只显示大小适用的符号大小字段。 |
| -p        | 不排序。输出按符号表顺序打印。                               |
| -r        | 倒序排序。                                                   |
| -T        | 把可能会溢出它的列的每个名字截短，使显示的名字的最后一个字符是星号（*）。缺省情况下，nm 显示列出的符号的全名，并且一个比为其设置的列的宽度长的名称会引起名称后的每个列无法对齐。 |
| -t Format | 显示指定格式下的数字值，其中 Format 参数是以下符号表示法之一：d十进制符号表示法。这是 nm 命令的缺省格式。o八进制符号表示法。x十六进制符号表示法。 |
| -u        | 只显示未定义符号。                                           |
| -v        | 按值而不是按字母表顺序排序输出。                             |
| -x        | 用十六进制而不是十进制数来显示符号的值和大小。               |
| -X mode   | 指定 nm 应该检查的对象文件的类型。 mode 必须是下列之一：32只处理 32 位对象文件64只处理 64 位对象文件32_64处理 32 位和 64 位对象文件缺省是处理 32 位对象文件（忽略 64 位对象）。 mode 也可以 OBJECT_MODE 环境变量来设置。例如，OBJECT_MODE=64 使 nm 处理任何 64 位对象并且忽略 32 位对象。 -X 标志覆盖 OBJECT_MODE 变量。 |

注:

nm 命令支持 -- （双连字符）标志。如果文件名会被曲解为一个选项，该标志区别于 File 操作数。例如，要指定文件名以连字符开始，请使用 -- 标志。

**退出状态**

该命令返回下列出口值：

| 0    | 成功完成。 |
| ---- | ---------- |
| >0   | 发生错误。 |

**示例**

1. 列出 a.out 对象文件的静态和外部符号，请输入：

nm -e a.out

1. 以十六进制显示符号大小和值并且按值排序符号，请输入：

nm -xv a.out

1. 显示 libc.a 中所有 64 位对象符号，忽略所有 32 位对象：

nm -X64 /usr/lib/libc.a