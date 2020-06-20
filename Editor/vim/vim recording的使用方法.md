# vim recording的使用方法

http://www.ttlsa.com/linux-command/use-vim-recording/

使用vim时无意间触碰到q键，左下角出现“recording”这个标识，觉得好奇，遂在网上查了一下，然后这是vim的一个强大功能。他可以录 制一个宏（Macro)，在开始记录后，会记录你所有的键盘输入，包括在insert模式下的输入、正常模式下使用的各种命令等。

具体使用：

第一步：在正常模式下（非insert模式、非visual模式）按下q键盘

第二步：选择a-z或0-9中任意一个作为缓冲器的名字，准备开始录制宏

第三步：正常的操作，此次所有的操作都会被记录在上一步中定义的缓冲器中

第四步：在非insert模式下输入q停止宏的录制

第五步：使用@ + 第二步中定义的缓冲器的名字即可。

例如想把下面的文字

line1

line-2

line3-1

l4

变成如下的文字

System.out.println(line1);

System.out.println(line1);

System.out.println(line-2);

System.out.println(line3-1);

System.out.println(L4);

观察可以发现他们的规律，在每行文字的开头添加“System.out.println(”，结尾添加“);”就变成下面的信息了。下面简单介绍一下如何使用recording来完成这样的操作。

首先把光标移动line1上，输入qt，准备开始录制，缓冲器的名字为t，录制的动作为：shift + ^ 回到行首、按下i键进入insert模式、输入“System.out.println(”、按下esc键回到正常模式、shift + $ 回到行尾部、按下i键进入insert模式、输入“);”按下esc键回到正常模式，按下q停止录制。然后把光标移动到下面一行的任意位置输入 @ + t 即可。

recording还可以和查询结合起来使用，例如想把一个文件中含有特定字符串的行注释，可以通过这样的宏来实现。在正常模式下输入/search string + enter、shift + ^、i、#、esc、shift + $。

让定制的宏自动执行多次的方法是先输入一个数字，然后在输入@ + 缓冲器的名字。 例如 100@t，表示执行100次。