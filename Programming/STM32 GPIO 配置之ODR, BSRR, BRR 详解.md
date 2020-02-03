# STM32 GPIO 配置之ODR, BSRR, BRR 详解

http://bbs.21ic.com/icview-668822-1-1.html

用stm32 的配置GPIO 来控制LED 显示状态，可用ODR,BSRR,BRR 直接来控制引脚输出状态.

ODR寄存器可读可写：既能控制管脚为高电平，也能控制管脚为低电平。管脚对于位写1 gpio 管脚为高电平，写 0 为低电平

BSRR 只写寄存器：[color=Red]既能控制管脚为高电平，也能控制管脚为低电平。对寄存器高 16bit 写1 对应管脚为低电平，对寄存器低16bit写1对应管脚为高电平。写 0 ,无动作

BRR 只写寄存器：只能改变管脚状态为低电平，对寄存器 管脚对于位写 1 相应管脚会为低电平。写 0 无动作。

刚开始或许你跟我一样有以下疑惑：

1.既然ODR 能控制管脚高低电平为什么还需要BSRR和SRR寄存器？

2.既然BSRR能实现BRR的全部功能，为什么还需要SRR寄存器？

对于问题 1 ------ 意法半导体给的答案是---“This way, there is no risk that an IRQ occurs between the read and the modify access.”

 什么意思呢？就就是你用BSRR和BRR去改变管脚状态的时候，没有被中断打断的风险。也就不需要关闭中断。

用ODR操作GPIO的伪代码如下：

 disable_irq()

save_gpio_pin_sate = read_gpio_pin_state();

save_gpio_pin_sate = xxxx;

chang_gpio_pin_state(save_gpio_pin_sate);

enable_irq();

关闭中断明显会延迟或丢失一事件的捕获，所以控制GPIO的状态最好还是用SBRR和BRR

对于问题 2 ------- 个人经验判断意法半导体仅仅是为了程序员操作方便估计做么做的。因为BSRR的 低 16bsts 恰好是set操作，而高16bit是 reset 操作 而BRR 低 16bits 是reset 操作。简单地说GPIOx_BSRR的高16位称作清除寄存器，而GPIOx_BSRR的低16位称作设置寄存器。另一个寄存器GPIOx_BRR只有低16位有效，与GPIOx_BSRR的高16位具有相同功能。

举个例子说明如何使用这两个寄存器和所体现的优势。例如GPIOE的16个IO都被设置成输出，而每次操作仅需要改变低8位的数据而保持高8位不变，假设新的8位数据在变量Newdata中，

这个要求可以通过操作这两个寄存器实现，STM32的固件库中有两个函数GPIO_SetBits()和GPIO_ResetBits()使用了这两个寄存器操作端口。

上述要求可以这样实现：

GPIO_SetBits(GPIOE, Newdata & 0xff);

GPIO_ResetBits(GPIOE, (~Newdata & 0xff));

也可以直接操作这两个寄存器：

GPIOE->BSRR = Newdata & 0xff;

GPIOE->BRR = ~Newdata & 0xff;

当然还可以一次完成对8位的操作：

GPIOE->BSRR = (Newdata & 0xff) | (~Newdata & 0xff)<<16;

从最后这个操作可以看出使用BSRR寄存器，可以实现8个端口位的同时修改操作。

有人问是否BSRR的高16位是多余的，请看下面这个例子：

假如你想在一个操作中对GPIOE的位7置'1'，位6置'0'，则使用BSRR非常方便： 

 GPIOE->BSRR = 0x400080; 

如果没有BSRR的高16位，则要分2次操作，结果造成位7和位6的变化不同步！ 

 GPIOE->BSRR = 0x80; 

 GPIOE->BRR = 0x40;