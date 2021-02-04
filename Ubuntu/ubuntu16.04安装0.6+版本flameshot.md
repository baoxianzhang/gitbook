# ubuntu16.04安装0.6+版本的flameshot
## flameshot
flameshot是ubuntu下一个非常好用的截图工具。但是0.6及一下版本没有写入文字功能。而ubuntu16.04默认的配置是不能够安装0.6+版本的flameshot的。

## 主要问题
+ CMakeLists.txt中加入C++11
```
add_definitions(-std=c++11)
```
+ 有可能需要升级gcc，cmake版本
+ 升级Qt， 5.9版本以上
https://doc.qt.io/qt-5/qsystemtrayicon.html#showMessage-1
```
void QSystemTrayIcon::showMessage(const QString &title, const QString &message, const QIcon &icon, int millisecondsTimeoutHint = 10000)
This function overloads showMessage().

Shows a balloon message for the entry with the given title, message, and custom icon icon for the time specified in millisecondsTimeoutHint.

This function was introduced in Qt 5.9.
```

**升级指南：**    
https://www.kutu66.com/ubuntu/article_170121
+ 把/opt/qt511/lib加到LD_LIBRARY_PATH里面

+ 解决中文输入的问题
https://www.codenong.com/cs106739936/
```
把fcitx字库拷贝到对应的qt目录下：
/usr/lib/x86_64-linux-gnu/qt5/plugins/platforminputcontexts/libfcitxplatforminputcontextplugin.so
拷贝到
/opt/qt511//plugins/platforminputcontexts/

重新编译安装出现一下：
-- Installing: /usr/local/share/flameshot/translations/Internationalization_zh_CN.qm

```