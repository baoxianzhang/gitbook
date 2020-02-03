# stm32莫名的程序不行问题记录

 同一个程序中SPI SPI1， 程序都是一样的，SPI1 行，SPI不行

stm32f103中的hal库和stm32f411的hal库中一些设定是不一样的，比如说管教功能定义f411和103为uint16_t，但是程序中定义的uint8_t，选择GPIO_PIN_8之后的管脚，会转化为低字节，也就是说都是00，

会造成不能够正确驱动SPI 。

因此一定需要注意管脚类型的定义需要和库中一致，比如GPIO_PIN_x需要定义成uint16_t。比如所有库函数的struct里面的类型的的定义都需要一致，不然，这种错误很难找到错误原因。

\#define GPIO_PIN_0                 ((uint16_t)0x0001U)  /* Pin 0 selected    */

\#define GPIO_PIN_1                 ((uint16_t)0x0002U)  /* Pin 1 selected    */

\#define GPIO_PIN_2                 ((uint16_t)0x0004U)  /* Pin 2 selected    */

\#define GPIO_PIN_3                 ((uint16_t)0x0008U)  /* Pin 3 selected    */

\#define GPIO_PIN_4                 ((uint16_t)0x0010U)  /* Pin 4 selected    */

\#define GPIO_PIN_5                 ((uint16_t)0x0020U)  /* Pin 5 selected    */

\#define GPIO_PIN_6                 ((uint16_t)0x0040U)  /* Pin 6 selected    */

\#define GPIO_PIN_7                 ((uint16_t)0x0080U)  /* Pin 7 selected    */

\#define GPIO_PIN_8                 ((uint16_t)0x0100U)  /* Pin 8 selected    */

\#define GPIO_PIN_9                 ((uint16_t)0x0200U)  /* Pin 9 selected    */

\#define GPIO_PIN_10                ((uint16_t)0x0400U)  /* Pin 10 selected   */

\#define GPIO_PIN_11                ((uint16_t)0x0800U)  /* Pin 11 selected   */

\#define GPIO_PIN_12                ((uint16_t)0x1000U)  /* Pin 12 selected   */

\#define GPIO_PIN_13                ((uint16_t)0x2000U)  /* Pin 13 selected   */

\#define GPIO_PIN_14                ((uint16_t)0x4000U)  /* Pin 14 selected   */

\#define GPIO_PIN_15                ((uint16_t)0x8000U)  /* Pin 15 selected   */

\#define GPIO_PIN_All               ((uint16_t)0xFFFFU)  /* All pins selected */

