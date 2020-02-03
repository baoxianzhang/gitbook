# 接口与实现分离 simple good example

http://www.cnblogs.com/maoye/archive/2010/03/19/1690183.html

接口与实现分离

为什么这样设计？

主要原因是保持接口的稳定，而且封装性更好。类的实现细节跟其他类的联系都隐藏起来了。

 

具体实现

**Database.h**

Create的实现其实是调用Impl的实现。但在头文件中只需要CDatabaseImpl的声明。

 1 #ifndef _DATABASE_H_

 2  #define _DATABASE_H_

 3  class CDatabaseImpl;

 4  class CDatabase

 5 {

 6  public:

 7     CDatabase();

 8     ~CDatabase();

 9     int Create(const char* pName);

10  private:

11     CDatabaseImpl *m_pImpl; //最好采用智能指针boost::shared_ptr的实现, std::tr1::shared_ptr,  #include <tr1/memory>

12 };

13     

14  #endif



**Database.cpp**



\#include "Database.h"

\#include "DatabaseImpl.h"

CDatabase::CDatabase()

{

​    m_pImpl = new CDatabaseImpl;

}

CDatabase::~CDatabase()

{

​    if (m_pImpl)

​        delete m_pImpl;

​    m_pImpl = NULL;

}

int CDatabase::Create(const char* pName)

{

​    return m_pImpl->Create(pName);

}

 

**DatabaseImpl.h**

\#ifndef DATABASE_IMPL_H

\#define DATABASE_IMPL_H

\#include <stdio.h>

class CDbMainPart

{

public:

​    int CreateMain()

​    {

​        printf("Main Created\n");

​    }

};

class CDbMinorPart

{

public:

​    int CreateMinor()

​    {

​        printf("Minor Created\n");

​    }

};

class CDatabaseImpl

{

public:

​    CDatabaseImpl(){}

​    ~CDatabaseImpl(){}

​    int Create(const char* pName);

private:

​    CDbMinorPart m_MinorPart;

​    CDbMainPart m_MainPart;

};

\#endif







**DatabaseImpl.cpp**



\#include <stdio.h>

\#include "DatabaseImpl.h"

int CDatabaseImpl::Create(const char* pName)

{

​    printf("[%s] Created\n",pName);

​    m_MainPart.CreateMain();

​    m_MinorPart.CreateMinor();

​    return 0;

 }



**main.cpp**

\#include "Database.h"

int main()

{

​    CDatabase db;    

​    db.Create("Longshine");

​    return 0;

}