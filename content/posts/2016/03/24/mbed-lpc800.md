extends: post.liquid

title: mbed Online Compiler and LPC800
shortlink: 427d3070

date: 24 Mar 2016 00:00:00 +0100

type: "blog"
categories: [ ARM, C++ ]
---

I have build some of the small [LPC800](https://github.com/cpldcpu/LPC812breakout) Breakout
Boards. 

To program them with the online [mbed](https://developer.mbed.org) compiler,
the resulting bin files have to be changed with the following command:

```bash
arm-none-eabi-objcopy -I binary -O ihex mbed_blink_LPC812.bin mbed_blink_LPC812.hex
```

The [arm compiler](https://launchpad.net/gcc-arm-embedded) toolchain should be installed in your path.

<!-- more -->

Here a small sample program for blinking an LED:

```cpp
// ------------------------------------------------------------------------------
// Copyright by Uwe Arzt mailto:mail@uwe-arzt.de, https://uwe-arzt.de
// under BSD License, see https://uwe-arzt.de/bsd-license
// ------------------------------------------------------------------------------
#include "mbed.h"

DigitalOut LED(P0_0);

int main(int argc, char* argv[]) {
	while(true) {
        wait(0.5);
        LED = !LED;
    
	}      
}
```

You can program the resulting hex file with [FlashMagic](http://www.flashmagictool.com)
and a USB to serial Adapter. 

I use FlashMagic on Windows(inside a virtual machine), because on Mac OS X the installation
of XQuartz is required.

![FlashMagic Screenshot](FlashMagic.png)

and the result:

![Blinking LPC812](LPC800_blink.jpg)