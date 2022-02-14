+++
title = "Commandline Quick Tips"

aliases = [
  "42ea2a3b",
  "/reference/commandline-quick-tips.html"
]
+++

Here is a collection of Commandline Quick Tips, i use often. It will be supplemented, every time i
find a new Tip. Normally this tips work flawless on Linux and Mac OS X.

## tmux

| key        | mapping |
|------------|---|
| ctrl+b c   | create a new windows |
| ctrl+b p   | switch to previous windows |
| ctrl+b n   | switch to next window windows |
| ctrl+b 0-9 | switch to windows n |
| ctrl+b d   | deatch session |
| ctrl+b w   | choose from list |
| ctrl+b ,   | rename window |
| ctrl+b %   | split horizontal |
| ctrl+b "   | split vertical |
| ctrl+b o   | goto next |
| ctrl+b ;   | toogle current/previous |
| ctrl+b x   | close |
| ctrl+b [   | history mode |

| command |   |
|---------|---|
| ```tmux new -s session_name``` | create a named session |
| ```tmux ls```| list sessions |
| ```tmux attach-session -t session_name``` | attach to session |

## minicom

| parameter  |   |
|------------|---|
| --device /dev/cu.tty&lt;xxx&gt;  | serial device e.g ```/dev/cu.ttyUSB0``` |
| --baudrate 9600            |  |
| --capturefile=&lt;FILE&gt; | capture to file  |

## git/github

| command                                            |   |
|----------------------------------------------------|---|
| git status --ignored                               | show ignored files too |
| git clean -f -d                                    | remove all untracked files and directories |
| git log --oneline --graph --color --all --decorate | nice commandline commit graph |
| git remote -v                                      | show remotes |
| git remote add upstream ```remoteurl```            | add additional remote |
| git fetch upstream                                 | fetch the upstream changes (repo forked from) |
| git merge upstream/master                          | merge the upstream changes (repo forked from) |

## WOL

```bash
wakeonlan -i 192.168.20.255 AC:87:A3:19:BF:D9
```
