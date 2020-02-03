# qt 打包程序记录

http://blog.csdn.net/z3512498/article/details/64922180

\1. 在可以编译程序的电脑上，找个地方新建文件夹命名为你的打包名称如LidarCam1404

**2. 把要打包的可执行文件excal-qt拷贝到LidarCam1404中， 新建文件夹lib，并拷贝qt5中的plugins文件夹中的 platforms到lib文件夹中。**

**3. 创建copylib.sh，并设置可执行权限，chmod +x copylib.sh, 如下：**

\#!/bin/bash

LibDir=$PWD"/lib"

mkdir -p $LibDir

lib_array=($(ldd $1 | grep -o "/.*" | grep -o "/.*/[^[:space:]]*"))

for Variable in ${lib_array[@]}

do

  cp "$Variable" $LibDir -rf

done

**4.  创建runcopylib.sh， 并设置可执行权限，chmod +x runcopylib.sh**

\#!/bin/bash

function copylib ()

{

  LibDir=$PWD"/lib"

  mkdir -p $LibDir

  lib_array=($(ldd $1 | grep -o "/.*" | grep -o "/.*/[^[:space:]]*"))

  for Variable in ${lib_array[@]}

  do

​    cp "$Variable" $LibDir # 后面不能加-rf，不然拷贝的是软链接

  done

}

if [ $# != 1 ] ; then

  echo "USAGE: $0 exe_name"

  echo " e.g.: $0 excal-qt"

  exit 1;

fi

copylib $1

if [ ! -d "lib/platforms" ]; then

  echo "Error, please cp platforms folder in the qt plugins directory"

  exit

fi

for file in $(ls ./lib/platforms/*)

do

  echo "*************************************"

  echo $file

  copylib $file

  echo ""

done

echo "Copy lib successully!"

**5. 创建shell script,  并设置可执行权限，chmod +x runexe.sh如下，**

\#!/bin/bash

if [ $# != 1 ] ; then

  echo "USAGE: $0 exe_name"

  echo " e.g.: $0 excal-qt"

  exit 1;

fi

appname=$1

dirname=`dirname $0`

tmp="${dirname#?}"

if [ "${dirname%$tmp}" != "/" ]; then

  dirname=$PWD/$dirname

fi

LD_LIBRARY_PATH=$dirname/lib

export LD_LIBRARY_PATH

$dirname/$appname "$@"

\6. 运行

./runcopylib.sh excal-qt  # 拷贝库文件

./ runexe.sh  excal-qt 