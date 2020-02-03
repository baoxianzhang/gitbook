# Org agenda and pomodoro



**After add the layer** **org** **in config file,open a org file,then type** **SPC m p** **can activate a pomodoro clock.This is really easy,but really useful for me**

**SPC t m c** 在pomodora开启的时候显示正在做的事情

C-c C-t: 切换常规的标题(heading)和TODO和DONE

M-shift-RET 插入TODO

[[link][description]]

**C-c C-o** for **org-open-at-point**

 **C-c l** to call **org-store-link**

**C-c C-l** to call **org-insert-link**

**shift-TAB** to get an overview of your document

**shift-TAB** again to show **all** headings

**C-c a t** to enter the global todo list. Org-mode will scan the files in **org-agenda-files** and present a listing of all the open TODO items

move the cursor to the line after the TODO item "Finish document", and hit **C-c C-s** to run **org-schedule**. 

hit **C-c a a** for **org-agenda**. A display of this week's scheduled items are displayed

Now press "l" (lowercase L) to turn on log display. This displays the all finished tasks and their completion times.





http://orgmode.org/worg/org-tutorials/orgtutorial_dto.html





http://blog.csdn.net/ab748998806/article/details/51182352

在Org-mode中，还针对任务设定了A，B，C三种优先级，在安排日程的时候可以按照优先级进行排序。为任务设定优先级是通过 **快捷键 S-UP/DOWN。**

七、任务的时间计划

Org-mode中的任务还可以设置计划时间（SCHEDULED）和截止时间（DEADLINE），方便任务的管理和排程。

1、时间戳

在Org-mode中，将带有日期和时间信息的特定格式的字符串称为时间戳。时间戳使用”< >“进行标记，比如：

<2005-10-01 Tue> 

<2003-09-16 Tue 09:39> 

<2003-09-16 Tue 12:00-12:30>

**时间戳分为两种，上面的例子中的时间戳都标记了一个”时间点“，另外一种时间戳标记重复出现的多个时间点。 使用时间点+ 间隔（ 天（d）、周（w）、月（m）或者年（y））来表示。比如：**

**<2007-05-16 Wed 12:30 +1w>**

**表示从2007-05-16 12:30开始，每周重复一次。**

**时间戳可以放在标题或正文的任何部分。**

**输入时间戳时，可以手工输入符合格式的标记，也可以使用快捷键** **C-c .** **来创建。**

**如果要快速输入日期无需选择，可以直接用C-cC-c > 看日历。**

**如果仅仅想输入一个日期/时间，与任务没有任何关系，可以用C-c !。**

**S-left|S-right** **以天为单位调整时间戳时间** **S-up|S-down** **调整光标所在时间单位；如果光标在时间戳之外，调整时间戳类型（是否在日程表中 S-LEFT/标处理的时间戳改变一天。** **RIGHT S-UP/** **改变时间戳中光标下的项。光标可以处在年、月、日、时或者分之上。当时间戳包含一个时间段时，如 “15:30-16:30”，修改第一个时间，会自动同时修改第 DOWN 二个时间，以保持时间段长度不变。想修改时间段长度，可以修改第二个时间。**

**时间/日期段**

**两个时间戳用‘–’连接起来就定义了一个时间段：**

**<2004-08-23 Mon>--<2004-08-26 Thu>**

**连续使用****C-c .** **可以创建时间段。**

**C-c C-y** **计算时间段的间隔。**