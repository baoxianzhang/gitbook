# 我推荐的一些C\C++书籍

http://blog.jobbole.com/61308/

我推荐的一些C\C++书籍

2015/09/01 · [C/C++](http://blog.jobbole.com/category/c-cpp/), [书籍与教程](http://blog.jobbole.com/category/books/) · [10 评论 ](http://blog.jobbole.com/61308/#article-comment)· [C语言](http://blog.jobbole.com/tag/c/), [入门书籍](http://blog.jobbole.com/tag/入门书籍/)

分享到：**110**

- [**Pscc全面技能培训**](http://www.imooc.com/view/716?from=jobboleblog)
- [**JSON快速入门（Java版）**](http://www.imooc.com/view/523?from=jobboleblog)
- [**2小时搞定移动直播 App 开发**](http://www.imooc.com/view/707?from=jobboleblog)
- [**进击Node.js基础（一）**](http://www.imooc.com/view/348?from=jobboleblog)

本文由 [伯乐在线](http://blog.jobbole.com/) - [周昌鸿](http://www.jobbole.com/members/zzzworm) 翻译。未经许可，禁止转载！

英文出处：[bert hubert](http://bert-hubert.blogspot.jp/2014/02/the-cprogramming-books-i-recommend.html)。欢迎加入[翻译组](http://group.jobbole.com/category/feedback/trans-team/)。

人们常常问我有什么C++和编程的书籍推荐，也许是因为我在PowerDNS有一个关于“编写可读性良好的C++代码”的演讲。这篇博文可以作为我对上述问题的一个回答，同时也包含了一些更广泛的笔记编程。如果你有任何补充或喜欢的书籍但是我没有提到，请给留言提示，我打算一有新书就更新这个页面。

第一个注意项：如果你打算学习C++，请务必学习最新版的C++ 2011。这个版本的C++移除了许多由C++强大带来的一些痛苦之处。另外，也不用担心C++ 2014的书籍，大多数编译器已经开始支持它了。

**学习编程**

学习编程包含以下几个重要方面：

- 了解语言的语法
- 知道那些特性可以使用和何时使用
- 写出可读性好的代码

- - 编译器可以理解，但是下一个人是否可以阅读呢？

- 在一个更高层次设计结构良好的程序

为了学习一门语言，通常我们可以找到叫《X语言编程》的书。这也形成了一个潜规则：当你创建一门严肃的语言的时候，你需要编写这样一本书。学习语言有点像学习作文，但这并不意味着你能够突然变成一个著名散文作家！

对于C++，这里有两本相关的书：

- 《C程序设计语言》 (Brian W. Kernighan, Denis M. Ritchie, TCPL)。这本书不是关于C++的，不过所有与C有关的东西都和C++有关。例如，这本书附带的例子都可以看作C++的例子，只是不是真正的C，因为C++比C的编译器要求更加严格。但是大部分编写良好的C程序都可以在C++下编译通过，TCPL是一本小书，并且被誉为X语言编程中最好的书籍。书中每一页都充满智慧。

- 《C++程序设计语言》（Bjarne Stroustrup），一本杰出的书，书中的每一页同样充满智慧。这本书有1400页。Verity Stob对这本书有热烈的[评论](http://www.theregister.co.uk/2013/06/17/verity_stob_is_bjarne_again/)。在TCPL中，我们读到的是“C不是一个大的语言，因此也不需要一本长篇大论的书来讲解”，但是讲解C++的书却有1400页。尽管这本书很难一页一页地读下去（不过，我几乎读过了书中的每一页），但是我建议每个人都拥一本。它讲解了C++中的每一个方面，并且讲解得非常不错。有这本书可以作为C++的参考，你的编程生涯会受益良多。

我需要声明一点，《[C程序设计语言](http://www.amazon.cn/gp/product/B0011425T8/ref=as_li_qf_sp_asin_il_tl?ie=UTF8&tag=vastwork-23&linkCode=as2&camp=536&creative=3200&creativeASIN=B0011425T8)》不是一本学习C++的入门书籍，这本书是用来指导你学习的，同时，《[C程序设计语言](http://www.amazon.cn/gp/product/B0011425T8/ref=as_li_qf_sp_asin_il_tl?ie=UTF8&tag=vastwork-23&linkCode=as2&camp=536&creative=3200&creativeASIN=B0011425T8)》也单独提取了《A Tour of C++ 》篇章。

C++不仅是一门语言，也是指一个函数库。在《[C++程序设计语言](http://www.amazon.cn/gp/product/B003EIKI0C/ref=as_li_qf_sp_asin_il_tl?ie=UTF8&camp=536&creative=3200&creativeASIN=B003EIKI0C&linkCode=as2&tag=vastwork-23)》中也讲解了C++标准库，为了全面了解C++标准库，我推荐：

- 《C++标准程序库:自修教程与参考手册》(Nikolai Josuttis)，和《[C++程序设计语言](http://www.amazon.cn/gp/product/B003EIKI0C/ref=as_li_qf_sp_asin_il_tl?ie=UTF8&camp=536&creative=3200&creativeASIN=B003EIKI0C&linkCode=as2&tag=vastwork-23)》一样，这也是一本大部头的书。但是这本书涵盖了C++标准库的每一个方面（同时，也被称作C++标准模版库），第二版中涵盖了C++2011标准。

如果你之前从事高级语言比如python，perl或者java，C和C++可能让人生畏。不像其他语言，C/C++非常接近硬件。这也有一个优点，可以充分利用硬件优势，但也让你需要面对现实细节。[Simon Tatham](http://www.chiark.greenend.org.uk/~sgtatham/) （作为Putty的开发者和编写《[缺失代码怪味](http://www.chiark.greenend.org.uk/~sgtatham/smell.html)》的作者而知名，虽然他现在使用C开发）写了一篇非常棒的文档：《[The Descent to C](http://www.chiark.greenend.org.uk/~sgtatham/cdescent/)》，这会降低你的学习难度，甚至经验丰富的C开发者也可能受益一二。

如果你读了上面三本书和链接，你已经可以熟练掌握C++了，并且善用C++标准库。不过，你还没有学习如何使用和何时适合使用C++的特性。C++作为一门强大的语言，有句话说：“使用C，[你犯错可能砸到自己的脚](http://www.stroustrup.com/bs_faq.html#really-say-that)，而使用C++，[你犯错可能导致你整条腿都废了](http://www.eng.uwaterloo.ca/~comp03a/misc/humour/shootfoot.html)“，这说的都是真的。

另外，C++强大之处在于你可以继续使用你之前语言的开发方式。“[我可以在任何语言中写编写FORTRAN代码](http://queue.acm.org/detail.cfm?id=1039535)”。不过这样不利于你成为一个更好的开发者。

**用好C++**

这里也有三本书，作者都是Scott Meyers，这将大大简化一个立志于C++开发的人的生活：

1. 《Effective C++ 》——列举了一些常见错误，有用的特性和编程中需要注意的事项。最近更新于2005年。
2. 《[More Effective C++](http://www.amazon.cn/gp/product/B004IP8BD6/ref=as_li_qf_sp_asin_il_tl?ie=UTF8&tag=vastwork-23&linkCode=as2&camp=536&creative=3200&creativeASIN=B004IP8BD6)》——和上面一样，不过讲述得更多一些，同样值得你去阅读。
3. 《Effective STL》——最后更新于2001年，和《Effective C++》一样，不过关注于C++标准库。

如果你只想读其中一本，选择《Effective C++》，如果你想选择两本，再选择《Effective STL》。

需要注意的是，Scott正在准备一本新的书，全面覆盖了新的C++2014标准（这可以看着是对C++2011标准的改进，并且当前大多数编译器已经支持了C++2014）。[一旦这本书出版](http://scottmeyers.blogspot.nl/2014/02/help-me-name-my-book.html)，你应当第一时间购入，本书的预览部分已经看起来相当棒了。

更新：许多读者都推荐了Stanley Lippman的《C++ Primer》，我不了解这本书，不过它更新了C++2011标准并且收到了很多赞誉，请告诉我你的观点。

**编写良好的代码**

下面提到的书都讨论了代码风格，如果编写代码，不过它们其实范围更广。指导你如何编写可读性好的代码的书有：

1. 《程序设计实践》，(Brian W. Kernighan, Rob Pike, TPoP)，这不是一本特定于C++的书，不过谈论了许多关于如何组织代码，何时优化代码，何时不做优化，如果调试和如何编写代码避免调试等等，我觉得每个开发组织都应该有这样一本书。
2. 《[Linux内核代码规范](https://www.kernel.org/doc/Documentation/CodingStyle)》(Linus Torvalds)，这也不是一本关于C++的书，但是在第4节“命名”，第六节“函数”和第八节“注释”中，我们都可以学习到许多。

每个想要提高其代码的程序员最好认真阅览《程序设计实践》的每一页。

**设计大规模的代码**

我只知道一本书讲述了这一点，我的一些思想形成也有赖于它。

- 《[Large-Scale C++ Software Design](http://www.amazon.cn/gp/product/0201633620/ref=as_li_qf_sp_asin_il_tl?ie=UTF8&camp=536&creative=3200&creativeASIN=0201633620&linkCode=as2&tag=vastwork-23) 》(John Lakos)，尽管本书有些年头，里面的一些建议用于指导当初为缺乏存储并且性能低下的机器开发程序的人们，从这本书我学习了如何将一个复杂系统拆解为多个有意义的模块。特别需要注意的是在循环中处理依赖代码。那些额外出现的细节，使得你的代码几乎不能测试，因为每个模块都非常依赖其他模块。

最后，祝学习C++的童鞋进步！

作者：嘉炜

链接：https://www.zhihu.com/question/20410487/answer/15055637

来源：知乎

著作权归作者所有，转载请联系作者获得授权。

大一学C++时的教材是Deitel的C++ How to Program第四版，后来看了C++ primer和Effective C++，C++ 标准程序库和C++ 编程思想都买了但还没开始看。

下面是转载的在博客上看到的一个C++书籍阅读清单，可以参考下：

**阶段 1**

**《Essential C++》**

这是一本内容不多但很实用的C++入门书籍，强调快速上手与理解C++编程。本书主要围绕一系列逐渐复杂的程序问题，以及用以解决这些问题的语言特性展开讲解。你不只学到C++的函数和结构，也会学习到它们的设计目的和基本原理。

**《C++ Primer》**

本书对C++基本概念、技术、以及现代C++编程风格进行了全面而且权威的阐述，是C++初学者的最佳指南；本书可以帮助你编写实用的程序，而无需首先精通每个语言细节。对于中高级程序员，本书也是不可或缺的参考书。

**阶段 2**

**《Effective C++》和《More effective C++》**

作者是Scott Meyers。你应该熟读它们，并清楚地理解每个项目。该书围绕55条准则，每一条都介绍了一个可让你写出更好的C++程序代码的方法，并以特别设计过的例子详加讨论。

**《Exceptional C++（C++编程剖析）》和《More exceptional C++》**

这两本书中都包含了40个C++编程问题，这些问题会让你磨练自己的技能，最终成为优秀的C++程序员。这些问题是Herb Sutter精心挑选，与ISO/ANSI C++官方标准相一致，帮助程序员在设计、架构和编码过程中保持良好的风格，从而使编写的C++软件更健壮、更高效。

**阶段 3**

**《Inside the C++ object model（深度探索C++对象模型）》**

本书专注于C++面向对象程序设计的底层机制，包括结构式语意、临时性对象的生成、封装、继承，以及虚拟——虚拟函数和虚拟继承，帮助你理解程序的底层实现，以便写出更高效的代码。

**《The design and evolution of C++（C++语言的设计与演化）》**

本书作者也是C++语言的设计者Bjarne Stroustrup，作者在书中综合性地介绍了C++的发展历史，C++中各种重要机制的本质意义和设计背景，这些机制的基本用途和使用方法，讨论了C++所适合的应用领域及其未来的发展前景，既没有忽略关键性的详情，又没有过多地陷入技术细节。

**阶段 4**

**《The C++ standard library（C++标准程序库）》**

这是标准模板库字典，你可以在本书中找到STL相关的一切知识。本书焦点放在标准模板库、检查容器、迭代器、函数对象和STL算法上。每一个元素都有深刻的呈现，包括其介绍、设计、运用实例、细节解说、陷阱、意想不到的危险，以及相关类别和函数等。

**《Effective STL》**

这是Scott Meyers的第三本C++专著，也是学习STL最权威的书籍。作者对书中的50个指导方针都作了详尽的分析，并配以示例。通过这些规则，C++开发者可以最大限度地使用STL。

**《Generic programming and the STL（泛型编程与STL）》**

本书阐述了泛型程序设计的核心理念：concepts（概念）、modeling（模型）和refinement（改善），并为你展示这些观念如何导出STL的基础概念：iterators（迭代器）、containers（容器）和function objects（函数对象）。按照本书所述，你可以把STL想象成一个由concepts组成的library，你将学习到STL正式结构并理解其强大的优势。

**阶段 5**

**《Exceptional C++ style》**

作者为Herb Sutter。本书同样提出了40个C++风格相关的问题，对一些至关重要的C++细节和相互关系提出了新的见解，为当今的关键C++编程技术（如泛型编程、STL、异常安全等）提供了新的策略，帮助开发者在开销与功能之间、优雅与可维护性之间、灵活性与过分灵活之间寻找完美的平衡点。

**《C++ template》**

这是一本关于C++模板的完整的参考手册和教程，它强调模板的使用实践，包含了现实世界中的例子。每个C++程序员都应该好好读一读这本书。

**《Modern C++ design（现代C++设计）》**

作者Andrei Alexandrescu为C++程序员打开了一个新的局面。本书提供了一些针对软件设计的前沿方法，如联合设计模式、泛型编程，使程序员可以编写有表现力的、灵活的、高度可重用的代码。

**《Thinking in C++（C++编程思想）》**

C++ 领域权威著作，介绍了C++实用的编程技术和最佳的实践方法。