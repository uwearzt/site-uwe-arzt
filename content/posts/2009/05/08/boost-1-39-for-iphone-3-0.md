title: boost 1.39 for iPhone 3.0
categories:
  - Programming
  - iOS
  - OS
published_date: "2009-05-08 00:00:00 +0100"
layout: post.liquid
data:
  shortlink: 42b87dff
  type: blog
---
### Recommended reading

There are a couple of Mailings on the boost-mailinglist about building Boost for the iPhone:

* <s>http://old.nabble.com/iphone-port-td20407642.html</s>
* <s>http://old.nabble.com/building-boost-for-iphone-td22022131.html</s>

<!-- more -->

## Create an user-config.jam (with your actual compiler path)

```jam
using darwin : 4.2.1~iphone
   :
/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/g++
   : <striper>
   : <architecture>arm <target-os>iphone <macosx-version>iphone-3.0
   ;
using darwin : 4.2.1~iphonesim
   :
/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin/g++
   : <striper>
   : <architecture>x86 <target-os>iphone <macosx-version>iphonesim-3.0
   ;
```

## Edit the darwin.jam in /tools/build/v2/tools/darwin.jam

Here is a patchfile, but you can type it in a second :)

```patch
--- boost_1_39_0/tools/build/v2/tools/darwin.jam    2009-04-14 09:59:30.000000000 +0200
+++ boost_1_39_0.patched/tools/build/v2/tools/darwin.jam    2009-05-08 10:45:59.000000000 +0200
@@ -23,6 +23,7 @@
 ## The MacOSX versions we can target.
 .macosx-versions =
     10.6 10.5 10.4 10.3 10.2 10.1
+    iphone-3.0 iphonesim-3.0
     iphone-2.3 iphonesim-2.3
     iphone-2.2 iphonesim-2.2
     iphone-2.1 iphonesim-2.1
```

## Compile

```bash
bjam toolset=darwin architecture=arm target-os=iphone macosx-version=iphone-3.0 define=_LITTLE_ENDIAN
bjam toolset=darwin architecture=x86 target-os=iphone macosx-version=iphonesim-3.0
```
