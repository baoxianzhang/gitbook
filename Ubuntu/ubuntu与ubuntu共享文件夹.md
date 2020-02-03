# ubuntu与ubuntu共享文件夹

第一设置共享文件夹

第二，安装插件， Devices->Insert  Guest  Additions CD image

第三， sudo usermod -a -G vboxsf $USER 注意，不是sudo usermod -a -G vboxusers $USER 

第四， 文件夹在/media/sf_data