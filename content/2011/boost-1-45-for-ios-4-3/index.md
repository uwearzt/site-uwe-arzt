+++
title = "boost 1.45 for iOS 4.3"
date = 2011-01-30
[taxonomies]
categories = ["ios", "c++"]
[extra]
shortlink = "423606fc"
+++

Create an user-config.jam in your home directory (with your actual compiler path)

```jam
using darwin : 4.2.1~iphone
   : /Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/gcc-4.2
      -arch armv7 -mthumb -fvisibility=hidden -fvisibility-inlines-hidden
   : <striper>
   : <architecture>arm <target-os>iphone
   ;

using darwin : 4.2.1~iphonesim
   : /Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin/gcc-4.2
      -arch i386 -fvisibility=hidden -fvisibility-inlines-hidden
   : <striper>
   : <architecture>x86 <target-os>iphone
   ;]]>
```

<!-- more -->

compile for device

```bash
./bjam --prefix=${HOME}/Developer/Platforms/iPhoneOS.platform/Developer/
 SDKs/iPhoneOS4.3.sdk/usr toolset=darwin architecture=arm
  target-os=iphone macosx-version=iphone-4.3
  define=_LITTLE_ENDIAN link=static install
```

compile for simulator

```bash
./bjam --prefix=${HOME}/Developer/Platforms/iPhoneSimulator.platform/Developer/
  SDKs/iPhoneSimulator4.3.sdk/usr toolset=darwin architecture=x86
  target-os=iphone macosx-version=iphonesim-4.3 link=static install
```
