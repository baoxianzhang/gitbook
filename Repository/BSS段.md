# BSS段

摘自《C编程专家》

数据段保存在目标文件中

BSS段不保存在目标文件中（除了记录BSS段在运行时所需要的大小）

文本段是最容易受优化措施影响的段

a.out文件的大小受调试状态下编译的影响，但段不受影响。

a.out "assembler output" （汇编程序输出）， 它不是汇编程序输出，而是链接器输出

ELF（原意为”ExtensibleLinkerFormat，可扩展连接器格式“，现在代表”Executable linking Format， 可执行文件和链接格式“）

BSS ”Block Started by Symbol" (由符号开始的块）， 有人喜欢记作“Better Save Space" (更有效地节省空间）

在不同的计算机架构和不同的操作系统中，堆栈的位置可能各不相同。尽管讨论的是堆栈的顶部，事实上在绝大多数处理器中，堆栈市向下增长的，也就是朝低地址方向生长。