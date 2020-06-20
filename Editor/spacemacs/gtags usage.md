# gtags usage



https://www.gnu.org/software/global/manual/global.html

几个环境变量的解析：

GTAGS

Tag file for definitions.

GRTAGS

Tag file for references.

GPATH

Tag file for source files.

GTAGSROOT

If environment variable *GTAGSROOT* is not set and file GTAGSROOT exists in the same directory as GTAGS then global sets *GTAGSROOT* to the contents of the file.

gtags.conf, $HOME/.globalrc

Configuration data for GNU GLOBAL. See gtags.conf(5).

*GTAGSDBPATH*

The directory in which the tag files exist. This value is ignored when *GTAGSROOT* is not defined. Use of this variable is not recommended.

*GTAGSROOT*

The root directory of the project. Usually, it is recognized by existence of GTAGS. Use of this variable is not recommended.

*GTAGSLIBPATH*

If this variable is set, it is used as the path to search for library functions. If the given symbol is not found in the project, global also searches in these paths. Since only GTAGS is targeted in the retrieval, this variable is ignored when ‘-r’ or ‘-s’ is specified.

*GTAGSOBJDIR*, *MAKEOBJDIR*

If eigher of the two variable is set, it is used as the name of BSD-style objdir. The former is given priority. The default is obj.

新增加其他的路径：

$ export GTAGSROOT=`pwd`

 $ export GTAGSDBPATH=/var/dbpath

所以在zsh上加上类似的语句，可以调用pcl, opencv的tags(当然需要在pcl, opencv中运行gtags):

export GTAGSLIBPATH=/home/zhangbaoxian/code/pcl:/home/zhangbaoxian/code/opencv

4 GNU Global高级用法

高级用法主要涉及对系统的头文件目录中的文件进行索引。

系统头文件目录通常来说是只读的，而且我们也不希望产生的临时文件污染系统头文件目录。

可以通过修改 MAKEOBJDIRPREFIX 和 GTAGSLIBPATH 等环境变量实现。

但是目前我还没有研究出来正确的使用方法。

可以通过创建系统头文件目录的软链接到工程目录，这样gtags在生成索引数据库时就能够扫描系统头文件目录了。

参考资料：https://www.gnu.org/software/global/globaldoc_toc.html