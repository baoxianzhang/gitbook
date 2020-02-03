# Effective C++ 改善程序与设计的55个具体做法 笔记（1）

 \1.  **default 构造函数**。

所谓default 构造函数是一个可被调用而不带任何实参者。这样的构造函数要不没有参数，要不就是每个参数都有缺省值。

class A {

public:

​    A();         // default 构造函数

};

class B {

public:

​    explicit B(int x = 0, bool b = true); // default 构造函数

};

class C {

public:

explicit C(int x);     // 不是default构造函数

};

\2. **explicit。**

上述的class B 和C 的构造函数都被声明为explicit, 这可阻止它们被用来执行隐式类型转换(implicit type conversions), 但它们仍可被用来进行显示类型转换(explicit type conversions)

void doSomething(B bObject);    // doSomething函数，接受一个类型为B的对象

B bObj1;

doSomething(bObj1);  // 没有问题

B bObj2(28);                // 没有问题，有默认构造函数

doSomething(28);         // 错误， doSomething应该接受一个B， 而不是int, 而int至B之间因为加了explicit， 不能够隐式转换。

doSomething(B(28));   // 没有问题，使用B构造函数将int显式转化

被声明为explicit的构造函数通常比其non-explicit的更受欢迎，因为它们禁止编译器执行非预期的类型转换。除非有一个好理由允许构造函数被用于隐式类型转换，否则声明为explicit.

 \3. **copy构造函数， copy assignment**

copy构造函数用来“以同型对象初始化自我对象", copy assignment操作符被用来"从另一个对象中拷贝其值到自我对象"。

class Widget{

public:

​    Widget();     // default构造函数

​    Widget(const Widget& rhs);    // copy 构造函数   pass-by-reference-to-const

​    Widget& operator=(const Widget& rhs);   // copy assignment操作符

​    ....

};

Widget w1;    // 调用default构造函数

Widget w2(w1);   // 调用copy构造函数

w1 = w2;            // 调用copy assignment操作符

**Widget w2 = w1;  // 调用copy构造函数**

**4. 高效编程守则**

当你从某个次语言切换到另外一个，导致高效编程守则要求你改变策略时，不要感到惊讶。例如对内置（也就是C-like）类型而言pass-by-value通常比pass-by-reference高效，但当你从C part of C++ 移往Object-Oriented C++，由于用户自定义构造函数和析构函数的存在，pass-by-reference-to-const往往更好。运用Template ++时尤其如此，因为此时甚至不知道所处理的对象类型。然而，一旦跨入STL你就会了解，迭代器和函数对象都是在C指针之上塑造出来的，所以对STL的迭代器和函数对象而言,旧式的pass-by-value守则再次适用。

\5.  尽量以const, enum, inline替换#define, 宁可以编译器替换预处理

类里面适用const来替代#define

\#definte AAA 1.111

\#define只是在预处理，可能出现目标码中出现多次1.111, 占用空间会较大。

适用#define 并不重视作用域。这意味着#define不仅不能够用来定义class专属常量，也不能够提供任何封装性，也就是没有所谓的private #define之说，而const成员变量是可以被封装的。

\* 对于单纯常量，最好以const对象或者enums替换#define

\* 对于形似函数的宏，最好改用inline函数替换#define

\6. 尽可能用const

 STL 迭代器以指针为根据塑模出来，所以迭代器的左右就像个T*指针。声明迭代器为const就像声明指针为const一样（即声明一个T* const指针），表示这个迭代器不得指向不同的东西，但它所指的东西的值是可以改动的。如果你希望迭代器所指的东西不可被改动（即希望STL模拟一个const T* 指针），你需要调用const_iterator.

const最具有威力的用法是面对函数声明时的应用。在一个函数声明式内，const可以和函数返回值、各参数、函数自身（如果是成员函数）产生关联。

另函数返回一个常量值，往往可以降低因客户错误而造成的意外，而又不至于放弃安全性和高效性。

class Rational { ... };

const Rational operator* (const Rational& lhs, const Rational& rhs);

可以预防那个“没有意思的赋值动作”，一个良好的用户自定义类型“的特征是它们避免无端地与内置类型不兼容，如

正常的的内置类型，

int a, b, c;

...

if (a + b = c) // something wrong

所以，我们的自定义类型也不能有这个没有意思的赋值操作

Rational a, b, c;

...

if ( a * b = c) // 没有意思的赋值动作。

const函数是不运行函数里面修改成员的值（const函数即在函数形参括号结束后面有一个const)。

当const和non-const成员函数有着实质等价的实现时，令non-const版本调用const版本可以避免代码重复。

