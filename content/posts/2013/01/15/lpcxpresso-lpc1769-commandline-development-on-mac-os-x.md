---
title: LPCXpresso LPC1769 commandline Development on Mac OS X
categories:
  - ARM
published_date: "2013-01-15 00:00:00 +0100"
layout: post.liquid
data:
  type: blog
  shortlink: 424c3fb4
---
Because editing with [vim](http://www.vim.org) is my preferred way of creating software, i do
not use the Eclipse based software delivered together with the LPCXpresso.

Here i describe, what is necessary to compile, flash and debug the LPCXpresso with the
FreeRTOS blinking example from the commandline with:

* [LPCXpresso 1769](https://www.nxp.com/support/developer-resources/hardware-development-tools/lpcxpresso-boards/lpcxpresso-board-for-lpc1769)
* [Segger J-Link](https://www.segger.com/j-link-edu.html)
* [ARM gcc compiler chain](https://launchpad.net/gcc-arm-embedded/+download)
* [vim](http://www.vim.org)
* [cmake](https://www.cmake.org)
* [Breadboard Power Supply](https://www.sparkfun.com/products/8376)
* [FreeRTOS](https://www.freertos.org)

<!-- more -->

### Preparation of the LPCXpresso

Cut off the LPC-Link (this one only works with the CodeRed IDE) and solder Pinheaders to the
JTAG Interface and the socket connectors for using the LPCXpresso in a Breadboard.

![LPCXpresso](LPCXpresso.jpg)

### JTAG cable

Wire an JTAG Adapter cable for the connection between the J-Link and the LPCXpresso.

<table>
	<thead>
		<tr><th></th><th>J-Link Pin</th><th>LPCXpresso Pin</th></tr>
	</thead>
	<tbody>
		<tr><td>VTRef</td><td>1</td><td>1</td></tr>
		<tr><td>TMS</td><td>7</td><td>2</td></tr>
		<tr><td>TCK</td><td>9</td><td>3</td></tr>
		<tr><td>TDO</td><td>13</td><td>4</td></tr>
		<tr><td>TDI</td><td>5</td><td>5</td></tr>
		<tr><td>RESET</td><td>15</td><td>6</td></tr>
		<tr><td></td><td>nc</td><td>nc</td></tr>
		<tr><td>GND</td><td>20</td><td>8</td></tr>
	</tbody>
</table>

The easiest solution is to take a ribbon cable, and cut all non necessary wires. Then solder
the remaining wires to 8-pin female header and a small piece of prototyoe board.
![LPCXpresso JTAG](LPCXpresso_JTAG_1.jpg)

I covered the the prototype board with duct tape and use a cable tie as strain relief.
![LPCXpresso JTAG](LPCXpresso_JTAG_2.jpg)

### Plug the hardware together

For our the Demo you need an additional power supply. If you use the original LPC-Link,
power is provided through the USB on the LPC-Link. You need 3.3V, basically every power
supply with 3.3V will work.
![LPCXpresso Demo](LPCXpresso_Demo.jpg)

### Installation of compiler and gdbserver

Download the arm-gcc package for Mac OS X (which is provided by ARM) and the gdbserver
from the links above. I have installed both under the /opt directory. If you choose a
different installation directory, the path settings in the demo project must be changed
accordingly.

### Installation of cmake

One of the easiest ways is to install [macports](https://www.macports.org) and compile cmake with

```
sudo port install cmake
```

afterwards.

### Compile and start RTOS Example

Download the [example](FreeRTOSDemo.tar.bz2) and extract it with

```
tar jxf FreeRTOSDemo.tar.bz2
```

Step into the build directory

```
cd FreeRTOSDemo/build
```

Generate Makefiles from the projectdefinition and build the project

```
cmake .. ; make
```

Start the gdbserver creating a connection to the J-LINK with

```
make gdbserver
```

In a second windows start gdb, which executes a provided command file to load the
FreeRTOSDemo into the flash memory, afterthat sets a breakpoint at main() and executes
the program.

```
make gdb
```

You can also type in the steps one by one, which allows to see what is happening on the
JTAG adapter with a logic analyzer.

```
target remote localhost:2331
monitor interface SWD
monitor reset
monitor flash device = LPC1769
monitor flash download = 1
monitor flash breakpoints = 1
file "FreeRTOSTest.elf"
load
monitor reg r13 = 0x00000000
monitor reg pc = 0x00000004
break main
monitor reset
continue
```


<div class="comments">
<hr class="comments-ruler" />
<div class="comments-level-1">
<p class="comments-author">Michael Ring says</p>
<p class="comments-date">2013/05/13</p>
<p>
One possible optimization is to use the on board power supply of the J-Link Adapter on
pin19 of the JTAG connector. Then you only need a TS1117 low drop voltage regulator and
two 10uF capacitors and you have 3.3Volts supply voltage available.
</p>
<p>
Or, even more simple, you simple do not cut the board in pieces and simply remove the
small solder bridges from pin two to pin 6. You can then use the original USB-connector
of the lpc-link to supply the 3.3 Volts on Pin 1 and 8(GND), you also then have
5 Volts available through pin 7.
</p>
</div>
</div>
