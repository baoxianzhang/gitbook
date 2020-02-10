# cpu设置performance模式

Ubuntu 下cpu默认在powersave模式下工作，主频较低，可以通过修改为performance提高性能。

1. sudo apt install cpufrequtils

2. sudo vim /etc/init.d/cpufrequtils

3. 找到 GOVERNOR="xxxx" 改成 GOVERNOR="performance" 保存退出

4. sudo /etc/init.d/cpufrequtils restart

5. cpufreq-info 可以看到当前cpu主频提高
