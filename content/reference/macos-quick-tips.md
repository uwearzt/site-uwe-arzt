extends: default.liquid

title: Mac OS X Quick Tips
---

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

<table>
	<thead>
		<tr><th>Character</th><th>Key combination</th></tr>
	</thead>
	<tbody>
		<tr><td>&#x007c;</td><td>Alt + 7</td></tr>
		<tr><td>~</td><td>Alt + n</td></tr>
		<tr><td>{</td><td>Alt + (</td></tr>
		<tr><td>}</td><td>Alt + )</td></tr>
		<tr><td>&#x005c;</td><td>Alt + Shift + 7 (Alt + /)</td></tr>
		<tr><td>[</td><td>Alt + 5</td></tr>
		<tr><td>]</td><td>Alt + 6</td></tr>
	</tbody>
</table>

### quit Application in Task Switch
press Q when the task is selected

### create/burn ISO Image from cmdline

```bash
hdiutil create -format UDTO -srcdevice /dev/disk2s0 cd.cdr
mv cd.cdr cd.iso

hdutil burn cd.iso
```

### boot time key functions

<table>
	<thead>
		<tr><th>key</th><th>function</th></tr>
	</thead>
	<tbody>
		<tr><td>alt</td><td>boot different OS</td></tr>
		<tr><td>N</td><td>boot from netboot disk</td></tr>
		<tr><td>T</td><td>start in target disk mode</td></tr>
		<tr><td>cmd-v</td><td>verbose mode</td></tr>
	</tbody>
</table>

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

<table>
	<thead>
		<tr><th>key</th><th>function</th></tr>
	</thead>
	<tbody>
		<tr><td>cmd + shift + 3</td><td>entire screen</td></tr>
		<tr><td>cmd + shift + 4</td><td>portion of screen</td></tr>
		<tr><td>cmd + shift + 4 &#8594; space</td><td>entire window</td></tr>
	</tbody>
</table>
