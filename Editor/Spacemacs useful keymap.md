# Spacemacs useful keymap

Markdown:  github flavor vmd https://github.com/syl20bnr/spacemacs/tree/master/layers/%2Blang/markdown

z a：切换当前级别的展开

z r ：展开所有

z m：关闭所有

org-mode中：

M-x 运行iimage-mode可以在emacs中直接显示/隐藏图片

SPC g f h  magit-log-buffer-file 可以查看当前文件的历史commit信息

SPC g . vcs-transient-state 这个命令可以操作很多：

stage/unstage

commit

fetch/pull/push

log/diff

SPC g m magit-dispatch-popup b b checkout

SPC x a  // align针对各种符号的对齐， 比如SPC x a =  等号对齐

 SPC j j "char"  快速跳转到字符evil-avy-goto-char-2

C+\　chinese-pyim切换

SPC b i toggle imenu-list window

cscope 

SPC m g i cscope-index-files for C and C++ projects, or the command cscope/run-pycscope for Python projects, bound to SPC m g i

helm-swoop搜索问题，如果要批量修改，快捷键是什么？

搜索完成之后，按 C-c C-e 来进行批量修改。

 C-c C-e: counsle-git-grep-query-replace 

C-c C-o: ivy-occur

C-x C-q 修改完成后用 C-c C-c确认

SPC p c 工程编译， 如果卡死，可以按Ctrl-g，恢复继续编译

SPC r y helm-show-kill-ring 

SPC r r helm-register

SPC r e evil show registers

SPC r m helm-all-mark-rings

**hexl-mode 查看 hex bin 文件**

**SPC ： iedit-mode进入多光标操作， iedit-quit退出多光标操作。**

**SPC a ｏ** 直接从其他模式进入到org的操作，不需要打开一个org文件后进行 SPC m 操作

**, g a** 跳转到相应的头和源文件

**, g A** 跳转到相应的头和源文件（竖屏显示）

**gf** find-file-at-point 查找当前光标下的文件。

SPC s e iedit

iedit 操作选中后，可以到具体的选中选项中按Tab键，取消这个选中项

**SPC s c** **evil-search-highlight-persisit-remove-all可以清楚gd键之后的高亮**

SPC g t    git time machine micro state

**SPC h l**  helm-resume section 恢复上一个section，比如你搜索一个word，会弹出一个搜索框，然后选择跳到某一个文件里面，按这个键可以恢复这个搜索框

**SPC h L** helm-locate 查找ｅl, elc 文件

**SPC j =**  indent region or buffer

**SPC '** open shell, 打开ansi-term，通过按M （Alt)+ winNum切换道其他窗口, (或者按Ｅsc键，可以退出输入模式（这个时候可以选中窗口文字，做一些修改都行，再按SPC + winNum可以切换其他窗口）。通过按Ctrl + j/k选择历史记录, 可以预先写入一些work缩小历史范围。

SPC  b b ，  然后 C c  C f， helm follow, 实时显示光标所在行的文件内容。

**SPC  c y**  **copy and comment line**

SPC n f narrow to funtion    

SPC n w restore the narrow

**SPC t m c** 在pomodora开启的时候显示正在做的事情

**SPC F1** **Functions classes variables**

**SPC ?**   **functions，本模式下的快捷键等，对提示很有帮助**

**SPC h SPC**  **helm-spacemacs**    使用 Ctrl + h可以在Document, Layer, Packages切换， Ctrl+n/p 选择上下， 使用TAB保留选项列表并查看选中文档。 Ctrl+l打开选择文档。

包括 

Sapacemacs Documentation

​        Spacemacs documentation

​         How to contribute to Spacemacs

​          Vim users migration guide 

​         Quick start guide for Spacemacs

​         Tips on writing layers for Spacemacs

​          Spacemacs FAQ

​         Spacemacs conventions

Layer

Packages

Dotfile

Toggles

FAQ

SPC x d w delete-trailing-white-space

SPC *  查找整个工程下的光标所在函数或变量， 或输入需要查找的函数或变量

SPC / 在整个工程查找，smart searchce

SPC : 相当与emacs 模式中的M-x

**SPC ; 智能注释**

SPC ?找到所有的函数

SPC g magit相关的快捷键

**SPC b buffer相关快捷键**  **SPC b b** helm-mini   **SPC b d** kill-this-buffer SPC b M ace-swap-window SPC b n next-useful-buffer **SPC b .** buffer-micro-state   SPC b m +move

Ctrl C org relative keymap

SPC C capture or Ccolors

SPC c compile or comments

SPC f files relative operations     **SPC f r helm recent files**   **SPC f j dired jump**   **SPC f t neotree-toggle**  

SPC g git relative operations/ versions  **SPC g b** **git blame**  **SPC g L** **magit-log-buffer-file把log结果放到一个buffer**

​                  **SPC g s** **magit status**  **SPC g t** **time-mechine-micro-state**   **SPC g e** **magit-edff-compare**

