# 关于DFU bootloader使用问题

在bootloader main函数:

​    if(((*(__IO uint32_t*)USBD_DFU_APP_DEFAULT_ADD) & 0x2FFE0000 ) == 0x20000000)

​    {

​      /* Jump to user application */

​      JumpAddress = *(__IO uint32_t*) (USBD_DFU_APP_DEFAULT_ADD + 4);

​      JumpToApplication = (pFunction) JumpAddress;

​      /* Initialize user application's Stack Pointer */

​      __set_MSP(*(__IO uint32_t*) USBD_DFU_APP_DEFAULT_ADD);

​      // SysTick_Disable();

​      JumpToApplication();

​    }

USBD_DFU_APP_DEFAULT_ADD 为应用程序放在flash 地址（10000）。

在app  main函数：

int main(void)

{

  // SCB->VTOR = FLASH_BASE | 0x10000;

  SCB->VTOR = FLASH_BASE | VECT_TAB_OFFSET;  // 放在main函数的开头

} 

在app .ld 连接文件

/* Specify the memory areas */

MEMORY

{

FLASH (rx)    : ORIGIN = 0x08010000, LENGTH = 512K

RAM (xrw)    : ORIGIN = 0x20000000, LENGTH = 128K

}