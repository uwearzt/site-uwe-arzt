+++
title = "eibd and Mac OS X"
date = 2009-04-23

aliases = [
  "/2009/04/23/eibd-and-mac-os-x/",
  "/2009/04/23/eibd-and-mac-os-x/index.html",
  "42db16db"
]

[taxonomies]
categories = ["knx", "macos"]
+++
At the moment i am testing if a swap of my current GNU/Linux server running Ubuntu to an Mac Mini with an external RAID and Mac OS X
is possible. For that i have created an eibd for connecting with my Home Automation KNX bus.

For a discussion about compiling the eibd on Mac OS X see (in german language) [knx-user-forum.de](http://knx-user-forum.de/knx-eib-forum/4323-eibd-o-ae-fuer-apple-mac-2.html).

<!-- more -->

Here a short description how it can be compiled:

1. Download pthsem and bcusdk. You can use the version i used: <s>pthsem</s>, <s>bcusdk</s>.
2. Unpack both tarfiles (Attention, they both unpack to the same directory name. So, rename the first and unpack the second).
3. Step into the pthsem directory and

```bash
./configure --prefix=/opt/knx
make
sudo make install
```

4. Step into the bcusdk directory and

```bash
aclocal -I m4 -I /opt/knx/share/aclocal
autoheader
automake -a --foreign
autoconf
./configure --enable-onlyeibd --enable-eibnetip --enable-eibnetiptunnel --enable-eibnetipserver --prefix=/opt/knx
    --with-pth=/opt/knx
make
sudo make install
```

5. Set the DYLD_LIBRARY_PATH to */opt/knx/lib*


6. Now you are ready to run (and the files should be built in the same way as in the provided tar).


You can also download my prebuilt binaries as [tar](eibd.tar.gz). Unpack it, set DYLD_LIBRARY_PATH and you can run
the eibd directly. When i decide to run an Mac OS X Server in the future, i will built an MacPorts package.

### Starting and using eibd

Start the eibd with the command (this is the "standard" multicast address for KNX routers):

```bash
/opt/knx/bin/eibd -i -d ip:224.0.23.12
```

Switch a light with (if the groupaddress 0/1/3 is associated with a light):

```bash
/opt/knx/bin/groupswrite ip:localhost 0/1/3 1
```
