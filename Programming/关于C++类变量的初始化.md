# 关于C++类变量的初始化

http://stackoverflow.com/questions/11490988/c-compile-time-error-expected-identifier-before-numeric-constant

You cannot do this:

```c++
vector<string> name(5); //error in these 2 lines
vector<int> val(5,0);

```



in a class outside of a method. You should declare them first, then initialize them e.g in a contructor

```c++
class Foo {
    vector<string> name;
    vector<int> val;
 public:
  Foo() : name(5), val(5,0) {}
};
```



In C++11 you could initialize the data members at the point of declaration, but not with ()brackets:

```c++
class Foo {
    vector<string> name = vector<string>(5);
    vector<int> val{vector<int>(5,0)};
};
```

