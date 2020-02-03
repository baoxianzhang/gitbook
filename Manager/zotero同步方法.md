# zotero同步方法

** 使用类似链接的方式 **

推荐理由： 

1、 Zoreto的自动抓取pdf中的作者、期刊和卷期等的功能非常好用！ 

2、 Mendeley的该功能基本失效， 

3、 Zoreto可以作为非常好的知识管理软件使用。 

4、如果搭配Docear这一思维导图方式的文献管理软件对阅读的文献进行整理，加上两个软件都是开源的免费软件，个人觉得相当完美。二者的配合使用详见：[http://blog.sina.com.cn/s/blog_6daf1c5b0100z8nn.html](https://www.douban.com/link2/?url=http%3A%2F%2Fblog.sina.com.cn%2Fs%2Fblog_6daf1c5b0100z8nn.html) 

使用中的困难： 

Zotero的云同步功能可以同步笔记和文献pdf等到云端，从而解决了异地、异机、异设备终端的办公问题。该功能非常好，但Zotero只提供100 M的免费空间，该空间显然不够文献的存储使用，给Zotero的云同步功能带来较大困难（可以通过购买增大空间，但其实是有变通方法的）。为了能免费的使用Zotero的同步功能，有高手设置了这样的解决方案。 

Zotero的数据文件可以分为两个部分，一个是存放便签、笔记等的数据文件，一个是存放原始pdf文献文件的附件，后者存放在Storage文件夹里。文献多时，Storage的体积会变得很大。高手的解决方案是，将Zotero同步文件夹下的storage文件夹变成一个超链接，链接到另一个真实存放pdf文献资料的文件夹。这样，Zotero同步文件夹下的Storage文件夹就成了一个链接，从而同步到云上的数据大大减小。同时，Zotero中的笔记等又可以通过该超链接链接到真实的存放文献资料的地方。而真实存放资料的地方，可以通过百度云、金山快盘等云端进行实时更新。但经过比较，个人选择了使用Dropbox，因此我尝试了一下几个的更新速度，Dropbox云端的更新速度是最快的，最快时曾经达到震惊的800 KB/s。 

举例来说，我的Zoreto安装在了C盘的program file中，数据文件存放在 

C:\Users\用户名\AppData\Roaming\Zotero\Zotero\Profiles\******.default\zotero\中，内含如下文件，其中storage是存放文献pdf的文件夹：

![img](C:\Users\leo\AppData\Local\YNote\data\qq4763A76B0ADC4CD71E27518DEA45D823\5f2619ba90c44fb69b7387c266a31427\p8762069.jpeg)

我在D盘下新建一个叫做dropbox的文件夹用于存放storage中的内容，同时，该dropbox种的文件将被dropbox实时更新到云端。 

按照上述方法，需要将C盘下的storage变成类似快捷方式的链接，该链接指向D盘上的dropbox文件夹里的需要实时更新到dropbox云端的文件。 

具体做法是（针对Win7系统，XP系统的做法请参看后面附的参考资料）： 

1、 将C盘C:\Users\用户名\AppData\Roaming\Zotero\Zotero\Profiles\******.default\zotero\中的storage文件夹“剪切”（剪切前请先备份storage文件夹）到D:\dropbox\dropbox中 

2、 在C盘Windows文件夹查找cmd.exe文件，右键“以管理员身份运行”，之后输入下述命令（中间均用空格分开）： 

Mklink /j C:\Users\Mec\AppData\Roaming\Zotero\Zotero\Profiles\ejs4k27r.default\zotero\storage D:\dropbox\dropbox\storage 

如果没有按照上述步骤进行，可能出现错误，出现错误时，请参看[http://hi.baidu.com/zqjiang/item/66fd380b95c41018ebfe38c2](https://www.douban.com/link2/?url=http%3A%2F%2Fhi.baidu.com%2Fzqjiang%2Fitem%2F66fd380b95c41018ebfe38c2) 

或google搜索mklink命令，即可找到答案。 

如果按照上述过程进行的操作，但仍然存在问题，请参看以下链接： 

落寞飞花 孤舟钓雪的博客内容链接 

[http://blog.sina.com.cn/s/blog_6daf1c5b0100z8nn.html](https://www.douban.com/link2/?url=http%3A%2F%2Fblog.sina.com.cn%2Fs%2Fblog_6daf1c5b0100z8nn.html) 

KeepThinking…的博客内容链接[http://blog.sina.com.cn/s/blog_565e747c01014toj.html](https://www.douban.com/link2/?url=http%3A%2F%2Fblog.sina.com.cn%2Fs%2Fblog_565e747c01014toj.html) 

解决上述问题过程中，得到了上述两位高手和qq群“Zotero和Mendeley讨论”，群号为10794804中ph的大力帮助，以及很多有分享精神的朋友通过帖子等分享的帮助，在此表示感谢！ 

最后介绍一点关于云盘的选用。我比较了百度盘和dropbox的上传速度和界面，觉得dropbox的界面极其精简，富有美感，而且上传速度快，但空间只有2G（其实2G足够大多数人使用了。另外，dropbox可以通过邀请好友的方式将空间增加到16G，被邀请人同时增加500 M空间）。百度云盘空间很大，有2T，但上传过程中出现了错误，而且上传速度相对较慢。最后，大多数做分享Zotero的人都说自己用的是dropbox，因此，我最后选择了dropbox。如前面所说，初始空间只有2G，因此，如果看到本帖的朋友选择使用Zotero和Dropbox，请顺手帮我一下，通过后面给出的链接注册，帮我增加点空间，同时也给自己增加500 M空间，谢谢！！链接网址是https://db.tt/VPDwh2FIdt

\2. 使用坚果云的webDav功能

http://help.jianguoyun.com/?p=2538

[https://griddiary.uservoice.com/knowledgebase/articles/478287-%E5%9D%9A%E6%9E%9C%E4%BA%91-webdav-%E8%AE%BE%E7%BD%AE%E6%95%99%E7%A8%8B](https://griddiary.uservoice.com/knowledgebase/articles/478287-坚果云-webdav-设置教程)

中间会出

last sync id 

这个后面在下面看到可能是

http://help.jianguoyun.com/?p=2917

**dav.jianguoyun.com/dav/mySync**

**同理，需要把坚果云的对应的同步文件夹作为实际的storge的软链接, 如**

**ln -s ~/Nut/mySync/zotero storage**

**/home/zhangbaoxian/.zotero/zotero/qspihv05.default/zotero/storage**