SPC h helm/help/hightlight     SPC h SPC helm-spacemacs包括documentation Layers package dotspacemacs Troggle FAQ等  **SPC h d** help describe include **bindings** char **function** v**ariable key mode theme** info

​                                                  **SPC h m helm-man-woman  SPC h T evil-tutor-start    SPC h M** **helm-switch-major-modet跳转道某一major mode**

SPC j join/split   SPC K + lisp

**SPC l layouts-micro-state**

SPC n narrow/numbers     SPC n + increase the value   SPC n - decrease the value   SPC n , scroll-micro-state   SPC n f narrow to fun   **SPC n w** widen

**SPC p projects**    SPC p ! run shell command  SPC p &  run async shell command **SPC p b** helm projectile witch to buffer

​                            **SPC p c** **compile**  SPC p d projectile find directory SPC p Dprojectile directory SPC p f find the projcet file  SPC p  hprojectile buffers files and projects 

​                             SPC p k projectile-kill-buffer  **SPC p l** helm-persp-switch-project   SPC p o projectile-multi-occur  SPC p p helm-projectile-switch-project  SPC p r helm-projectile-recentf   **SPC p t** **neotree-find-project -root**                               SPC p v projectile-vc SPC p y projectile-find-tag   SPC p R projectile-replace  

SPC q +quit 

SPC r  +reigisters/rings

SPC s + search/symbol   **SPC s s/S** **helm-swoop**   SPC s a +ag  ag files regin symbol buffers  SPC s f helm-files-smart-do-search 在某个特定的文件中查找，可以查找特定类型文件

​                                        SPC s F helm-files-smart-so-search-region在某个特定的区域查找  **SPC s w +**web在google和wikipedia中查找

​                                         **SPC s j** jump-in-buffer跳转到文件中的函数位置   SPC s l last search-buffer在查找历史记录中查找 SPC s p smart search  SPC s P smart search w/input

​                                         SPC s C-s helm-multi-swoop-all　　　　

SPC t  +toggles    **SPC t g** golden-ratio  SPC t K which-key    SPC t n line-numbers  SPC  t w whitespace

SPC T +UI toggles/theme

SPC w + windows    SPC w SPC acy window SPC w - split windows below SPC w /split windows right SPC w TAB last windows  **SPC w 2/3** layout-double/triple-columns SPC w = balance-windows 

​                                  SPC w b swith-to-minibuffer-window   SPC w c/C  close window  SPC w d current window dedicate SPC w hHjJkKlL evil-window-move SPC w m maximize-buffer 

​                                  SPC w M  Centered-buffer-mode    SPC w o  other-frame     SPC w R rotate-windows SPC w s split-window-below  SPC w S split-window-below-and-focus 

​                                  SPC w u winner-undo  SPC  w U winner-redo SPC w v split-window-right SPC w V split-window-right-and-focus    SPC w w other window

SPC x +text        SPC x a +align SPC x  c count-region  SPC x d +delete      **SPC x d  w** delete-trailing-whitespace        **SPC x g** +google-translate SPC x  l + lines  **SPC x o** avy-open-url   SPC x  t +transpose

​                                   SPC x u downcase-region   SPC x U upcase-region   SPC x  w +word       SPC x SPC x   SPC x SPC x SPC x

**SPC y** avy line

SPC z +zoom  f zoom-frm-micro-state x scale-font-micro-stae

**SPC j =** indent-region-or-buffer

SPC n=/+ evil-number-increase

SPC n-     evil-number-decrease

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

Find Function definition

C-h f

Find variable definition

C-h v

Emacs FAQ

C-h C-f

Find in project, file, opened buffers and definition

*

/ f b and [d/D]

**Go to your .spacemacs file**

**SPC f e d**

Go to .emacs.d/init.el

SPC f e i

Find an elpa library

SPC h L

Find Spacemacs layers, docs and package configuration  Spacemacs document

SPC f e h

SPC h SPC

SPC h SPC

C-h t to open the tutorial.

C-h k/ C-h v / C-h f (Emacs is a self document, extensiable editor.)

Major mode and minor mode (C-h m)

Use SPC : to list all available commands

SPC p f (find a file in current project, it looks like the Ctrl-p plugin in Vim)

Use the alignment shortcuts located under SPC x a to align based on a number of different criteria (e.g. commas or pipes.) You can also usealign-repeat (SPC x a r) to align on an arbitrary character.

re

To open the installed dotfile:

<SPC> f e d

At anytime you can apply the changes made to the dotfile or layers without restarting Spacemacs by pressing SPC f e R.

**4.6 Key bindings discovery**

