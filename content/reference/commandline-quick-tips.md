extends: default.liquid

title: Commandline Quick Tips
shortlink: 42ea2a3b
---

Here is a collection of Commandline Quick Tips, i use often. It will be supplemented, every time i 
find a new Tip. Normally this tips work flawless on Linux and Mac OS X.

### screen keyboard commands

#### running session

<table>
	<thead>
		<tr><th>key</th><th>mapping</th></tr>
	</thead>
	<tbody>
		<tr><td>ctrl+a d</td><td>detach from screen session</td></tr>
		<tr><td>ctrl+a n</td><td>next screen</td></tr>
		<tr><td>ctrl+a p</td><td>previous screen</td></tr>
		<tr><td>ctrl+a c</td><td>create screen</td></tr>
		<tr><td>ctrl+a "</td><td>list screens</td></tr>
		<tr><td>ctrl+a i</td><td>info</td></tr>
		<tr><td>ctrl+a k</td><td>kill</td></tr>
		<tr><td>ctrl+a A</td><td>rename</td></tr>
		<tr><td>ctrl+a ESC</td><td>activate scroll back buffer</td></tr>
	</tbody>
</table>

#### startup

<table>
	<thead>
		<tr><th>key</th><th>mapping</th></tr>
	</thead>
	<tbody>
		<tr><td>-S [name]</td><td>start session with [name]</td></tr>
		<tr><td>-L</td><td>create Log</td></tr>
		<tr><td>-list</td><td>list all sessions</td></tr>
		<tr><td>-r [name]</td><td>reattach session [name]</td></tr>
		<tr><td>-D -r [name]</td><td>reattach session [name] after connection lost</td></tr>
		<tr><td>-D -r [name]</td><td>reattach session [name] after connection lost</td></tr>
		<tr><td>/dev/cu.serial [speed]</td><td>attach to serial port</td></tr>
	</tbody>
</table>

### git commands

often i use [Tower](http://www.git-tower.com/) on my Mac for all kinds of git stuff. But some 
things are faster to do on the commandline, or need to be automated i.e. inside Makefiles.

<table>
	<thead>
		<tr><th>command</th><th></th></tr>
	</thead>
	<tbody>
		<tr>
			<td>git clean -f -d</td>
			<td>remove all untracked files and directories</td>
		</tr>
		<tr>
			<td>git log --oneline --graph --color --all --decorate</td>
			<td>nice commandline commit graph</td>
		</tr>
	</tbody>
</table>
