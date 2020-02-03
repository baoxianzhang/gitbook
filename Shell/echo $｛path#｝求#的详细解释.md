# echo $｛path#｝求#的详细解释

${file#*/}：拿掉第一条 / 及其左边的字串：dir1/dir2/dir3/my.file.txt

${file##*/}：拿掉最後一条 / 及其左边的字串：my.file.txt

${file#*.}：拿掉第一个 . 及其左边的字串：file.txt

${file##*.}：拿掉最後一个 . 及其左边的字串：txt

\# 是去掉左边



13问摘出来的...

file=/dir1/dir2/dir3/my.file.txt

我們可以用 ${ } 分別替換獲得不同的值：

${file#*/}：拿掉第一條 / 及其左邊的字串：dir1/dir2/dir3/my.file.txt

${file##*/}：拿掉最後一條 / 及其左邊的字串：my.file.txt

${file#*.}：拿掉第一個 . 及其左邊的字串：file.txt

${file##*.}：拿掉最後一個 . 及其左邊的字串：txt

${file%/*}：拿掉最後條 / 及其右邊的字串：/dir1/dir2/dir3

${file%%/*}：拿掉第一條 / 及其右邊的字串：(空值)

${file%.*}：拿掉最後一個 . 及其右邊的字串：/dir1/dir2/dir3/my.file

${file%%.*}：拿掉第一個 . 及其右邊的字串：/dir1/dir2/dir3/my

\1. #前有空格shell才认为开始注释

\2. ${后面的"}"被注释了显然会报错吧?(我没测试, 应该会出问题了)



