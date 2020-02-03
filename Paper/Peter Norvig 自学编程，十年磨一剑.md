# Peter Norvig 自学编程，十年磨一剑

http://blog.jobbole.com/22905/

**黄小非译注：**本文作者Peter Norvig目前任职于Google，其职位是研究主管（Director of Research). Peter Norvig是享誉世界的计算机科学家和人工智能专家。他是 [AAAI](http://www.aaai.org/) 和 [ACM](http://acm.org/) 的会员，是业界内经典书籍《[*Artificial Intelligence: A Modern Approach*](http://www.cs.berkeley.edu/~russell/aima.html) *|* [人工智能：一种现代方法](http://www.amazon.cn/gp/product/B005CT25NY/ref=as_li_qf_sp_asin_il_tl?ie=UTF8&tag=vastwork-23&linkCode=as2&camp=536&creative=3200&creativeASIN=B005CT25NY)》的作者之一。在加入Google之前，他曾经是NASA(美国航空航天局）计算科学部门的主要负责人，并在南加州大学以及伯克利大学任教。以下为译文。

**你们着什么急？**

随意步入一家书店，满目都是《7天搞定Java编程》这种速成书目，同样的书籍还包括Visual Basic、Window系统、Internet互联网等等，它们都承诺在几天，甚至几小时之内就让你能够学会相关技术。我在亚马逊网站上做了如下的条件检索：

[pubdate: after 1992 and title: days and](http://www.amazon.com/exec/obidos/search-handle-url/ix=books&rank=%2Bfeaturedrank&fqp=powerpubdate%3A after 1992 and title%3A days and (title%3A learn or title%3A teach yourself)&sz=25&pg=1/ref=s_b_np)

[(title: learn or title: teach yourself)](http://www.amazon.com/exec/obidos/search-handle-url/ix=books&rank=%2Bfeaturedrank&fqp=powerpubdate%3A after 1992 and title%3A days and (title%3A learn or title%3A teach yourself)&sz=25&pg=1/ref=s_b_np)

出版日期：1992年以后，题目关键字：“天”，“学会”或者“自学”

然后得到了248条搜索结果。头78条都是计算机类书籍（第79条记录是《30天学会孟加拉语》）。我将“天”关键字换成了“小时”，不出意外地搜索到了253条记录，其中头77条记录是计算机书籍，第78条的搜索记录是《24小时语法和样式自学手册》。在总共搜索到的头200条记录中，有96%是计算机书籍。

从上面的搜索结果可以看出来，要么就是人们对计算机技术的学习如饥似渴，要么就是计算机技术实在太简单，不费吹灰之力就能学会。相比于计算机技术书籍的如此“速成”，在其他领域的书籍里，你却很难找到诸如：“三天学会贝多芬”，或者“五天搞定量子力学”，这种速成教材，甚至连《狗狗喂养手册》这种宠物指南，都鲜有“几天搞定”的说法。Felleisen *et al.*在他们的著作《如何设计程序》一书中明确指出了这种“速成”的趋势，并评论到：“垃圾的编程技术当然非常容易，傻子都能在21天之内学会，哪怕他天生就是个白痴。”

让我们来仔细看看《[3天学会C++](http://www.amazon.com/Learn-C-Three-Days-Rachele/dp/1556227078?tag=job0ae-20)》这种速成教材实际上意味着什么：

**●学会：**在3天时间里你几乎没有时间去写任何有意义的程序，就更不要谈什么从编程中获得经验和教训这种事情了。你也不可能有时间和有经验的程序员一起工作和交流，也不会体验到在真正的C++环境下工作是什么感觉。长话短说吧，你就是没时间，也学不到什么。所以这种书籍最多也就让你有个粗浅的印象，但是绝对不可能有深入的理解。就像亚历山大教皇说的那样，“浅尝辄止是很危险的”。

**●C++:** 如果你有其他编程语言的基础，那**么**3天之内你也许可以学到C++的一些语法，但即使是这样，你还是无法了解如何使用该语言编程。简言之，如果你之前是一个Basic程序员，那么经过3天的学习，你会成为一个“能使用C++语法编写Basic风格程序的程序员”，不过这样是没法发挥出C++语言本身的优势的（说句不好听的，你连怎么犯C++的典型错误都不会）。仅仅知道一点语法意味着什么呢？Allan Perlis曾经说过：“一个无法改变你思维方式的编程语言是不值得学习的。”；另一种可能性是，你可以只学一点点C++知识(类似的，或者一点点JavaScript,或者一点点Flex Script)，然后就可以利用现有的工具制作应用接口，完成特定的编程任务了。但是这样的行为并不意味着你“会”编程了，你只是会使用这个工具完成任务而已。

**●3天：**很不幸，3天是远远不够的，往下看你就知道了。

 

![img](http://jbcdn2.b0.upaiyun.com/2012/08/peter-norvig.jpg)

*Peter Norvig*

 

研究人员([Bloom (1985)](http://www.amazon.com/exec/obidos/ASIN/034531509X/?tag=job0ae-20)、 Bryan & Harter (1899，见文后参考书目)、[Hayes (1989)](http://www.amazon.com/exec/obidos/ASIN/0805803092?tag=job0ae-20)、Simmon & Chase (1973，见文后参考书目) 的一系列调查研究显示，在各个领域内，要想获得专业级别的水平，大约需要10年时间的努力。参与此项调查的领域包括：国际象棋，作曲，发报，绘画，钢琴演奏，游泳，网球等。科学家们从神经心理学和拓扑学的角度对这些领域进行研究，并得出结论。若要在某一领域内达到专家级的水平，其关键在于“审慎地重复”，也就是说，并非是机械地，一遍又一遍地练习，而是要不断地挑战自我，试图超越自身当前的水平，通过不断的尝试挑战，并在尝试的过程中和尝试之后对自身的表现进行分析和总结，吸取经验，纠正之前犯过的各种错误。把这一“审慎”的过程不断重复，才能取得成功。

所谓的“捷径”是不存在的，即使对于莫扎特这种天才来说，也没有捷径可走，尽管4岁就开始作曲，可是他也花了13年的时间，才真正地写出了世界级的作品。再举一个例子，甲壳虫乐队（The Beatles）,他们似乎在1964年凭借一系列热门单曲和其在艾德沙利文秀（The Ed Sullivan show）上的演出一炮而红，但是你也许不知道，他们早在1957年就在利物浦和汉堡两地进行小规模演出了，而在此之前的非正式演出更是不计其数。甲壳虫乐队的主要成名曲《*Sgt. Peppers*》，则是1967年才发行的。[Malcolm Gladwell](http://www.amazon.com/Outliers-Story-Success-Malcolm-Gladwell/dp/0316017922?tag=job0ae-20)公布了他对柏林音乐学院所作的一项研究的报告，该研究对比了一个班里的学习成绩为上、中下三个档次的学生，并逐一询问他们进行音乐练习的时间

这三个档次中的所有人，大约都是在5岁的时候开始练习音乐的，一开始的时候大家练习音乐的时间都差不多，大约一周2到3小时。但是到了八岁左右，大家的区别就开始体现了。后来成为班里最好的那一部分学生开始比别的学生练习得更多，大概每周6到9小时，12岁的时候每周8小时，14岁的时候每周16小时，往后则越来越多，直到20岁左右，他们每周练习音乐的时间已经超过30小时了。在20岁的年纪，那些精英级别的演奏家们都有累计超过10000小时的音乐练习时间。相比之下，仅有部分优等生能达到8000小时的累计练习时间，而那些音乐教师级别的学生，他们的累计练习时间只有4000小时左右。

所以，也许这个让你能达到专业等级的神奇时间应该是10000小时，而不是10年。（Henri Cartier-Bresson (1908-2004)说过，“（作为摄影师），你所拍摄的头10000张照片都是垃圾”，但即使是垃圾作品，他拍一张照片也要花接近一小时。）Samuel Johnson (1709-1784)认为这个时间应该更长：“在任何一个领域要想做到极好,势必穷尽一生的精力，否则根本无法企及。” Chaucer (1340-1400)也发出过“生命如此短暂，技能如此高深”的感叹。Hippocrates (c. 400BC)因写下了如下的句子而被人称颂：“ars longa, vita brevis”，该句是来自于一个更长的引用：”Ars longa, vita brevis, occasio praeceps, experimentum periculosum, iudicium difficile”, 这段话翻译成英语就是：“生命很短暂，但是技艺却很高深，机遇转瞬即逝，探索难以捉摸，抉择困难重重”。这段话是用拉丁文写的。在拉丁文里，ars可以翻译为“技艺”或者“艺术”，但是在古希腊文里，ars只能做“技能”的意思，而没有“艺术”的意思。

 

**你想当程序员么？**

下面是我列举的程序员成功“食谱”

**●沉醉**于编程，编程是为了兴趣。保持这种充满兴趣的感觉，以便于你能将其投入到你的10年/10000小时的编程时间中。

**●程序**. 最好的学习方式是“[在实践中学习](http://www.engines4ed.org/hyperbook/nodes/NODE-120-pg.html)”。更技术一些地说：“一个人在某个专业领域方面能够达到最高水平，并不是因为这个人经验增长了以后而自动获得的，而是这个人为了进步所做出了专门的努力之后产生的结果。”[(p. 366)](http://www2.umassd.edu/swpi/DesignInCS/expertise.html)“最有效的学习包括如下几个要素：明确并且难度适当的任务，适应学习者个人情况，及时的信息反馈，有重新开始和改正错误的机会）(p. 20-21) 《[*Cognition in Practice: Mind, Mathematics, and Culture in Everyday Life*](http://www.amazon.com/Cognition-Practice-Mathematics-Culture-Everyday/dp/0521357349?tag=job0ae-20)》这本书提供了上述有趣的观点

**●**同其他程序员**交流**，多阅读其他人写的程序。这些远比你看书或者上培训班重要

**●**如果你愿意的话，就选择去读一个计算机科学专业吧（当然你还可以去念这个专业的研究生）。如果你能做到这点，那么你就有机会找到一些需要计算机学位认证的工作，也会让你对这个行业有更深的理解。不过，如果你不是上学的料，那么你可以（当然需要有足够的毅力）靠自己学习，或者通过工作来积累经验。无论你采用哪种途径，光依靠书本是远远不够的。“如果说仅仅靠学习油画和调色技术无法创造出顶尖的画家的话，那么光学习计算机科学课程更不能造就顶尖的程序员。”，Eric Raymond这样说过，他著有《新黑客字典》一书。我所聘用过的最好的程序员仅仅只有高中文凭; 他写了很多伟大的软件，他有他自己的新闻组，并且通过股权赚够了钱，还开了家属于自己的夜店。（作者说的这个人是Jamie Zawinski，他是网景浏览器（Netscape）的早期开发这者之一，也是开源项目Mozilla和[XEmacs](http://en.wikipedia.org/wiki/XEmacs)的主要贡献者，他开了一家叫做DNA_lounge的夜店，位于旧金山的SoMa区——译者注）

**●**与其他程序员一起**做项目**。在某些项目中要尽量做到最好，在某些项目中却别做那么好。当你是最好的时候，你的领导能力就会得到锻炼，并激发你高瞻远瞩的视野。当你做得不好的时候，你就能知道你的领导怎么做事，以及他们不喜欢哪些事（因为领导总是把那些他们不爱做的杂事丢给他们认为不得力的人去做）

**●**尝试**跟随**其他程序员一起做项目。尝试去理解其他人所写的代码。看看如果你无法找到代码的作者本人的情况下，理解和修正他写的代码需要花费什么样的代价。同时也思考，如何规划你自己的程序代码，让它们更容易被其他人理解和维护。

**●**至少学习半打**编程语言**。包括一种支持类抽象的语言（例如Java或者C++），一种支持函数抽象的语言（例如Lisp或者ML）,一种支持语法抽象的语言（例如Lisp）,一种支持声明式编程的语言（例如Prolog或者C++模板），一种支持协同程序的语言（例如Icon或者Scheme）,一种支持平行并发编程的语言（例如Sial）

**●**牢记“计算机科学”中包含着“**计算机**”这个词。了解计算机需要花多长的时间执行一条指令，花多长时间从内存中获取一个字(word)（包括缓存命中和不命中两种情况），如果连续从磁盘中获取数据，时间消耗如何？以及需要花多少时间才能再磁盘上定位一个新的位置？

**●**尽量参与语言的**标准化**过程。往大了说，你可以试着加入ANSI C++委员会这样的专业组织，往小了讲，你也可以从自己的代码规范入手，限定代码缩进是需要2个空格宽还是4个空格宽。无论采用哪种方式，你都需要了解其他人对于语言的喜好，以及他们的喜好的程度，甚至你要知道他们为什么产生这样的喜好的原因。

**●**有良好的意识，能尽快适应语言标准化的成果。

要掌握上面所说的所有内容，光靠看书学习应该是很难做到的。当我的第一个孩子出生的时候，我几乎阅读了市面上所有的《如何…》指南书籍，但是我读完了以后还是觉得自己是个菜鸟。30个月以后，我的第二个孩子快出生时，我难道还要做一个书虫么？不！相反，我此时更依赖我的个人经验，这些经验相比于那些上千页的书籍，则更加有效和让我放心。

Fred Brooks所著的著名的论文《[*No Silver Bullets*](http://www.amazon.com/gp/product/6132871675/ref=as_li_qf_sp_asin_il_tl?ie=UTF8&tag=job0ae-20&linkCode=as2&camp=1789&creative=9325&creativeASIN=6132871675)*|* 没有银弹》里向我们揭示了发现和培养软件设计人才的三步骤：

1.有组织地辨认顶尖的软件设计人才，越早越好

2.安排一个职业导师，为其职业前景指点迷津，并谨慎对待自己的职业履历

3.为成长中的设计师们提供机会，让他们能够互相激发促进。

即使一部分人已经具备了成为优秀软件设计人员的潜质，也需要经历工作的慢慢琢磨，方可展现才华。[Alan Perlis](http://www-pu.informatik.uni-tuebingen.de/users/klaeren/epigrams.html)则说得更加直接：“任何人都可以被‘教’成一个雕塑匠，但米开朗基罗则被‘教’如何不要成为一个雕塑匠，因为他要做的是雕塑大师，。这个道理放到编程大师身上同样管用。”Perlis认为，伟大的软件开发人员都有一种内在的特质，这种特质往往比他们所接受的训练更重要。但是这些特质是从哪里来的呢？是与生俱来的？还是通过后天勤奋而来？正如Auguste Gusteau（动画电影《料理鼠王》里的幻象大厨）所说，“谁都能做饭，但只有那些无所畏惧的人才能成为大厨！”我很情愿地说，将你生命中的大部分时间花在审慎地练习和提高上，这很重要！但是“无所畏惧”的精神，才是将促使这些练习成果凝聚成形的途径。或者，就像是《料理鼠王》里那个与Gusteau作对的刻薄的美食评论家Anton Ego说的那样：“不是任何人都能成为伟大的艺术家，不过，伟大的艺术家在成名前可能是任何人。”

所以尽管去书店大买Java/Ruby/Javascript/PHP书籍吧；你也许会发现他们真的挺管用。但是这样做不会改变你的人生，也不会让你在整体经验上有什么提高。24小时，几天，几周，做一个真正的程序员？光靠读书可读不出来。你尝试过连续24个月不懈努力提高自己么？呵呵，如果你做到了，好吧，那么你开始上路了……

 

 

**参考书目**

Bloom, Benjamin (ed.) [*Developing Talent in Young People*](http://www.amazon.com/gp/product/034531509X/ref=as_li_qf_sp_asin_il_tl?ie=UTF8&tag=job0ae-20&linkCode=as2&camp=1789&creative=9325&creativeASIN=034531509X), Ballantine, 1985.

Brooks, Fred, [*No Silver Bullets*](http://www.amazon.com/gp/product/6132871675/ref=as_li_qf_sp_asin_il_tl?ie=UTF8&tag=job0ae-20&linkCode=as2&camp=1789&creative=9325&creativeASIN=6132871675), IEEE Computer, vol. 20, no. 4, 1987, p. 10-19.

Bryan, W.L. & Harter, N. “Studies on the telegraphic language: The acquisition of a hierarchy of habits. *Psychology Review*, 1899, 8, 345-375

Hayes, John R., The [Complete Problem Solver](http://www.amazon.com/gp/product/0805803092/ref=as_li_qf_sp_asin_il_tl?ie=UTF8&tag=job0ae-20&linkCode=as2&camp=1789&creative=9325&creativeASIN=0805803092) Lawrence Erlbaum, 1989.

Chase, William G. & Simon, Herbert A. [“Perception in Chess”](http://books.google.com/books?id=dYPSHAAACAAJ&dq="perception+in+chess"+simon&ei=z4PyR5iIAZnmtQPbyLyuDQ) *Cognitive Psychology*, 1973, 4, 55-81.

Lave, Jean, [*Cognition in Practice: Mind, Mathematics, and Culture in Everyday Life*](http://www.amazon.com/gp/product/0521357349/ref=as_li_qf_sp_asin_il_tl?ie=UTF8&tag=job0ae-20&linkCode=as2&camp=1789&creative=9325&creativeASIN=0521357349), Cambridge University Press, 1988.

 

**问答**

典型PC系统各种操作指令的大概时间

| execute typical instruction执行基本指令                      | 1/1,000,000,000 sec = 1 nanosec        |
| ------------------------------------------------------------ | -------------------------------------- |
| fetch from L1 cache memory从一级缓存中读取数据               | 0.5 nanosec                            |
| branch misprediction分支误预测                               | 5 nanosec                              |
| fetch from L2 cache memory从二级缓存获取数据                 | 7 nanosec                              |
| Mutex lock/unlock互斥加锁/解锁                               | 25 nanosec                             |
| fetch from main memory从主内存获取数据                       | 100 nanosec                            |
| send 2K bytes over 1Gbps network通过1G bps 的网络发送2K字节  | 20,000 nanosec                         |
| read 1MB sequentially from memory从内存中顺序读取1MB数据     | 250,000 nanosec                        |
| fetch from new disk location (seek)从新的磁盘位置获取数据（随机读取） | 8,000,000 nanosec                      |
| read 1MB sequentially from disk从磁盘中顺序读取1MB数据       | 20,000,000 nanosec                     |
| send packet US to Europe and back从美国发送一个报文包到欧洲再返回 | 150 milliseconds = 150,000,000 nanosec |

 

**附录：如何选择语言**

很多人曾经问过我，他们应该选择什么编程语言作为入门之用？我想这个问题很难有一个确切的答案，但是下面几点可以用来作为选择的参考。

*●随大流*。当被问到“我应该使用什么系统呢？Windows, Unix还是Mac?”,我的回答通常是：“看你的朋友们用什么你就用什么。”这么做的好处是，有了你朋友的帮助，你就能有效地回避操作系统固有的一些差异，对于选择编程语言来说，也是同样道理。同时，你还要有点儿战略眼光：如果选择了一种编程语言，并成为其编程社区的一员，那么你选择的语言和社区是正在不断壮大？还是奄奄一息？如果你有编程方面的问题，能不能从相关的书籍，网站以及在线论坛中得到解答？你是不是跟论坛里的人合得来？这些都是要考虑的。

*●简单实用*。诸如C++以及Java这样的编程语言都是非常专业的开发语言，适用于有经验的大型团队进行开发，需要时常考虑代码的运行效率。所以，这类的编程语言就适合于那样（复杂）的编程环境。如果你是一个初学者，那么就不要搞那么复杂。你所需要的是一种简单易学的编程语言，你靠你自己就可以搞定的语言。

*●交互。*给你两种选择去学钢琴：第一种，常规做法，也是互动的做法，也就是你每敲一下琴键就能听到琴音；第二种，批量模式，等你把所有该按的琴键都按了一遍，然后再一次性放给你听。你选择哪一个呢？显然，交互式的方式对于钢琴学习来说更容易，对于编程学习也是如此。那么就坚持使用交互式模式学习编程吧。

基于上述的观点，我所推荐的编程入门语言应该是Phyton或者Scheme.但是读者自身的环境是非常复杂多变的，所以你们也许会其他更好的选择。如果你的年龄还不到两位数，那么你们应该考虑Alice语言或者Squeak语言（很多成年的初学者也认为他们很有趣）。当然，做出选择并开始行动，这个最重要。

 

**附录：书籍和其他资源**

**●****Scheme：**《[Structure and Interpretation of Computer Programs (Abelson & Sussman)](http://www.amazon.com/gp/product/0070004846/ref=as_li_qf_sp_asin_il_tl?ie=UTF8&tag=job0ae-20&linkCode=as2&camp=1789&creative=9325&creativeASIN=0070004846) | [计算机程序的构造和解释](http://www.amazon.cn/dp/B0011AP7RY/?tag=vastwork-23)》 这本书或许是计算机科学最好的入门书籍，本书从计算机科学的角度入手，教你如何进行编程。你可以在[online videos of lectures](http://www.swiss.ai.mit.edu/classes/6.001/abelson-sussman-lectures/)观看本书的在线视频教程，以及[complete text online](http://mitpress.mit.edu/sicp/full-text/book/book.html)的在线文字版。 学习本书是需要一些挑战的，相信该书会让一部分人望而却步的。

**●****Scheme：**《[How to Design Programs (Felleisen *et al.*)](http://www.amazon.com/gp/product/0262062186?tag=job0ae-20) | [程序设计方法](http://www.amazon.cn/程序设计方法-傅雷森/dp/B0011AIAX2?tag=vastwork-23)》是一本好书，该书介绍了如何用优雅并且有效的方式进行程序设

**●****Python:** [Python Programming: An Intro to CS (Zelle)](http://www.amazon.com/gp/product/1887902996?tag=job0ae-20) 是一本介绍Python的好书

**●****Python:** [Python.org](http://python.org/)官方网站上提供了一些在线教程 [tutorials](http://wiki.python.org/moin/BeginnersGuide).

**●****Oz**: [Concepts, Techniques, and Models of Computer Programming (Van Roy & Haridi)](http://www.amazon.com/gp/product/0262220695) 被看做是Abelson & Sussman（经典计算机教程《[计算机程序的构造和解释](http://www.amazon.cn/dp/B0011AP7RY/?tag=vastwork-23)》的作者——译者注）的当代传承者。该书绘制了一幅关于计算机编程的宏观蓝图，它囊括了比Abelson & Sussman的经典教材更广泛的知识领域，也更加通俗易懂。此书中使用了一种编程语言，Oz, 这种语言在工业领域内几乎不被使用，其主要目的就是针对于教学

 

**备注**

T. Capey指出，Amazon网页上那个[Complete Problem Solver](http://www.amazon.com/gp/product/0805803092/ref=as_li_qf_sp_asin_il_tl?ie=UTF8&tag=job0ae-20&linkCode=as2&camp=1789&creative=9325&creativeASIN=0805803092)页面把《21天搞定孟加拉语》以及《21天学会语法》这两本书移到了“购买此书的用户还购买过这些产品”这个区域内。我估计大部分人就是从这个区域看到这本书的。感谢Ross Cohen的帮助。