Thanks to [which-key](https://github.com/justbur/emacs-which-key), whenever a prefix command is pressed (like SPC) a buffer appears after one second listing the possible keys for this prefix.

It is also possible to search for specific key bindings by pressing:

SPC ?

To narrow the bindings list to those prefixed with SPC, type a pattern like this regular expression:

SPC\ b

which would list all buffer related bindings. **Note:** You are at the *HELM-Descbind* prompt, the pattern consists of 6 letters: uppercase SPC, a backslash, an actual space and a lowercase b.

**4.7 Describe functions**

Describe functions are powerful Emacs introspection commands to get information about functions, variables, modes etc. These commands are bound thusly:

| **Key Binding** | **Description**   |
| --------------- | ----------------- |
| SPC h d f       | describe-function |
| SPC h d k       | describe-key      |
| SPC h d m       | describe-mode     |
| SPC h d v       | describe-variable |

**chinese-pyim, you should install the lexicon(词库) file. You could call pyim-dicts-manager to open up the settings buffer and press i e to install the default lexicon. The lexicon is about 20M, so you should be patient when downloading starts. After the lexicon file is downloaded, just press s to save and R to restart configuration.**

**doxymacs**

| **命令** | **英文解释**                                               | **中文解释**                 |
| -------- | ---------------------------------------------------------- | ---------------------------- |
| C-c d ?  | will look up documentation for the symbol under the point. | 查找当前鼠标点下的符号的文档 |
| C-c d r  | will rescan your Doxygen tags file.                        | 重新扫描tags文件             |
| C-c d f  | will insert a Doxygen comment for the next function.       | 为函数插入Doxygen注释        |
| C-c d i  | will insert a Doxygen comment for the current file.        | 为文件插入Doxygen注释        |
| C-c d ;  | will insert a Doxygen comment for the current member.      | 为当前成员插入Doxygen注释    |
| C-c d m  | will insert a blank multiline Doxygen comment.             | 插入多行注释                 |
| C-c d s  | will insert a blank singleline Doxygen comment.            | 插入单行注释                 |
| C-c d @  | will insert grouping comments around the current region.   | 插入环绕当前区域的注释       |

文／文卿（简书作者） doxygen emacs 

原文链接：http://www.jianshu.com/p/ffb1ac5b0e56

著作权归作者所有，转载请联系作者获得授权，并标注“简书作者”。

Org Mode下

C c ' 可以在代码块中打开对应模式的的缓冲区

\#+begin_src emacs-lisp

  (require 'my-feature)

  (+ 2 3)

  (- 5 10)

\#+end_src

使**用** ****然后 Tab** 可以直接插入代码块的代码片段（Snippet），更多类似的代码片段（Org-mode Easy Templates）可以在[这里](http://orgmode.org/manual/Easy-Templates.html)找到。

Org mode supports insertion of empty structural elements (like #+BEGIN_SRC and #+END_SRC pairs) with just a few key strokes. This is achieved through a native template expansion mechanism. Note that Emacs has several other template mechanisms which could be used in a similar way, for example yasnippet.

To insert a structural element, type a ‘<’, followed by a template selector and <TAB>. Completion takes effect only when the above keystrokes are typed on a line by itself.

The following template selectors are currently supported.

| s    | #+BEGIN_SRC ... #+END_SRC         |
| ---- | --------------------------------- |
| e    | #+BEGIN_EXAMPLE ... #+END_EXAMPLE |
| q    | #+BEGIN_QUOTE ... #+END_QUOTE     |
| v    | #+BEGIN_VERSE ... #+END_VERSE     |
| c    | #+BEGIN_CENTER ... #+END_CENTER   |
| l    | #+BEGIN_LaTeX ... #+END_LaTeX     |
| L    | #+LaTeX:                          |
| h    | #+BEGIN_HTML ... #+END_HTML       |
| H    | #+HTML:                           |
| a    | #+BEGIN_ASCII ... #+END_ASCII     |
| A    | #+ASCII:                          |
| i    | #+INDEX: line                     |
| I    | #+INCLUDE: line                   |

For example, on an empty line, typing "<e" and then pressing TAB, will expand into a complete EXAMPLE template.

You can install additional templates by customizing the variable org-structure-template-alist. See the docstring of the variable for additional details.

括号匹配:

% 可以让光标从它当前所在的括号跳转到与它相匹配的括号上去, 对花括号和

圆括号, 方括号都有效, 常用于手工检查括号是否匹对.

标示位置

\--------

你可以在档案□做些标记再随时返回被标记的位置.

m char (MARK) 把这个地方标示成 char

' char (quote character) 跳到被标为 char的那一行

'' (按两次') 回到刚才的位置

char 可以是小写的 a-z中的任一个 . 一个标记在除了下面的这两种情况

外会一直存在

1) 重覆使用相同的标示 char .

或 2) 删掉了被标示的那一行.

文字段落

\--------------

有时候一段一段的移动游标会比较方便.我们可以用 {,},(,) 来达到这些功能

{ (左大括号) 跳到上一段的开头

} (右大括号) 跳到下一段的的开头.

( (左小括号) 移到这个句子的开头

) (右小括号) 移到下一个句子的开头

[[ 跳往上一个函式

]] 跳往下一个函式