# PDM PCM

ST Application note

AN3998  PDM audio software decoding on STM32 microcontrollers

AN3997  Audio playback and recording using the STM32F4DISCOVERY

Audio precision Understanding PDM Digital Audio

**PDM:** 

Pulse density modulation is a form of modulation used to represent an analog signal in the digital domain.

In a PDM signal, specific amplitude values are not encoded into pulses as they would be in PCM. Instead it is the relative density of the pulses that corresponds to the analog signal's amplitude. To get the framed data from the PDM bit stream, decimation filters are usually used. The first stage of decimation is used to reduce the sampling frequency, followed by a high pass filter to remove the signal DC offset.

**PCM:** 

Pulse-code moduation

The data coming from the microphone is sent to the decimation process, which consists of two parts: a decimation filter converting 1-bit PDM data to PCM data, followed by two individually configurable IIR filters (low pass and high pass). The reconstructed audio is in 16-bit pulse-code modulation (PCM) format. After the conversion, it produces raw data that can be handled depending on the application implementation (stored as wave/compressed data in a mass storage media, transferred to an external audio codec DAC through I2S peripheral...).

**PDM digital filtering and decimation** 

The PDM signal from the microphone is filtered and decimated in order to obtain a sound signal at the required frequency and resolution. The frequency of the PDM data output from the microphone (which is the clock input to the microphone) must be a multiple of the final audio output needed from the system. For example, to perform a decimation of 80, for the output rate of 30 kHz, we need to provide a clock frequency 2.4MHz to the microphone. The output of the filter pipeline is a 16-bit value, we consider [-32768, 32767] as the output range for a unitary gain (0 dB). 

**Digital signal conditioning** 

The digital audio signal resulting from the previous filter pipeline is further processed for proper signal conditioning. The first stage is a high pass filter designed mainly to remove the signal DC offset. It has been implemented via an IIR filter with a cut-off frequency below the audible frequency range in order to preserve signal quality. The second stage is a low pass filter implemented using an IIR filter. Both filters can be enabled/disabled and configured (cut-off frequencies) by using the filter initialization function.Gain can be controlled by an external integer variable (MicGain) as shown in the following equation: G = MicGain/64.

**STM32F4-discovery Recording application procedure**

Audio record initialisation:

Configure the I2S at 1024 KHz

as an input clock for MEMS

microphone

​           |

​           |

Configure the timer to initialize

the recording time

​           |

​           |

Store the microphone output data

in buffer as signal:

orange LED blinking

​           |

​           |

Filter the stored data to obtain a

PCM signal at 16 KHz sampling

frequency

​           |

​           |

Store the filtered signal in the

selected mass storage

​           |

​           |

End of recording: orange LED off

and green LED blinking

Introduction

PDM stands for pulse density modulation. However, it is really better summarized as “oversampled 1-bit

audio”, as it is nothing more than a high sampling rate, single-bit digital system. If one increased the

sample rate of audio CDs by a large factor, and reduced the wordlength from 16 bits to 1 in a reasonable

way, that would serve as the basis of a PDM system.

Most current digital audio systems use multi-bit PCM (pulse code modulation) to represent the signal.

PCM has the advantage of being easy to manipulate. This allows signal processing operations to be

performed on the audio stream, such as mixing, filtering, and equalization.

PDM, which uses only one bit to convey audio, is simpler in concept and execution than PCM. It has

become popular as a way to deliver audio from microphones to the signal processor in mobile

telephones. PDM is ideally suited for this task because it brings the benefits of digital, such as low noise

and freedom from interfering signals, at low cost.

PCM

Before we tackle PDM, let’s first review PCM, that is, conventional multi-bit digital audio. In PCM, the

audio signal is represented as a series of samples, each a fixed number of bits long. Two factors

determine the performance of the system:

- • Sampling rate. This determines the bandwidth of the system.
- • Wordlength. This determines the signal-to-noise ratio (SNR) of the system.

In particular, the bandwidth is f s /2, where f s is the sampling rate, and the SNR is given by

(6.02N + 1.76) dB, where N is the wordlength in bits.

A raw 16-bit system has a theoretical SNR of around 98 dB. In practice, dither is used to linearize the

