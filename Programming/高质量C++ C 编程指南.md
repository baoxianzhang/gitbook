# 高质量C++ C 编程指南

uint8_t* _data;

初始化：

if (_data) {

​    delete[] _data;

}

_data = new uint8_t[size];

http://man.chinaunix.net/develop/c&c++/c/c.htm

 **4.3.4 指针变量与零值比较**

l     **【规则****4-3-4****】**应当将指针变量用“==”或“！=”与NULL比较。

  指针变量的零值是“空”（记为NULL）。尽管NULL的值与0相同，但是两者意义不同。假设指针变量的名字为p，它与零值比较的标准if语句如下：

​    if (p == NULL)  // p与NULL显式比较，强调p是指针变量

​    if (p != NULL)

不要写成

​    if (p == 0)  // 容易让人误解p是整型变量

​    if (p != 0)  

  或者

if (p)      // 容易让人误解p是布尔变量

  if (!p)      

**4.3.5 对if语句的补充说明**

有时候我们可能会看到 if (NULL == p) 这样古怪的格式。不是程序写错了，是程序员为了防止将 if (p == NULL) 误写成 if (p = NULL)，而有意把p和NULL颠倒。编译器认为 if (p = NULL) 是合法的，但是会指出 if (NULL = p)是错误的，因为NULL不能被赋值。

程序中有时会遇到if/else/return的组合，应该将如下不良风格的程序

  if (condition)

​    return x;

  return y;

改写为

  if (condition)

  {

​    return x;

  }

  else

  {

return y;

}

或者改写成更加简练的

return (condition ? x : y);

 

l     **【规则****6-1-3****】**如果参数是指针，且仅作输入用，则应在类型前加const，以防止该指针在函数体内被意外修改。

例如：

void StringCopy(char *strDestination，const char *strSource);

 

l     **【规则****6-1-4****】**如果输入参数以值传递的方式传递对象，则宜改用“const &”方式来传递，这样可以省去临时对象的构造和析构过程，从而提高效率。

**【规则****6-2-3****】**不要将正常值和错误标志混在一起返回。正常值用输出参数获得，而错误标志用return语句返回。

回顾上例，C标准库函数的设计者为什么要将getchar声明为令人迷糊的int类型呢？他会那么傻吗？

在正常情况下，getchar的确返回单个字符。但如果getchar碰到文件结束标志或发生读错误，它必须返回一个标志EOF。为了区别于正常的字符，只好将EOF定义为负数（通常为负1）。因此函数getchar就成了int类型。

我们在实际工作中，经常会碰到上述令人为难的问题。为了避免出现误解，我们应该将正常值和错误标志分开。即：正常值用输出参数获得，而错误标志用return语句返回。

函数getchar可以改写成 BOOL GetChar(char *c);

虽然gechar比GetChar灵活，例如 putchar(getchar()); 但是如果getchar用错了，它的灵活性又有什么用呢？

**【建议****6-2-1****】**有时候函数原本不需要返回值，但为了增加灵活性如支持链式表达，可以附加返回值。

例如字符串拷贝函数strcpy的原型：

char *strcpy(char *strDest，const char *strSrc);

strcpy函数将strSrc拷贝至输出参数strDest中，同时函数的返回值又是strDest。这样做并非多此一举，可以获得如下灵活性：

  char str[20];

  int length = strlen( strcpy(str, “Hello World”) );

**【建议****6-2-2****】**如果函数的返回值是一个对象，有些场合用“引用传递”替换“值传递”可以提高效率。而有些场合只能用“值传递”而不能用“引用传递”，否则会出错。

例如：

class String

{…

  // 赋值函数

  String & operate=(const String &other);  

// 相加函数，如果没有friend修饰则只许有一个右侧参数

friend  String  operate+( const String &s1, const String &s2);

private:

  char *m_data;

}

 

​    String的赋值函数operate = 的实现如下：

String & String::operate=(const String &other)

