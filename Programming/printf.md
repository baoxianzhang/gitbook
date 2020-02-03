# printf

http://blog.csdn.net/lz465350/article/details/43196235

http://blog.csdn.net/xue_changkong/article/details/41945215

1、printf("%.2d\n",2);和printf("%02d\n",2);以及printf("%.02d\n",2);的结果是一样的都是02，百分号后面的小数点或者0代表了数字前面要以0来占位；格式化字符串中的d前面的非零数字代表的是 **需要保留** 的**有效数字** 的位数，不够的位数 用0来填充。

2、printf("%2d\n",2);的结果却是 2，以空格代替了0

3、printf("%.2f\n",2.345);的结果是2.35，保留 **两位有效数字**，遵循 **四舍五入**。