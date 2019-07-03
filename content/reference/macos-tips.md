+++
title = "Mac OS X Quick Tips"
[extra]
shortlink = "424eb70f"
+++

Here is a collection of Mac Quick Tips, i use often. It will be supplemented, every
time i find a new Tip.

### hidden files in Finder on/off

```bash
defaults write com.apple.finder AppleShowAllFiles -boolean true; killall Finder
defaults write com.apple.finder AppleShowAllFiles -boolean false; killall Finder
```

### show content of the ~/Library folder

```bash
chflags nohidden ~/Library
```

### special characters on german keyboard

| Character | Key combination |
|-----------|---|
| &#x007c;  | Alt + 7 |
| ~         | Alt + n |
| {         | Alt + ( |
| }         | Alt + ) |
| &#x005c;  | Alt + Shift + 7 (Alt + /) |
| [         | Alt + 5 |
| ]         | Alt + 6 |

### quit Application in Task Switch

press Q when the task is selected

### create/burn ISO Image from cmdline

```bash
hdiutil create -format UDTO -srcdevice /dev/disk2s0 cd.cdr
mv cd.cdr cd.iso

hdutil burn cd.iso
```

### boot time key functions

| key   | function |
|-------|---|
| alt   | boot different OS |
| N     | boot from netboot disk |
| T     | start in target disk mode |
| cmd-v | verbose mode |

### clipboard and comandline

With pbcopy and pbpaste the clipboard is accesible from the comandline. For example with

```bash
ls | pbcopy
```

you get an directory listing in the clipboard.

### limit size of backup.sparsebundle on server

```bash
hdiutil resize -size 200g -shrinkonly machine.sparseimage
```

### screen shots

| key                           | function |
|-------------------------------|---|
| cmd + shift + 3               | entire screen |
| cmd + shift + 4               | portion of screen |
| cmd + shift + 4 &#8594; space | entire window |