system and eliminate noise modulation; this reduces the SNR by about 4 dB. Using the above formula,

an undithered 1-bit system has an SNR of about 8 dB, which is of course unacceptable for any real audio

work. Furthermore, optimal dither needs 2 LSBs to work; since a 1-bit system only has 1 LSB total, and

that’s used for the audio, hence there is no room for dither.

Since the system cannot be properly dithered, a 1-bit representation would at first blush appear to be a

non-starter. The solution lies in an understanding of noise shaping and oversampling.

PDM Microphones

A PDM microphone, also called a digital microphone, consists of the following parts:

- A microphone element. Typically this is an electret capsule.
- An analog preamplifier.
- A PDM modulator.
- Interface logic.

The analog signal from the microphone element is first amplified, and then sampled at a high rate and

quantized in the PDM modulator. The modulator combines the operations of quantization and noise

shaping; the output is a single bit at the high sampling rate. The noise shaping ensures that the noise in

the audio band is relatively low, while the noise above the audio band is relatively high. The interface

logic is responsible for accepting a master clock and transmitting the sampled bitstream.

The device to which the microphone connects provides the master clock to the PDM microphone. The

clock rate defines the sampling rate of the system, as well as the rate at which bits are transmitted on

the data line. Although there is no defined standard, typically the oversampling ratio is 64. So to achieve

a bandwidth of 24 kHz (comparable to a PCM system sampled at 48 kHz), a master clock frequency of

3.072 MHz is needed.

The one-bit data is asserted on the data line on either the rising or falling edge of the master clock. Most

PDM microphones support stereo operation, in which one microphone asserts the data line on the rising

edge of the master clock, while a second microphone asserts on the falling edge. On the non-asserted

edge, the data output has a high impedance. The data lines from the two microphones can then simply

be connected together. The PDM receiver is responsible for separating the two bitstreams.

**PDM_Filter_xx_xx**

These functions are used to process a millisecond of PDM data from a single microphone.

**They return a number of PCM samples equal to the frequency defined in the filter**

**initialization, divided by 1000**. In case of frequencies that are not multiple of 1000 (like

44100 Hz or 22050 Hz), the samples returned by the function are equal to the floor division

of the frequencies (44 and 22).

The functions are defined as follows:

PDM_Filter_XX_XX(uint8_t* data, uint16_t* dataOut, uint16_t MicGain,

PDMFilter_InitStruct * Filter)

● data: is the input buffer containing the PDM; the application must pass to the function

the pointer to the first input sample of the microphone that must be processed.

● dataOut: is the output buffer processed by the PDM_Filter function. The application

must pass to the function the pointer to the first sample of the channel to be obtained.

● **Volume: is a value between 0 and 64 used to specify the microphone gain.**

● Filter: is the structure containing all the filter parameters specified by the user using the

PDM_Filter_Init function.

There are four different implementations of this function depending on the decimation factor

(64 or 80) and on the LSB or MSB representation of the input buffer.

例如：PDM_Filter_64_LSB函数处理1毫秒的PDM数据，假设I2S的时钟输出为1M，则1毫秒

可以采集1M/1000 = 1024 bit 数据。data 数组应该就有1024bit数据， 8*128 或 16 *64 。

typedef struct {

 uint16_t Fs;        // 定义了滤波器的输出频率

 float LP_HZ;        // 低通滤波器的截止频率

 float HP_HZ;        // 高通滤波器的截止频率

 uint16_t In_MicChannels;  // 输入流中的麦克风个数

 uint16_t Out_MicChannels; // 输出流中的麦克风个数

 char InternalFilter[34];  //PDM采样期间解码库内部使用的一个34字节内存

} PDMFilter_InitStruct;

/* Exported constants --------------------------------------------------------*/

/* Exported macros -----------------------------------------------------------*/

\#define HTONS(A)  ((((u16)(A) & 0xff00) >> 8) | \

​          (((u16)(A) & 0x00ff) << 8))

/* PDM buffer input size */

\#define INTERNAL_BUFF_SIZE         64

\#define I2S_PDM_BUFF_SIZE         64

​    /* Filter LP & HP Init */

​    uint32_t audio_freq = 16000; //2×8000

