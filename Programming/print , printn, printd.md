# print , printn, printd

```c++
void print(char *p)

{

​    while(*p)

​    {

​        HAL_UART_Transmit(&UartHandleA, p++, 1, 5);

​    }

}

void printn(char *p, int n)

{

​    while(n--)

​    {

​        HAL_UART_Transmit(&UartHandleA, p++, 1, 5);

​    }

}

void printd(int num)

{

​    char tmp[10] = {0};

​    sprintf(tmp, "%d\r\n", num);

​    print(tmp);

}
```



