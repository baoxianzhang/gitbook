# struct 

《C和指针》

结构声明：

struct tag { member-list } variable-list;

struct {

​            int     a;

​            char   b;

​            float   b;

} x;

这个声明创建了一个名为x的变量。

struct {

​            int     a;

​            char   b;

​            float   b;

}  y[20], *z;

这个声明创建了一个名为y, z的变量。

这两个声明被编译器当做两种截然不同的类型， 即使它们的成员变量列表完全相同。因此，变量y和z的类型和变量x的类型市不同的。z=&x是非法的。

标签(tag)字段允许为成员列表提供一个名字，这样它就可以在后续的声明中使用。标签允许多个声明使用同一个成员列表，并且创建同一个类型的结构。

struct  SIMPLE{

​            int     a;

​            char   b;

​            float   b;

}  ;

struct SIMPLE x;

struct SIMPLE y[20], z;

现在x, y, z都是同一种类型的结构变量。

声明结构可以使用另一种良好的技巧市使用typedef创建一种新的类型，如：

typedef struct {

​            int     a;

​            char   b;

​            float   b;

}  Simple;

后续的声明就可以，

Simple x;

Simple y[20], *z;

结构的自引用

一个结构的内部包含一个为该结构本身的成员。

如：

struct SELF_REF1 {

​            int     a;

​            struct SELF_REF1 b;

​            int    c;

} ;

这种类型的自引用是非法的。这种，b会一直重复包含下去，永远不会终止的递归。但是替换为指针确实可以的。

struct SELF_REF2 {

​            int     a;

​            struct SELF_REF2 *b;

​            int    c;

} ;

编译器在结构的长度确定之前就已经知道指针的长度，b现在是一个指针，而不是结构。

警惕下面的陷阱：

typedef struct  {

​            int     a;

​            SELF_REF3 *b;

​            int    c;

}SELF_REF3 ;

因为类型名直到声明的末尾才定义，所以在结构的内部它尚未定义。

一个解决方案是定义一个结构标签来声明b，如下所示：

typedef struct SELF_REF3_TAG{

​            int     a;

​             struct SELF_REF3_TAG *b;

​            int    c;

}SELF_REF3 ;

struct结构体作为函数参数的结构，请使用指针作为函数的参数进行传递，（如果使用值传递，则必须把结构占的空间全部复制到堆栈中，效率非常低），同时在不修改参数的情况下，使用const。

struct可以位段功能。位段的声明和结构类似，但它的成员是一个或多个位的字段。这些不同长度的字段存储于一个或多个整型变量中。

位段的声明和任何普通的结构成员声明相同，但由两个例外。首先，位段成员必须声明为int, signed int 或unsigned int类型。其次，在成员名的后面是一个冒号和整数，这个整数指定该位段所占用的位的数目。

用signed 或unsigned整数显式地声明位段是个好主意。如果把位段声明为int类型，它究竟被解释为有符号还是无符号数是由编译器决定的。

http://www.cnblogs.com/qyaizs/articles/2039101.html

**struct和typedef struct**

分三块来讲述：

　　1 首先：**//注意在C和C++里不同**

　　　　在C中定义一个结构体类型要用typedef:

　　　　**typedef struct Student**

　　　　**{**

　　　　**int a;**

　　　　**}Stu;**

　　　　于是在声明变量的时候就可：Stu stu1;(如果没有typedef就必须用struct Student stu1;来声明)

　　　　这里的Stu实际上就是struct Student的别名。**Stu==struct Student**

　　　　另外这里也可以不写Student（于是也不能struct Student stu1;了，必须是Stu stu1;）

　　　　**typedef struct**

　　　　**{**

　　　　**int a;**

　　　　**}Stu;**

　　　　但在c++里很简单，直接

　　　　**struct Student**

　　　　**{**

　　　　**int a;**

　　　　**};**　　　　

　　　　于是就定义了结构体类型Student，声明变量时直接Student stu2；

======================================================================================

　　2.其次：

　　　　在c++中如果用typedef的话，又会造成区别：

　　　　**struct  Student**  

　　　　**{**  

　　　　**int  a;**  

　　　　**}stu1;//**stu1是一个变量 

 

　　　　**typedef  struct  Student2**  

　　　　**{**  

　　　　**int  a;**  

　　　　**}stu2;**//stu2是一个结构体类型=struct Student 

 

　　　　使用时可以直接访问stu1.a

　　　　但是stu2则必须先  stu2 s2;

　　　　然后        s2.a=10;

======================================================================================

　　3 掌握上面两条就可以了，不过最后我们探讨个没多大关系的问题

　　　　如果在c程序中我们写：

　　　　**typedef struct** 

　　　　**{**

　　　　**int num;**

　　　　**int age;**

　　　　**}aaa,bbb,ccc;**

　　　　这算什么呢？

　　　　我个人观察编译器（VC6）的理解，这相当于

　　　　typedef struct 

　　　　{

　　　　int num;

　　　　int age;

　　　　}aaa；

　　　　typedef aaa bbb;

　　　　typedef aaa ccc;

　　　　也就是说aaa,bbb,ccc三者都是结构体类型。声明变量时用任何一个都可以,在c++中也是如此。但是你要注意的是这个在c++中如果写掉了typedef关键字，那么aaa，bbb，ccc将是截然不同的三个对象。

　　　　//此处不是很理解。

　　　　**typedef struct tagMyStruct**

　　　　**{** 

　　　　　**int iNum;**

　　　　　**long lLength;**

　　　　**} MyStruct;**

　　　　在C中，这个申明后申请结构变量的方法有两种：

　　　　（1）struct tagMyStruct 变量名

　　　　（2）MyStruct 变量名

　　　　在c++中可以有

　　　　（1）struct tagMyStruct 变量名

　　　　（2）MyStruct 变量名

　　　　（3）tagMyStruct 变量名