​    Filter.LP_HZ = audio_freq / 2;

​    Filter.HP_HZ = 10;

​    Filter.Fs = audio_freq;

​    Filter.Out_MicChannels = 1;

​    Filter.In_MicChannels = 1;

**HAL_I2S_Receive_DMA(&I2sHandle, (uint16_t \*)&InternalBuffer[0], INTERNAL_BUFF_SIZE);**

/* Temporary data sample */

uint16_t InternalBuffer[128];

uint16_t I2SPdmBuf[128];

uint8_t *p_send=(uint8_t *) &I2SPdmBuf[0];

//  HAL_I2S_RxCpltCallback

  for( int i = 0; i < INTERNAL_BUFF_SIZE; i++)

  {

​    InternalBuffer[i] = HTONS(InternalBuffer[i]);

  }

  PDM_Filter_64_LSB((uint8_t *)InternalBuffer, (uint16_t *)I2SPdmBuf, 64, (PDMFilter_InitStruct *)&Filter);

  for(int i = 1; i < 32; i += 4)

  {

​    sd_buf[sd_idx++] = p_send[i];

  }

然后每2048发出一组数据。

理解：

I2sHandle.Init.DataFormat = I2S_DATAFORMAT_16B;

DMA接受到**INTERNAL_BUFF_SIZE（64）个16位的数据之后，调用HAL_I2S_RxCpltCallback函数**

 **PDM_Filter_64_LSB处理的是1毫秒的数据PDM数据，I2S设置的时钟为1M，64×16 = 1024, 1024 × 1000 = 1M**

**也就是说，PDM_Filter_64_LSB接受的1ms中的64个16位数据，输出的是filter定义的频率的1000分之一（audio_freq = 16000;），也就是输出16个16位的PCM数据。**

These functions are used to process a millisecond of PDM data from a single microphone.

They return a number of PCM samples equal to the frequency defined in the filter

initialization, divided by 1000

 **然后，这个16个16位的数据，相当于32个8位数据。每四个数据中取出一个数据，也就是说1ms中输出8个8位数据，1s输出8000个8位数据。****(audacity选择频率为8000, 8bit数据， 无端模式）**

**如果用115200的波特率，1s能够输出115200 / 8 = 14400个数据，这个数据是足够的。因此波特率需要大于等于64000。**

HTON是把低8位和高8位互换。

因为：MSB在前， 而，PDM_Filter_64_LSB为 LSB

I2S(Inter IC Sound)总线, 又称集成电路内置音频总线，是飞利浦公司为数字音频设备之间的音频数据传输而制定的一种总线标准，该总线专责于音频设备之间的数据传输，广泛应用于各种多媒体系统。它采用了沿独立的导线传输时钟与数据信号的设计，通过将数据和时钟信号分离，避免了因时差诱发的失真，为用户节省了购买抵抗音频抖动的专业设备的费用。

STM32F4自带了2个全双工I2S接口，其特点包括：

●支持全双工/半双工通信

●主持主/从模式设置

●8位可编程线性预分频器，可实现精确的音频采样频率(8~192Khz)

●支持16位/24位/32位数据格式

●数据包帧固定为16位（仅16位数据帧）或32位（可容纳16/24/32位数据帧）

●可编程时钟极性

●支持MSB对齐（左对齐）、LSB对齐（右对齐）、飞利浦标准和PCM标准等I2S协议

●支持DMA数据传输（16位宽）

**●数据方向固定位MSB在前**

●支持主时钟输出（固定为256*fs，fs即音频采样率）

LSB： 地位有效，小端模式

  PDM_Filter_64_LSB((uint8_t *)InternalBuffer, (uint16_t *)I2SPdmBuf, 64, (PDMFilter_InitStruct *)&Filter);

uint16_t InternalBuffer[128];

uint16_t I2SPdmBuf[128];

uint8_t *p_send=(uint8_t *) &I2SPdmBuf[0];

**关于从1而不是从0开始的理解：**

  for(int i = 1; i < 32; i += 4)

  {

​    sd_buf[sd_idx++] = p_send[i];

  }

一个16位的数据，LSB， 小端模式，低字节放地地址，高字节放高地址。

声音的输出是相对来说的，也就是声音的大小同时除以一个同样的正数，声音还是一样的，只不过volume减小，这个和前面 PDM_Filter_64_LSB函数的MicGain，音量增益有关。

所以这里必须区高位字节的数据，取地位字节就失真了。同时，从中间抽取出一些数据，也是可以的。人耳能分辨，并且满足输出波特率。

关于I2S频率设定理解：（之前的HSE26M， system clock 96M) 

