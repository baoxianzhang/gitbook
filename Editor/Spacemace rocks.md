# Spacemace rocks

https://emacs-china.org/t/21-emacs/54

https://github.com/emacs-china/Spacemacs-rocks/issues/6

.spacemacs和.spacemacs.d/init.el 的关系

它的关系类似.emacs 和.emacs.d/init.el 的关系。

如果没有特别说明，后面的 FAQ 里面提到的.spacemacs 指的是.spacemacs 文件或者是.spacemacs.d/init.el文件。

Spacemacs启动速度特别慢

因为 Emacs 24.5的 Tramp 有一个 bug，而 helm mode 使用了 Tramp。 可以在.spacemacs 里面的dotspacemacs/user-init 函数添加下列代码来解决：

  (setq tramp-ssh-controlmaster-options "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")

Org-mode table 里面中英文对齐

激活 chinese layer，并在.spacemacs 里面的 dotspacemacs/user-config 函数添加下列代码:

（注意，这里我的系统是 Mac，所以我用了(spacemacs/system-is-mac)函数来做判断，你可以根据自己的实际情况进行修改。另外， "Hiragino Sans GB"也是 Mac 系统自带的。）

  (when (configuration-layer/layer-usedp 'chinese)    (when (spacemacs/system-is-mac)      (spacemacs//set-monospaced-font "Source Code Pro" "Hiragino Sans GB" 14 16)))

ctags -eR . company-etags (company-etags can’t used for every major mode)

Layout related operations

1. What’s layout in spacemacs? How to use layout in spacemacs?
2. **SPC l L load layout file**
3. SPC l l to switch between layouts
4. **SPC l s to save layout to file**
5. SPC l <tab> switch between the last layout and the current layout
6. SPC l o custom layout
7. SPC l R rename layout
8. **SPC l ? to o****pen the help window, learn more operations about laout**

**With** **SPC l s and SPC l L** **you can save and load perspectives to a file.**

1. **SPC t - center p****oint**

- C-c C-t to toggle TODO states

SPC : to list all available commands

export to html, you could also export to pdf

C-x C-e