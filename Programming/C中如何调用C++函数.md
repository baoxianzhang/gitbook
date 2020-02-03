# C中如何调用C++函数

http://www.cppblog.com/franksunny/archive/2007/11/29/37510.html

C中如何调用C++函数?

 

前阵子被问及一个在C中如何调用C++函数的问题，当时简单回答是将函数用extern "C"声明，当被问及如何将类内成员函数声明时，一时语塞，后来网上查了下，网上有一翻译C++之父的文章可以作为解答，遂拿来Mark一下。

 

将 C++ 函数声明为``extern "C"''（在你的 C++ 代码里做这个声明），然后调用它（在你的 C 或者 C++ 代码里调用）。例如：

// C++ code:

extern "C" void f(int);

void f(int i)

{

   // ...

}

 

然后，你可以这样使用 f()：

/* C code: */

void f(int);

void cc(int i)

{

  f(i);

  /* ... */

  }

 

当然，这招只适用于非成员函数。如果你想要在 C 里调用成员函数（包括虚函数），则需要提供一个简单的包装（wrapper）。例如：

// C++ code:

class C

{

​    // ...

​    virtual double f(int);

};

 

extern "C" double call_C_f(C* p, int i) // wrapper function

{

​    return p->f(i);

}

 

然后，你就可以这样调用 C::f()：

/* C code: */

double call_C_f(struct C* p, int i);

 

void ccc(struct C* p, int i)

{

​    double d = call_C_f(p,i);

​    /* ... */

}

 

如果你想在 C 里调用重载函数，则必须提供不同名字的包装，这样才能被 C 代码调用。例如：

// C++ code:

void f(int);

void f(double);

 

extern "C" void f_i(int i) { f(i); }

extern "C" void f_d(double d) { f(d); }

 

然后，你可以这样使用每个重载的 f()：

/* C code: */

void f_i(int);

void f_d(double);

 

void cccc(int i,double d)

{

​    f_i(i);

​    f_d(d);

​    /* ... */

}

注意，这些技巧也适用于在 C 里调用 C++ 类库，即使你不能（或者不想）修改 C++ 头文件。

 该翻译的文档Bjarne Stroustrup的原文链接地址是

http://www.research.att.com/~bs/bs_faq2.html#callCpp