SD:串行数据(映射到 MOSI 引脚),用于发送或接收两个时分复用的数据通道上的数

据(仅半双工模式)。

●

WS:字选择(映射到 NSS 引脚),是主模式下的数据控制信号输出以及从模式下的数

据控制信号输入。

●

CK:串行时钟(映射到 SCK 引脚),是主模式下的串行时钟输出以及从模式下的串行时

钟输入。

**这里只使用了I2S2_CK, I2S2_SD**

I 2 S 可如下配置:

● 发送主器件或接收主器件(使用 I2Sx 的半双工模式)

● 同时收发的主器件(使用 I2Sx 和 I2Sx_ext 的全双工模式)。

I 2 S 工作在主模式,串行时钟由引脚 CK 输出,字选信号由引脚 WS 产生。可以通过设置寄

存器 SPI_I2SPR 的 MCKOE 位来选择输出或者不输出主时钟 (MCK)。

设置中选择，**HSE 26M, PLLM = 13, PLLN = 96, PLLP  = 2, PLLQ = 4 ,** PLL = 26 / 13 * 96 / 2 = 96 M

AHB div1,  APB1 div2, APB2 div1;

AHB = 96M, APB1 = 48M, APB2 = 96M

I2S选择的是 I2S_CLOCK_PLL = 96 M

● f (VCO 时钟 ) = f (PLL 时钟输入 ) × (PLLN / PLLM)

● f (PLL 常规时钟输出 ) = f (VCO 时钟 ) / PLLP

● f (USB OTG FS, SDIO, RNG 时钟输出 ) = f (VCO 时钟 ) / PLLQ

VCO 输出频率 = VCO 输入频率 × PLLI2SN 并且 192 <= PLLI2SN <= 432

I2S 时钟频率 = VCO 频率 × PLLR 并且 2 <= PLLR  <= 7

f (VCO 时钟 ) = f (PLLI2S 时钟输入 ) × (PLLI2SN / PLLM)

● f (PLL I2S 时钟输出 ) = f (VCO 时钟 ) / PLLI2SR

f (PLL I2S 时钟输出 )  = f (PLLI2S 时钟输入 ) × (PLLI2SN / PLLM) / PLLI2SR

26/13×429/6 = PLLI2SCLK = 143M

输出主时钟(SPI_I2SPR 寄存器中的 **MCKOE 置 1)**时:

F S = I2SxCLK / [(16*2)*((2*I2SDIV)+ODD)*8)](通道帧宽度为 16 位时)

F S = I2SxCLK / [(32*2)*((2*I2SDIV)+ODD)*4)](通道帧宽度为 32 位时)

关闭主时钟输出(MCKOE 位清零)时:

**F S = I2SxCLK / [(16\*2)\*((2\*I2SDIV)+ODD))](通道帧宽度为 16 位时)**

F S = I2SxCLK / [(32*2)*((2*I2SDIV)+ODD))](通道帧宽度为 32 位时)

这里选择的是I2S2， 属于APB1， 48M

HAL_RCCEx_GetPeriphCLKConfig(&rcc_ex_clk_init_struct);

 rcc_ex_clk_init_struct.PeriphClockSelection = **RCC_PERIPHCLK_I2S;//R**CC_I2SCLKSOURCE_PLLI2S;//RCC_PERIPHCLK_I2S;//I2S_CLOCK_PLL;//RCC_PERIPHCLK_I2S;//RCC_I2SCLKSOURCE_PLLI2S;// //;

rcc_ex_clk_init_struct.PLLI2S.PLLI2SN = **429**;//256;//131;//192;

rcc_ex_clk_init_struct.PLLI2S.PLLI2SR = **6**;//5;//2;//2;//2;

