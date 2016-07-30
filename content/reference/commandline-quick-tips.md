+++
title = "Commandline Quick Tips"
date  = "2013-03-03"
type = "page"
categories = [""]
+++

Here is a collection of Commandline Quick Tips, i use often. It will be supplemented, every time i find a new Tip. Normally this tips work flawless on Linux and Mac OS X.

### screen keyboard commands

#### running session

| key      | mapping |
|----------|---------|
| ctrl+a d | detach from screen session |
| ctrl+a n | next screen |
| ctrl+a p | previous screen |
| ctrl+a c | create screen |
| ctrl+a " | list screens |
| ctrl+a i | info |
| ctrl+a k | kill |
| ctrl+a A | rename |
| ctrl+a ESC | activate scroll back buffer |

#### startup

| key | mapping |
|-----|---------|
| -S [name] | start session with [name] |
| -list | list all sessions |
| -r [name] | reattach session [name] |
| -D -r [name] | reattach session [name] after connection lost |
| -D -r [name] | reattach session [name] after connection lost |
| /dev/cu.serial [speed]| attach to serial port |

### git commands

often i use [Tower](http://www.git-tower.com/) on my Mac for all kinds of git stuff. But some things are faster to do on the commandline, or need to be automated i.e. inside Makefiles.

| command |    |
|---------|----|
| git clean -f -d | remove all untracked files and directories |
| git log --oneline --graph --color --all --decorate | nice commandline commit graph |
