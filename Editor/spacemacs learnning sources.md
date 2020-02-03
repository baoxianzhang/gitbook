# spacemacs learnning sources



very good emacs to learn

http://spacemacs.org/doc/DOCUMENTATION#orgheadline180

http://spacemacs.org/doc/LAYERS.html

http://spacemacs.org/doc/QUICK_START

use-package

https://github.com/jwiegley/use-package

spacemacs rocks

https://github.com/emacs-china/Spacemacs-rocks

**ORG Mode**

org Agenda / Pomodoro  

gtd    时间管理

deft    记笔记





Emacs 服务器

Spacemacs 会在启动时启动服务器，这个服务器会在 Spacemacs 关闭的时候被杀掉。

使用 Emacs 服务器

当 Emacs 服务器启动的时候，我们可以在命令行中使用 emacsclient 命令：

- $ emacsclient -c 用 Emacs GUI 来打开文件
- $ emacsclient -t 用命令行中 Emacs 来打开文件

杀掉 Emacs 服务器

除了关闭 Spacemacs 之外，我们还可以用下面的命令来杀掉 Emacs 服务器：

- $ emacsclient -e '(kill-emacs)'

持久化 Emacs 服务器

我们可以持久化 Emacs 服务器，在 Emacs 关闭的时候，服务器不被杀掉。只要设置 ~/.spacemacs 中dotspacemacs-persistent-server 为 t 即可。

但这种情况下，我们只可以通过以下方式来杀掉服务器了：

- SPC q q 退出 Emacs 并杀掉服务器，会对已修改的 Buffer 给出保存的提示。
- SPC q Q 同上，但会丢失所有未保存的修改。