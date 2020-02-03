# STM32F4的启动文件startup_stm32f4xx.s说明

http://blog.csdn.net/a5130599/article/details/8227591

由于我是初学，所有的都是网上学习和个人理解，错误在所难免，这个只是为我自己做的一个笔记（以后发现需要补充的，会不定期补充更新），如果你们看见有错误的地方，多多指教。

​    软件平台：Keil MDK 4.6

​    硬件平台：STM32F4 Discovery

​    启动文件：startup_stm32f4xx.s，版本1.0.0，日期2011.9.30

​    参考资料：UM1467 User manual。Getting started with software and firmware environments for the STM32F4DISCOVERY Kit

​    首先，我们需要建立工程，在使用寄存器配置的方法时，需要向工程中添加启动文件和包含main函数的文件，即startup_stm32f4xx.s和main.c两个文件，其中启动文件在创建项目的时候已经自动添加进去了，而main文件需要咱们自己添加进去，保存。在main文件中添加如下程序即可编译。

​    \#include <stm32f4xx.h>

​    int main(void)

​    {

​        while(1);

​    }

​    编译不通过？是不是缺少一个SystemInit函数，此时看启动文件，如果版本和我的一样，则看第172和173行，是不是先调用了SystemInit，然后调用了main。此时修改方法很多，我当时有两种办法，一种是向工程中添加了system_stm32f4xx.c文件，还有一种是在main文件中自己写SystemInit函数。这两种办法都成功通过了编译。官方提供的system_stm32f4xx.c文件中有现成的SystemInit函数，这个函数定义了一些系统时钟等这个文件在下一篇笔记中说一下。

​    下面着重说启动文件startup_stm32f4xx.s。 

​    **第一部分：栈设置**

Stack_Size   EQU   0x00000400

​        AREA  STACK, NOINIT, READWRITE, ALIGN=3

Stack_Mem    SPACE  Stack_Size

__initial_sp

​    这段话共4行，

第一行的意思是，定义Stack_Size数值为16进制的400；//EQU相当于汇编当中的宏定义

第二行的意思是，开辟一个堆栈段，段名为STACK，定义为可读可写，将内存单元初始化为0，对齐方式为8字节对齐；

第三行的意思是，设置栈的大小为16进制的400个字节； //分 配连续 Stack_Size 字节的存储单元并初始化为 0

第四行的意思是，栈空间顶地址 //标号，代表堆栈顶部地址

AREA命令指示汇编器汇编一个新的代码段或者数据段。Contrx-M3的指令地址要求是字边界对齐（4字节），但是代码段是要求8字节边界对齐的。NOINIT：指定此数据段仅仅保留了内存单元，而没有将各初始值写入内存单元，或者将各个内存单元值初始化为0。

​    **第二部分：堆设置**

Heap_Size    EQU   0x00000200

​        AREA  HEAP, NOINIT, READWRITE, ALIGN=3

__heap_base

Heap_Mem    SPACE  Heap_Size

__heap_limit

第一行的意思是，定义Heap_Size数值为16进制的200；

第二行的意思是，开辟一个堆段，段名为Heap，定义为可读可写，将内存单元初始化为0，对齐方式为8字节对齐；

第三行的意思是，堆底部地址；//标号，代表堆末底部地址

第四行的意思是，设置栈的大小为16进制的200个字节；

第五行的意思是，堆界限地址 //标号，代表堆界限地址

​    **第三部分：编译器**

​        PRESERVE8

​        THUMB

第一行的意思是，指示编译器8字节对齐；（ARM要求用PRESERVE8）；

第二行的意思是，指示编译器以后的指令为THUMB指令；

PRESERVE8 指令指定当前文件保持堆栈八字节对齐。 它设置 PRES8 编译属性以通知链接器。链接器检查要求堆栈八字节对齐的任何代码是否仅由保持堆栈八字节对齐的代码直接或间接地调用。

​    **第四部分：中断向量表定义**

 AREA  RESET, DATA, READONLY

​        EXPORT __Vectors

​        EXPORT __Vectors_End

​        EXPORT __Vectors_Size

__Vectors    DCD   __initial_sp        ; Top of Stack

​        DCD   Reset_Handler       ; Reset Handler

​        DCD   NMI_Handler        ; NMI Handler

.........................................................................................

..........................................................................................

​        DCD   HASH_RNG_IRQHandler        ; Hash and Rng

​        DCD   FPU_IRQHandler          ; FPU

​             

__Vectors_End

__Vectors_Size EQU __Vectors_End - __Vectors

​        AREA  |.text|, CODE, READONLY

第一行的意思是，定义只读数据段，其实放在flash中，地址0x00000000； //放在DATA区

