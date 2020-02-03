# shell 文件当前全局路径

```shell
PWD=$( cd "$( dirname "${BASH_SOURCE[0]}")" && pwd )
```

basepath=$(cd `dirname $0`; pwd)

在此解释下basepath ：

dirname $0，取得当前执行的脚本文件的父目录 cd `dirname $0`，进入这个目录(切换当前工作目录) pwd，显示当前工作目录(cd执行后的)

由此，我们获得了当前正在执行的脚本的存放路径。