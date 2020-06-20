# 安装spacemacs出現unable to install package xxx is unavalible 解決方法

時間： 20200620

最近一個月更新國spacemacs都會出現這個問題。主要是undo-tree-0.1.3找不到，主要的原因应该是源的相关signature变了，版本号变了，网速等原因。



## 调查相关资料

+ 中科大的Emacs ELPA源的使用:   http://mirrors.ustc.edu.cn/help/elpa.html

添加下面的代码到.spacemacs的dotspacemacs/user-init中：

```
(setq configuration-layer--elpa-archives
      '(("melpa-cn" . "https://mirrors.ustc.edu.cn/elpa/melpa/")
        ("org-cn"   . "https://mirrors.ustc.edu.cn/elpa/org/")
        ("gnu-cn"   . "https://mirrors.ustc.edu.cn/elpa/gnu/")))
```

**特别注意：**develop 分支应使用 `configuration-layer-elpa-archives` 代替上面代码中的 `configuration-layer--elpa-archives` （ `--` 换成 `-` ）。

最后面的“/”, 不可以略去，否则可能无法正常工作。

+ spacemacs相关的issue

  https://github.com/syl20bnr/spacemacs/issues/10472

  https://github.com/syl20bnr/spacemacs/issues/10598

  有使用下面命令解决的，有改变emacs版本解决的，有重新rm elpa文件夹解决的....

  ```
  emacs --insecure
  ```




+ **error: Package ‘undo-tree-’ is unavailable**

  https://gitmemory.com/issue/bbatsov/prelude/1225/464593340

      ```
As far as I can tell, this particular failure can happen due to unsigned packages, or incorrectly signed packages. I see that undo-tree-0.6.5 available from the gnu package repo, is unsigned.

Workarounds are available.

See if this helps:

review the advice at https://www.gnu.org/software/emacs/manual/html_node/emacs/Package-Installation.html
try to identify the offending package (start emacs with --debug-init)
add the package to the package-unsigned-archives list and restart emacs (ideally, after auditing the source code of your target package)
you may need to do this at the top of prelude's init.el (set the list, before prelude tries to install packages)
it's possible that more than one package is causing this problem
There's some advice out there to turn off signature checking entirely with (setq package-check-signature nil) --- see: https://stackoverflow.com/a/26110978 --- but I don't like this idea of very much (signatures exist for a good reason).

Please report back here with your findings. I'd be interested to learn if I'm wrong, and more interested to learn what worked for you.

Also if this is a fundamental issue, prelude maintainers might be able to work out a proper fix.


      ```

  这边推荐使用package-unsigned-archives  list，暂时没有用，而用到了厘米的

```
(setq package-check-signature nil)
```

相关**Package Installation** signed解析: https://www.gnu.org/software/emacs/manual/html_node/emacs/Package-Installation.html





##  解决办法

+ 注意到上面资料develop分支需要把configuration-layer--elpa-archives中的**"--"**变为**"-"**. 

  并通过换源，结合使用的develop还是master分支，进行测试。

+ 版本号对不上，signature不对，可以添加下面语句到spacemacs/init.el中解决，如下：

  ```
  ;; Avoid garbage collection during startup.
  ;; see `SPC h . dotspacemacs-gc-cons' for more info
  (defconst emacs-start-time (current-time))
  (setq gc-cons-threshold 402653184 gc-cons-percentage 0.6)
  (load (concat (file-name-directory load-file-name)
                "core/core-versions.el")
        nil (not init-file-debug))
  (load (concat (file-name-directory load-file-name)
                "core/core-load-paths.el")
        nil (not init-file-debug))
  (load (concat spacemacs-core-directory "core-dumper.el")
        nil (not init-file-debug))
  
  (if (not (version<= spacemacs-emacs-min-version emacs-version))
      (error (concat "Your version of Emacs (%s) is too old. "
                     "Spacemacs requires Emacs version %s or above.")
             emacs-version spacemacs-emacs-min-version)
    ;; Disable file-name-handlers for a speed boost during init
    ;; (add-to-list 'package-unsigned-archives 'undo-tree)
    (setq package-check-signature nil)
    (let ((file-name-handler-alist nil))
      (require 'core-spacemacs)
      (spacemacs/dump-restore-load-path)
      (configuration-layer/load-lock-file)
      (spacemacs/init)
      (configuration-layer/stable-elpa-init)
      (configuration-layer/load)
      (spacemacs-buffer/display-startup-note)
      (spacemacs/setup-startup-hook)
      (spacemacs/dump-eval-delayed-functions)
      (when (and dotspacemacs-enable-server (not (spacemacs-is-dumping-p)))
        (require 'server)
        (when dotspacemacs-server-socket-dir
          (setq server-socket-dir dotspacemacs-server-socket-dir))
        (unless (server-running-p)
          (message "Starting a server...")
          (server-start)))))
          
  ```

