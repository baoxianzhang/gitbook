# Ubuntu 16.04 安装 LaTex

http://www.mryu.top/research/157.html

LaTeX（LATEX，音译“拉泰赫”）是一种基于ΤΕΧ的排版系统。

由美国计算机学家莱斯利·兰伯特（Leslie Lamport）在20世纪80年代初期开发，利用这种格式，即使使用者没有排版和程序设计的知识也可以充分发挥由TeX所提供的强大功能，能在几天，甚至几小时内生成很多具有书籍质量的印刷品。

对于生成复杂表格和数学公式，这一点表现得尤为突出。因此它非常适用于生成高印刷质量的科技和数学类文档。这个系统同样适用于生成从简单的信件到完整书籍的所有其他种类的文档。

－－－摘自百度百科

作为一个计算机的研究生，很多时候写论文涉及到数学部分会有成堆的数学公式，这个时候LaTex的优势就充分体现出来了。

在Ｕbuntu 16.04环境下，安装Latex并创建，编译文档只需要三步：

**１．安装TexLive**

sudo apt-get install texlive-full

**２．安装TexMaker**

sudo apt-get install texmaker

**３．在终端输入texmaker打开TexMake编辑器，到这里就可以创建并编译Tex文档了**

**选择XeLatex来编译, 也可以通过选在Options->Configure-> Quick Build Command -> XeLatex + View PDF**

http://blog.csdn.net/miaoqiucheng/article/details/53082326 

\+ 中文

**sudo apt-get install latex-cjk-all** 