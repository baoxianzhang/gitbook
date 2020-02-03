# emacs和vi替换windows文件中的换行符^M

http://www.itokit.com/2011/0319/33227.html

  emacs:

```shell
 M-<            // 光标定道行首

 M-x replace-string RET C-q C-m RET RET   // Ctrl-q Ctrl-m 就是^M
```



  vi :

```
%s/ctrl-v ctrl-m/\r/g

gg

:

%s/ctrl-v ctrl-m/
```



