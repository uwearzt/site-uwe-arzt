extends: post.liquid

title: eibd and Mac OS X
date: 23 Apr 2009 00:00:00 +0100
type: blog
categories: ["Home Automation", "Mac OS X"]
---

At the moment i am testing if a swap of my current GNU/Linux server running Ubuntu to an Mac Mini with an external RAID and Mac OS X
is possible. For that i have created an eibd for connecting with my Home Automation KNX bus.

For a discussion about compiling the eibd on Mac OS X see (in german language) [knx-user-forum.de](http://knx-user-forum.de/knx-eib-forum/4323-eibd-o-ae-fuer-apple-mac-2.html).

<!-- more -->

Here a short description how it can be compiled:

1. Download pthsem and bcusdk. You can use the version i used: [pthsem](http://bcusdk.git.sourceforge.net/git/gitweb.cgi?p=bcusdk;a=snapshot;h=0a0207ed3c5098af460f6f27f15f1761be8847ef;sf=tgz),
[bcusdk](http://repo.or.cz/w/bcusdk.git?a=snapshot;h=7d5371f4dc043e0f92211a3e2b671b59f824cfa7;sf=tgz) or a latest and greatest head version:
[pthsem](http://bcusdk.git.sourceforge.net/git/gitweb.cgi?p=bcusdk;a=snapshot;h=refs/heads/pthsem/master;sf=tgz),
[bcusdk](http://bcusdk.git.sourceforge.net/git/gitweb.cgi?p=bcusdk;a=snapshot;h=HEAD;sf=tgz).

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
