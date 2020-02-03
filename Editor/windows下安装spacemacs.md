# windows下安装spacemacs

\1. 下载emacs25.1

http://mirrors.ustc.edu.cn/gnu/emacs/windows/

[emacs-25.1-x86_64-w64-mingw32.zip](http://mirrors.ustc.edu.cn/gnu/emacs/windows/emacs-25.1-x86_64-w64-mingw32.zip)   

Attention: 也必须下载

[emacs-25-x86_64-deps.zip](http://mirrors.ustc.edu.cn/gnu/emacs/windows/emacs-25-x86_64-deps.zip)  

\2. 把deps内的内容解压覆盖emacs解压的内容。

\3. 安装git, TortoiseGit

下载spacemacs的仓库到HOME目录，

git clone git@github.com:syl20bnr/spacemacs.git

重命名 spacemacs为 .emacs.d

把所在目录设置为HOME环境变量

Be sure to declare a environment variable named HOME pointing to your user directory C:\Users\<username>. Then you can clone Spacemacs in this directory. 

\4. 把emacs目录中的runemacs.exe放到桌面的快捷方式

\5. 下载global gtags的windows版本

http://adoxa.altervista.org/global/ Win32版本

把对应的bin, lib, share拷贝到emacs文件夹里面的对应目录（或者直接进行增加环境变量到Path, 直接省略这一步)

增加环境变量Path

D:\Softwares\emacs-25.1-x86_64-w64-mingw32\bin

\6. 运行下载就可以。

必要的时候可以切换emacs 的源。

;;(setq configuration-layer--elpa-archives

;;       '(("melpa-cn" . "https://elpa.zilongshanren.com/melpa/")

;;         ("org-cn"   . "https://elpa.zilongshanren.com/org/")

;;         ("gnu-cn"   . "https://elpa.zilongshanren.com/gnu/")))

;; https://github.com/syl20bnr/spacemacs/issues/2705

  (setq-default

   configuration-layer--elpa-archives

   '(("melpa-cn" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")

​     ("gnu-cn" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")

​     ("org-cn" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))

运行的时候可能会出现一些包出错的问题。

https://github.com/syl20bnr/spacemacs/issues/6933

So, I copied evil-unimpaired-0.1pre0.20161201.02153.el to evil-unimpaired-0.1pre0.20161201.2153.el and restarted emacs. Everything seemed okay after that. :-)

Looks like there is a typo in the evil-unimpaired install script. :-/

修改包的后面数字为四位就可以了。

\7. 安装其他工具

pt: the platinum_searcher

https://github.com/monochromegane/the_platinum_searcher/releases

[pt_windows_amd64.zip](https://github.com/monochromegane/the_platinum_searcher/releases/download/v2.1.4/pt_windows_amd64.zip)

把解压出来的pt，放到emacs-25.1-x86_64-w64-mingw32/bin文件夹中

