# ubuntu14.04下安装Matlab

2017两个iso

sudo mkdir /media/matlab

使用sudo mount -o loop R2017a_glnxa64_dvd1.iso /media/matlab

等提示说插入第二个dvd时

sudo mount -o loop R2017a_glnxa64_dvd2.iso /media/matlab

就可以了。

license.lic拷贝的时候需要使文件有权限。

在home下运行 sudo /media/matlab/install

复制粘贴09806-07443-53955-64350-21751-41297

重启sudo /usr/local/MATLAB/R2017a/bin/matlab, 导入

license_standalone.lic

最后

把matlab2017/R2017a/bin/glnxa64/libmwservices.so 覆盖到安装目录对应文件（sudo nautilus)

 sudo ln -s /usr/local/MATLAB/R2017b/bin/matlab /usr/local/bin/matlab

这样就不需要权限运行matlab了