第二行的意思是，先看EXPORT，使用 EXPORT 可使其他文件中的代码能访问当前文件中的符号。该句的意思是在程序中声明一个全局的标号__Vectors，该标号可在其他的文件中引用；

第三行的意思是，同第二行；

第四行的意思是，同第三行；

第五行的意思是，中断向量入口地址，__Vectors。在首地址即flash地址的0x00000000中分配一个数据，该数据为栈地址；

第六行的意思是，存入Reset_Handler中断事件入口地址；

。。。。。。。。。。。。。。。。。

。。。。。。。。。。。。。。。。。

最后第三行的意思是，中断向量结束地址；

最后第二行的意思是，中断向量地址空间大小；

最后一行的意思是，代码段定义。

 EXPORT：在程序中声明一个全局的标号__Vectors，该标号可在其他的文件中引用。EXPORT 命令声明一个符号，可由链接器用于解释各个目标和库文件中的符号引用，相当于声明了一个全局变量。 

DCD 命令分配一个或多个字的存储器，在四个字节的边界上对齐，并定义存储器的运行时初值。

|.text| 用于表示由 C 编译程序产生的代码段，或用于以某种方式与 C 库关联的代码段。

​    **第五部分：中断事件处理**

Reset_Handler  PROC

​         EXPORT Reset_Handler       [WEAK]

​    IMPORT SystemInit

​    IMPORT __main

​         LDR   R0, =SystemInit

​         BLX   R0

​         LDR   R0, =__main

​         BX   R0

​         ENDP

NMI_Handler   PROC

​        EXPORT NMI_Handler        [WEAK]

​        B    .

​        ENDP

。。。。。。。。。。。。。。。。。。。。。。

。。。。。。。。。。。。。。。。。。。。。。

​        B    .

​        ENDP

​        ALIGN

第一行的意思是，如果复位，则进行下面的程序，其中*PROC和ENDP伪指令把程序段分为若干个过程，使程序的结构加清晰；*

第二行的意思是，[WEAK] 弱定义，意思是如果在别处也定义该标号(函数)，在链接时用别处的地址；

第三行的意思是，调用函数Systeminit函数；

第四行的意思是，作用是调用咱们自己写的main函数；

第五行的意思是，将System函数地址赋给R0；

第六行的意思是，处理器的状态从 ARM 更改为 Thumb，或从Thumb更改为ARM；

第七行的意思是，将_main函数地址给R0；

第八行的意思是，

**BLX label 无论何种情况，始终会更改处理器的状态。**

**BX Rm 和 BLX Rm 可从 Rm 的位 [0] 推算出目标状态：**

如果 Rm 的位 [0] 为 0，则处理器的状态会更改为（或保持在）ARM 状态；如果 Rm 的位 [0] 为 1，则处理器的状态会更改为（或保持在）Thumb 状态 。

第九行的意思是，程序结束。

以下的程序相同的意思。

​    **第六部分：栈和堆的初始化**

 IF   :DEF:__MICROLIB        

​         EXPORT __initial_sp

​         EXPORT __heap_base

​         EXPORT __heap_limit

ELSE        

​         IMPORT __use_two_region_memory

​         EXPORT __user_initial_stackheap         

​         __user_initial_stackheap

​         LDR   R0, = Heap_Mem              //保存堆始地址

​         LDR   R1, =(Stack_Mem + Stack_Size)   //保存栈的大小

​         LDR   R2, = (Heap_Mem + Heap_Size)  //保存堆的大小

​         LDR   R3, = Stack_Mem              //保存栈顶指针

​         BX   LR

​         ALIGN

​         ENDIF

​         END

第一行的意思是，如果定义了__MICROLIB则进行下面的语句，否则跳转到ELSE中；

第二、三、四行的意思是，赋予__initial_sp、__heap_base、__heap_limit全局属性；

第六行的意思是，指定存储器模式为双段模式，即一部分储存区用于栈空间，其他的存储区用于堆空间；

第七行的意思是，赋予__user_initial_stackheap全局属性；

第八行的意思是，__user_initial_stackheap表示用户堆栈初始化程序入口，和中断向量表的入口地址__Vectors类似的作用；

第九、十、十一、十二行的意思是，将其地址存入R0、R1、R2、R3；

第十三行的意思是，

BX Rm 和 BLX Rm 可从 Rm 的位 [0] 推算出目标状态：

如果 Rm 的位 [0] 为 0，则处理器的状态会更改为（或保持在）ARM 状态；如果 Rm 的位 [0] 为 1，则处理器的状态会更改为（或保持在）Thumb 状态 ；

第十四行的意思是，填充字节使地址对齐；

最后两行，程序结束。

 

​    以上就是STM32F4的启动文件介绍，其实就是针对startup_stm32f4xx.s文件的每一部分进行了讲解。

该笔记用的启动文件下载地址：http://download.csdn.net/detail/a5130599/4832393