{

  if (this == &other)

​    return *this;

  delete m_data;

  m_data = new char[strlen(other.data)+1];

  strcpy(m_data, other.data);

  return *this;  // 返回的是 *this的引用，无需拷贝过程

}

 

对于赋值函数，应当用“引用传递”的方式返回String对象。如果用“值传递”的方式，虽然功能仍然正确，但由于return语句要把 *this拷贝到保存返回值的外部存储单元之中，增加了不必要的开销，降低了赋值函数的效率。例如：

 String a,b,c;

 …

 a = b;   // 如果用“值传递”，将产生一次 *this 拷贝

 a = b = c;  // 如果用“值传递”，将产生两次 *this 拷贝

 

​    String的相加函数operate + 的实现如下：

String operate+(const String &s1, const String &s2) 

{

  String temp;

  delete temp.data;  // temp.data是仅含‘\0’的字符串

​    temp.data = new char[strlen(s1.data) + strlen(s2.data) +1];

​    strcpy(temp.data, s1.data);

​    strcat(temp.data, s2.data);

​    return temp;

  }

 

对于相加函数，应当用“值传递”的方式返回String对象。如果改用“引用传递”，那么函数返回值是一个指向局部对象temp的“引用”。由于temp在函数结束时被自动销毁，将导致返回的“引用”无效。例如：

  c = a + b;

此时 a + b 并不返回期望值，c什么也得不到，流下了隐患。

l     **【规则****6-3-2****】**在函数体的“出口处”，对return语句的正确性和效率进行检查。

   如果函数有返回值，那么函数的“出口处”是return语句。我们不要轻视return语句。如果return语句写得不好，函数要么出错，要么效率低下。

注意事项如下：

（1）**return****语句不可返回指向“栈内存”的“指针”或者“引用”，因为该内存在函数体结束时被自动销毁。**例如

  char * Func(void)

  {

​    char str[] = “hello world”;  // str的内存位于栈上

​    …

​    return str;   // 将导致错误

  }

**（****2****）要搞清楚返回的究竟是“值”、“指针”还是“引用”。**

（3）如果函数返回值是一个对象，要考虑return语句的效率。例如  

​       return String(s1 + s2);

这是临时对象的语法，表示“创建一个临时对象并返回它”。不要以为它与“先创建一个局部对象temp并返回它的结果”是等价的，如

String temp(s1 + s2);

return temp;

实质不然，上述代码将发生三件事。首先，temp对象被创建，同时完成初始化；然后拷贝构造函数把temp拷贝到保存返回值的外部存储单元中；最后，temp在函数结束时被销毁（调用析构函数）。然而“创建一个临时对象并返回它”的过程是不同的，编译器直接把临时对象创建并初始化在外部存储单元中，省去了拷贝和析构的化费，提高了效率。

类似地，我们不要将 

return int(x + y); // 创建一个临时变量并返回它

写成

int temp = x + y;

return temp;

由于内部数据类型如int,float,double的变量不存在构造函数与析构函数，虽然该“临时变量的语法”不会提高多少效率，但是程序更加简洁易读。

**6.5** **使用断言**

程序一般分为Debug版本和Release版本，Debug版本用于内部调试，Release版本发行给用户使用。

断言assert是仅在Debug版本起作用的宏，它用于检查“不应该”发生的情况。示例6-5是一个内存复制函数。在运行过程中，如果assert的参数为假，那么程序就会中止（一般地还会出现提示对话，说明在什么地方引发了assert）。

 

