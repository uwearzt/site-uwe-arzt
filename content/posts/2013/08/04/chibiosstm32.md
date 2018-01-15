title: ChibiOS/RT on STM32 development
categories:
  - ARM
  - C++
published_date: "2013-08-04 00:00:00 +0100"
layout: post.liquid
data:
  shortlink: 426274c7
  type: blog
---
After publishing my article about development with [FreeRTOS](https://www.freertos.org) and the [LPCXpresso 1769](https://www.embeddedartists.com/products/lpcxpresso/lpc1769_xpr.php)
a few people mentioned i should try [ChibiOS/RT](http://www.chibios.org) and [STM32](http://www.st.com/en/microcontrollers/stm32-32-bit-arm-cortex-mcus.html) Microcontrollers too.

So i gave that a try. Here is what i used in this case:

* [Olimex STM32-P103](https://www.olimex.com/Products/ARM/ST/STM32-P103)
* [Segger J-Link](http://www.segger.com/j-link-edu.html)
* [ARM gcc compiler chain](https://launchpad.net/gcc-arm-embedded/+download)
* [vim](http://www.vim.org)
* [ChibiOS/RT](http://www.chibios.org)

<!-- more -->

![Olimex STM32](olimexstm32.jpg)

The gdb commands which need to be executed to start the program on the board differ a little bit from the LPC:

```bash
target remote localhost:2331
monitor interface swd
monitor endian little
monitor reset 0
monitor flash device = STM32F103RB
monitor speed 1000
monitor flash download = 1
monitor flash breakpoints = 1
file "build/ch.elf"
load
monitor reg r13 = 0x00000000
monitor reg pc = 0x00000004
break main
monitor reset
```

**Roundup**

Especially the HAL (Hardware abstraction layer) and the integration of the IP stack are very neat. In my next project i will use [ChibiOS/RT](http://www.chibios.org).
I found also the C++ abstractions handy. The [STM32](http://www.st.com/en/microcontrollers/stm32-32-bit-arm-cortex-mcus.html) line is also very nice, with the small exception that some LPCs are also available in a DIL packages.