class TextBlock {

Public:

...

const char& operator[](std::size_t position) const

{

...

​    return text [position];

}

char& operator[](std::size_t position)

{

​    return const_cast <char&>(static_cast<const TextBlock&>(*this) [position]);

}

casting(转型）是一个不建议的做法，但是这边可以简化代码。

static_cast: 把non-const 转化为const

const_cast: 把返回的const，丢弃

\7. 确定对象被使用前已先被初始化。

请使用member initialization list（成员初值列）替换赋值动作：

ABEntry::ABEntry(const std::string& name, const std::string& address, const std::list<PhoneNumber>& phones)

: theName(name),

theAddress(address),

thePhone(phones),

numTimesConstulted(0)

{}

这个member initialzation list方式是初始化，而不是赋值。C++规定，对象的成员变量的初始化动作发生在进入构造本体之前。

因此，使用赋值的话之前还需要进行初始化，效率比较低。使用member initialization list 可以避免这个问题。

编译器会为用户自定义类型的成员变量自动调用default构造函数，请立下这个规则，规定总是在初值列中列出所有成员变量，一面还得记住哪些成员变量，避免没有初值，出现不明确的行为。

使用member initialzation可以解决成员变量是const或者references他们一定要初值，不能赋值的情况。还可以解决多个成员变量，或base class，多份成员初值列的存在就会导致不受欢迎的重复。这种情况下可以合理的在初值列中遗漏那些“赋值表现像初始化一样好”的成员变量，改用太慢的赋值操作，并将他们的赋值操作移往某个函数（通常是private), 供构造函数调用。这种做法在“成员变量的初值系由文件或数据库读入”时特别有用。

C++有着十分固定的“成员初始化次序”。base classes更早于drived classes被初始化，class的成员变量总是以其声明次序被初始化。所以，在成员初值列中列出各个成员时，最好总是以其声明次序为次序。

为内置型对象进行手工初始化，因为C++不保证初始化它们。

未免除"跨编译单元之初始化次序“问题，请以local static对象替换non-local static 对象。

\8.  了解C++默认编写并调用哪些函数

如果灭有声明，编译器就会为它声明（编译器版本的）一个copy构造函数，一个copy assignment操作符和一个析构函数，此外如果你没有声明**任何构造函数**，编译器也会为你声明一个default构造函数。所有这些函数都是public且inline的。

因此：你写下：

class Empty();

这就好像你写下这样的代码：

class Empty {

public:

​    Empty(){...}

​    Empty(const Empty& rhs){...}

​    ~Empty() {...}

​    Empty& operator=(const Empty& rhs) {...}

}

唯有当这些函数被调用，它们才会被编译器创建出来。

注意， 编译器产出的析构函数是个non-virtual， 除非这个class的base class自身声明有virtual析构函数（这种情况下这个函数的虚属性；virtualness主要来自base class.

至于copy构造函数和copy assignment操作符，编译器创建的版本只是单纯的将来源对象的每一个non-static成员变量拷贝到目标对象。

而copy assignment在只有生成的代码合法且有适当机会证明它有意义，才会生成，不然会拒绝class生成operator=.

比如成员变量有reference, const的情况。这个你必须自己定义copy assignment解决编译器不能够判决的难题。

如果某个base classes将copy assignment操作符声明为private，编译器将拒绝为其derived classes 生成一个copy assignment操作符。

\9. 若不想使用编译器自动生成的函数，就该明确的 拒绝。

可以将相应的函数声明为private并且不予实现。

使用base class阻止copying动作。

class  Uncopyable {

protected:

​    Uncopyable() {}     // 允许derived对象析构和构造

​    ~Uncopyable(){}

private:

​    Uncopyable(const Uncopyable&);

​    Uncopyabble& operator=(const Uncopyable&);

};

// 

class HomeForSale: private Uncopyable{  // 不再声明copy构造函数，copy assign. 操作符

}

\10. 为多态基类声明virtual析构函数

C++明确指出，当derived class对象经由一个base class指针被删除，而该base class带有一个non-virtual析构函数，其结果未有定义------实际执行时通常发生的对象的derived成分没有被销毁。，造成诡异的”局部销毁“对象。

给base class一个virtual析构函数，它会销毁整个对象。

如果class 不含virtual函数，通常表示它不被意图做一个base class, 不要把析构函数定义为virtual。因为会有virtual table pointer，对象体积会增大。

标准库中的string, vector等都是不带有任何的virtual析构函数的class.

polymorphic（带多态性质的）base classes 应该声明一个virtual析构函数。如果class带有任何virtual函数，它就应该拥有virtual析构函数。

class的设计如果不是作为base class使用，或不是为了具备多态性质, 就不应该声明,virtual析构函数。