void  *memcpy(void *pvTo, const void *pvFrom, size_t size){  assert((pvTo != NULL) && (pvFrom != NULL));   // 使用断言  byte *pbTo = (byte *) pvTo;  // 防止改变pvTo的地址  byte *pbFrom = (byte *) pvFrom; // 防止改变pvFrom的地址    while(size -- > 0 )  *pbTo ++ = *pbFrom ++ ;  return pvTo;}

示例6-5 复制不重叠的内存块

 

assert不是一个仓促拼凑起来的宏。为了不在程序的Debug版本和Release版本引起差别，assert不应该产生任何副作用。所以assert不是函数，而是宏。程序员可以把assert看成一个在任何系统状态下都可以安全使用的无害测试手段。**如果程序在****assert****处终止了，并不是说含有该****assert****的函数有错误，而是调用者出了差错，****assert****可以帮助我们找到发生错误的原因。**

很少有比跟踪到程序的断言，却不知道该断言的作用更让人沮丧的事了。你化了很多时间，不是为了排除错误，而只是为了弄清楚这个错误到底是什么。有的时候，程序员偶尔还会设计出有错误的断言。所以如果搞不清楚断言检查的是什么，就很难判断错误是出现在程序中，还是出现在断言中。幸运的是这个问题很好解决，只要加上清晰的注释即可。这本是显而易见的事情，可是很少有程序员这样做。这好比一个人在森林里，看到树上钉着一块“危险”的大牌子。但危险到底是什么？树要倒？有废井？有野兽？除非告诉人们“危险”是什么，否则这个警告牌难以起到积极有效的作用。难以理解的断言常常被程序员忽略，甚至被删除。[Maguire, p8-p30]

 

l     **【规则****6-5-1****】**使用断言捕捉不应该发生的非法情况。不要混淆非法情况与错误情况之间的区别，后者是必然存在的并且是一定要作出处理的。

l     **【规则****6-5-2****】在**函数的入口处，使用断言检查参数的有效性（合法性）。

l     **【建议****6-5-1****】**在编写函数时，要进行反复的考查，并且自问：“我打算做哪些假定？”一旦确定了的假定，就要使用断言对假定进行检查。

l     **【建议****6-5-2****】**一般教科书都鼓励程序员们进行防错设计，但要记住这种编程风格可能会隐瞒错误。当进行防错设计时，如果“不可能发生”的事情的确发生了，则要使用断言进行报警。

**6.6** **引用与指针的比较**

引用是C++中的概念，初学者容易把引用和指针混淆一起。一下程序中，n是m的一个引用（reference），m是被引用物（referent）。

  int m;

  int &n = m;

n相当于m的别名（绰号），对n的任何操作就是对m的操作。例如有人名叫王小毛，他的绰号是“三毛”。说“三毛”怎么怎么的，其实就是对王小毛说三道四。所以n既不是m的拷贝，也不是指向m的指针，其实n就是m它自己。

引用的一些规则如下：

**（1）引用被创建的同时必须被初始化（指针则可以在任何时候被初始化）。**

**（2）不能有NULL引用，引用必须与合法的存储单元关联（指针则可以是NULL）。**

**（3）一旦引用被初始化，就不能改变引用的关系（指针则可以随时改变所指的对象）。**

  以下示例程序中，k被初始化为i的引用。语句k = j并不能将k修改成为j的引用，只是把k的值改变成为6。由于k是i的引用，所以i的值也变成了6。

  int i = 5;

  int j = 6;

  int &k = i;

  k = j;  // k和i的值都变成了6;

  上面的程序看起来象在玩文字游戏，没有体现出引用的价值。引用的主要功能是传递函数的参数和返回值。C++语言中，函数的参数和返回值的传递方式有三种：值传递、指针传递和引用传递。

  以下是“值传递”的示例程序。由于Func1函数体内的x是外部变量n的一份拷贝，改变x的值不会影响n, 所以n的值仍然是0。

  void Func1(int x)

{

  x = x + 10;

}

…

int n = 0;

  Func1(n);

  cout << “n = ” << n << endl;  // n = 0

  

以下是“指针传递”的示例程序。由于Func2函数体内的x是指向外部变量n的指针，改变该指针的内容将导致n的值改变，所以n的值成为10。

  void Func2(int *x)

{

  (* x) = (* x) + 10;

}

…

int n = 0;

  Func2(&n);

  cout << “n = ” << n << endl;    // n = 10

 

  以下是“引用传递”的示例程序。由于Func3函数体内的x是外部变量n的引用，x和n是同一个东西，改变x等于改变n，所以n的值成为10。

  void Func3(int &x)

{

  x = x + 10;

}

…

int n = 0;

  Func3(n);

  cout << “n = ” << n << endl;   // n = 10

 

  对比上述三个示例程序，会发现“引用传递”的性质象“指针传递”，而书写方式象“值传递”。实际上“引用”可以做的任何事情“指针”也都能够做，为什么还要“引用”这东西？

答案是“用适当的工具做恰如其分的工作”。

  指针能够毫无约束地操作内存中的如何东西，尽管指针功能强大，但是非常危险。就象一把刀，它可以用来砍树、裁纸、修指甲、理发等等，谁敢这样用？

如果的确只需要借用一下某个对象的“别名”，那么就用“引用”，而不要用“指针”，以免发生意外。比如说，某人需要一份证明，本来在文件上盖上公章的印子就行了，如果把取公章的钥匙交给他，那么他就获得了不该有的权利。

 

**7.1****内存分配方式**

内存分配方式有三种：

（1）    从静态存储区域分配。内存在程序编译的时候就已经分配好，这块内存在程序的整个运行期间都存在。例如全局变量，static变量。

（2）    在栈上创建。在执行函数时，函数内局部变量的存储单元都可以在栈上创建，函数执行结束时这些存储单元自动被释放。栈内存分配运算内置于处理器的指令集中，效率很高，但是分配的内存容量有限。

（3）    从堆上分配，亦称动态内存分配。程序在运行的时候用malloc或new申请任意多少的内存，程序员自己负责在何时用free或delete释放内存。动态内存的生存期由我们决定，使用非常灵活，但问题也最多。

**7.2****常见的内存错误及其对策**

​    发生内存错误是件非常麻烦的事情。编译器不能自动发现这些错误，通常是在程序运行时才能捕捉到。而这些错误大多没有明显的症状，时隐时现，增加了改错的难度。有时用户怒气冲冲地把你找来，程序却没有发生任何问题，你一走，错误又发作了。

常见的内存错误及其对策如下：

u    内存分配未成功，却使用了它。

编程新手常犯这种错误，因为他们没有意识到内存分配会不成功。常用解决办法是，在使用内存之前检查指针是否为NULL。如果指针p是函数的参数，那么在函数的入口处用assert(p!=NULL)进行检查。如果是用malloc或new来申请内存，应该用if(p==NULL) 或if(p!=NULL)进行防错处理。

 

u    内存分配虽然成功，但是尚未初始化就引用它。

犯这种错误主要有两个起因：一是没有初始化的观念；二是误以为内存的缺省初值全为零，导致引用初值错误（例如数组）。

内存的缺省初值究竟是什么并没有统一的标准，尽管有些时候为零值，我们宁可信其无不可信其有。所以无论用何种方式创建数组，都别忘了赋初值，即便是赋零值也不可省略，不要嫌麻烦。

 

u    内存分配成功并且已经初始化，但操作越过了内存的边界。

例如在使用数组时经常发生下标“多1”或者“少1”的操作。特别是在for循环语句中，循环次数很容易搞错，导致数组操作越界。

 

u    忘记了释放内存，造成内存泄露。

含有这种错误的函数每被调用一次就丢失一块内存。刚开始时系统的内存充足，你看不到错误。终有一次程序突然死掉，系统出现提示：内存耗尽。

动态内存的申请与释放必须配对，程序中malloc与free的使用次数一定要相同，否则肯定有错误（new/delete同理）。

 

u    释放了内存却继续使用它。

有三种情况：

（1）程序中的对象调用关系过于复杂，实在难以搞清楚某个对象究竟是否已经释放了内存，此时应该重新设计数据结构，从根本上解决对象管理的混乱局面。

（2）函数的return语句写错了，注意不要返回指向“栈内存”的“指针”或者“引用”，因为该内存在函数体结束时被自动销毁。

（3）使用free或delete释放了内存后，没有将指针设置为NULL。导致产生“野指针”。