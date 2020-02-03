# linux下的c 编程工具

作者：Pegasus Wang

链接：https://www.zhihu.com/question/23357089/answer/35258954

来源：知乎

著作权归作者所有，转载请联系作者获得授权。

主要是linux下的工具：

编辑器

- vim
- emacs
- kate（KDE下一个功能强大的编辑器）

IDE(集成开发环境）

- eclipse+cdt
- clion
- qt cteator

编译器

- gcc
- g++
- clang

调试器

- gdb

构建工具

- cmake
- make

内存工具

- Purify
- Valgrind工具集(包括剖析工具Callgrind和线程分析工具Helgrind等)
- KCachegrind

剖析工具

- gprof开源剖析工具，通常作为gcc编译器的一部分。
- Quantify是IBM的一个功能强大的商业剖析工具。

静态检查器

- Lint
- google cpplint
- C++test
- cppcheck

并行编程工具

- Posix Threads
- MPI(Message Passing Interface)
- MapReduce（并行计算框架）

代码工具（命令行工具）

- nm 列出来自对象文件的符号
- objdump 显示对象文件信息
- strings 列出二进制文件中可输出的字符串
- strip 删除来自对象文件的符号
- m4 宏处理程序
- indent 代码格式化工具

监测工具

- time 计时工具
- ps 显示运行进程的当前状态
- top 给出系统的详细信息
- strace 记录对操作系统的所有访问，例如内存分配、文件I/O、系统调用和子进程的启动