HAL_RCCEx_PeriphCLKConfig(&rcc_ex_clk_init_struct);

I2sHandle.Init.AudioFreq = 2*AudioFreq;//32000;//192000;////32000;//192000;  **//2 \* AudioFreq = 2× 16000;  32K**

I2sHandle.Init.ClockSource = **I2S_CLOCK_PLL;**

I2sHandle.Init.CPOL = I2S_CPOL_HIGH;

I2sHandle.Init.DataFormat = I2S_DATAFORMAT_16B;

I2sHandle.Init.MCLKOutput = I2S_MCLKOUTPUT_DISABLE;

I2sHandle.Init.Mode = I2S_MODE_MASTER_RX;

I2sHandle.Init.Standard = **I2S_STANDARD_LSB;**

采样率/10,PLLI2SN,PLLI2SR,I2SDIV,ODD

  **{3200,213,2, 6,1},    //32Khz采样率**

 一般我们需要根据音频采样率（fs，即CK的频率）来计算各个分频器的值，常用的音频采样率有：22.05Khz、44.1Khz、48Khz、96Khz、196Khz等。

​    根据是否使能MCK输出，fs频率的计算公式有2种情况。不过，本章只考虑MCK输出使能时的情况，当MCK输出使能时，fs频率计算公式如下：

fs=I2SxCLK/[256*(2*I2SDIV+ODD)]

​    其中：I2SxCLK=(HSE/pllm)*PLLI2SN/PLLI2SR。HSE我们是8Mhz，而pllm在系统时钟初始化就确定了，是8，这样结合以上2式，可得计算公式如下：

fs= (1000*PLLI2SN/PLLI2SR )/[256*(2*I2SDIV+ODD)]

​    fs单位是：Khz。其中：PLL2SN取值范围：192~432；PLLI2SR取值范围：2~7；I2SDIV取值范围：2~255；ODD取值范围：0/1。根据以上约束条件，我们便可以根据fs来设置各个系数的值了，不过很多时候，并不能取得和fs一模一样的频率，只能近似等于fs，比如44.1Khz采样率，我们设置PLL2SN=271，PLL2SR=2，I2SDIV=6，ODD=0，得到fs=44.108073Khz，误差为：0.0183%。晶振频率决定了有时无法通过分频得到我们所要的fs，所以，某些fs如果要实现0误差，大家必须得选用外部时钟才可以。

如果要通过程序去计算这些系数的值，是比较麻烦的，所以，我们事先计算好常用fs对应的系数值，建立一个表，这样，用的时候，只需要查表取值就可以了，大大简化了代码，常用fs对应系数表如下：

//表格式:采样率/10,PLLI2SN,PLLI2SR,I2SDIV,ODD

const u16 I2S_PSC_TBL[][5]=

{

​    {800 ,256,5,12,1},    //8Khz采样率

​    {1102,429,4,19,0},    //11.025Khz采样率

​    {1600,213,2,13,0},       //16Khz采样率

​    {2205,429,4, 9,1},    //22.05Khz采样率

​    {3200,213,2, 6,1},    //32Khz采样率

​    {4410,271,2, 6,0},    //44.1Khz采样率

​    {4800,258,3, 3,1},    //48Khz采样率

​    {8820,316,2, 3,1},    //88.2Khz采样率

​    {9600,344,2, 3,1},    //96Khz采样率

​    {17640,361,2,2,0},   //176.4Khz采样率

​    {19200,393,2,2,0},   //192Khz采样率

};

​    有了上面的fs-系数对应表，我们可以很方便的完成I2S的时钟配置。

 //采样率计算公式:Fs=I2SxCLK/[256*(2*I2SDIV+ODD)]

//I2SxCLK=(HSE/pllm)*PLLI2SN/PLLI2SR

//一般HSE=8Mhz

//pllm:在Sys_Clock_Set设置的时候确定，一般是8

//PLLI2SN:一般是192~432

//PLLI2SR:2~7

//I2SDIV:2~255

//ODD:0/1

//I2S分频系数表@pllm=8,HSE=8Mhz,即vco输入频率为1Mhz

//表格式:采样率/10,PLLI2SN,PLLI2SR,I2SDIV,ODD

  