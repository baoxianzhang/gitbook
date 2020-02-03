# QT_VERSION judge QT5 or QT4

https://stackoverflow.com/questions/24899558/how-to-check-qt-version-to-include-different-header

As @Tay2510 commented, QT_VERSION is declared inside of <QtGlobal>. As a result, you must type #include <QtGlobal> or another header that includes <QtGlobal>, before the version dependent [preprocessor directives](http://www.codingunit.com/cplusplus-tutorial-preprocessor-directives).

<QObject> and <QCoreApplication> may also be used to access QT_VERSION.

Here is an example of the code:

```C++
#include <QtGlobal>
#if QT_VERSION >= 0x050000
    #include <QApplication>
#else
    #include <QtGui/QApplication>
#endif
```



Remember that the qmake project should also handle version variations. [Here are changes that should be done when using the QT multimedia library](http://qt-project.org/doc/qt-5/changes.html):

The .pro file should look something like:

```C++
QT += core gui

greaterThan(4, QT_MAJOR_VERSION): QT += widgets multimedia
lessThan(5, QT_MAJOR_VERSION): CONFIG += mobility
lessThan(5, QT_MAJOR_VERSION): MOBILITY += multimedia
```

