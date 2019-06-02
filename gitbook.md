# GitBook入门

## 简明教程
### 安装Node.js
https://nodejs.org/en/ 并检验是否安装成功。
``` sh
$ node -v 
```
### 安装GitBook
``` sh
npm install gitbook-cli -g
```
``` sh
$ gitbook -V
CLI version: 2.3.2
GitBook version: 3.2.3
```
### 初始化GitBook
在写书的目录中输入下面命令
``` sh
$ gitbook init
warn: no summary file in this book
info: create README.md
info: create SUMMARY.md
info: initialization is finished
```
其中SUMMARY.md就是书的章节。
### 本地查看
接下来，我们输入 
```
$ gitbook serve 
命令，然后在浏览器地址栏中输入 http://localhost:4000 便可预览书籍。

运行该命令后会在书籍的文件夹中生成一个 _book 文件夹, 里面的内容即为生成的 html 文件，我们可以使用下面命令来生成网页而不开启服务器。
``` sh
gitbook build
```

### 相关说明
+ book.json

 该文件主要用来存放配置信息。
 
+ 分割
我们通过使用 标题 或者 水平分割线 将 GitBook 分为几个不同的部分。

``` md
## 标题

水平分割线
---
```
+ 插件
GitBook 有 [插件官网](https://docs.gitbook.com/v2-changes/important-differences)，  默认带有 5 个插件，highlight、search、sharing、font-settings、livereload，如果要去除自带的插件， 可以在插件名称前面加 -
```
"plugins": [
    "-search"
]
```

如果要配置使用的插件可以在 book.json 文件中加入即可，比如我们添加 plugin-github，我们在 book.json 中加入配置如下即可：
```
{
    "plugins": [ "github" ],
    "pluginsConfig": {
        "github": {
            "url": "https://github.com/your/repo"
        }
    }
}
```
然后在终端输入 ** gitbook install ./  ** 即可。

如果要指定插件的版本可以使用 plugin@0.3.1，因为一些插件可能不会随着 GitBook 版本的升级而升级。

+ 输出
你还可以生成 PDF 格式的电子书：
```
gitbook pdf ./ ./mybook.pdf
```

生成 epub 格式的电子书：
```
gitbook epub ./ ./mybook.epub
```

生成 mobi 格式的电子书：
```
gitbook mobi ./ ./mybook.mobi
```

如果生成不了，你可能还需要安装一些工具，比如 ebook-convert。或者在 Typora 中安装 Pandoc 进行导出。
## 参考链接
+ [GitBook简明教程](http://www.chengweiyang.cn/gitbook/index.html )
  
+ [GitBook使用教程](  https://www.jianshu.com/p/421cc442f06c)

+ [GitBook 详细配图](  https://blog.csdn.net/hk2291976/article/details/51173850)
+ [GitBook从懵逼到入门]( https://blog.csdn.net/lu_embedded/article/details/81100704)
