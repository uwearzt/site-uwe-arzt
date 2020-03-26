+++
title = "CAN bus on Raspberry Pi with Stretch"
date = 2017-12-25

aliases = [
  "424a02b1",
  "/posts/2017/12/25/raspberry-can.html"
]

[taxonomies]
categories = ["linux"]
+++
I needed to install my
[CAN Board](http://skpang.co.uk/catalog/pican2-canbus-board-for-raspberry-pi-23-p-1475.html)
on my Raspberry after some time not using it.
Because most of the copy/paste stuff is for the older distribution(s), here how to install
with Stretch (in my case `2017-11-29-raspbian-stretch.img`).

1. Add to `/boot/config.txt`

```bash
dtparam=spi=on
dtoverlay=mcp2515-can0,oscillator=16000000,interrupt=25
```

2. Add file `/etc/network/interfaces.d/can0`

```bash
auto can0
iface can0 inet manual
    pre-up /sbin/ip link set $IFACE type can bitrate 1000000 triple-sampling on
    up /sbin/ifconfig $IFACE up
    down /sbin/ifconfig $IFACE down
```

Reboot and you should see the can interface with ifconfig. Even faster you could use my
<s>rpi-can</s> role for Ansible.
