+++
title = "Commandline Quick Tips"

aliases = [
  "42ea2a3b",
  "/reference/commandline-quick-tips.html"
]
+++

Here is a collection of Commandline Quick Tips, i use often. It will be supplemented, every time i
find a new Tip. Normally this tips work flawless on Linux and Mac OS X.

### tmux keyboard commands

| key        | mapping |
|------------|---|
| ctrl+b c   | create a new windows |
| ctrl+b p   | switch to previous windows |
| ctrl+b n   | switch to next window windows |
| ctrl+b 0-9 | switch to windows n |
| ctrl+b c   | create a new windows |
| ctrl+b c   | create a new windows |

### screen keyboard commands

#### running session

| key        | mapping |
|------------|---|
| ctrl+a d   | detach from screen session |
| ctrl+a n   | next screen |
| ctrl+a p   | previous screen |
| ctrl+a c   | create screen |
| ctrl+a "   | list screens |
| ctrl+a i   | info |
| ctrl+a k   | kill |
| ctrl+a A   | rename |
| ctrl+a ESC | activate scroll back buffer |

#### startup

| key                    | mapping |
|------------------------|---|
| -S [name]              | start session with [name] |
| -L                     | create Log |
| -list                  | list all sessions |
| -r [name]              | reattach session [name] |
| -D -r [name]           | reattach session [name] after connection lost |
| -D -r [name]           | reattach session [name] after connection lost |
| /dev/cu.serial [speed] | attach to serial port |

### git/github commands

| command                                            |   |
|----------------------------------------------------|---|
| git status --ignored                               | show ignored files too |
| git clean -f -d                                    | remove all untracked files and directories |
| git log --oneline --graph --color --all --decorate | nice commandline commit graph |
| git remote -v                                      | show remotes |
| git remote add upstream ```remoteurl```            | add additional remote |
| git fetch upstream                                 | fetch the upstream changes (repo forked from) |
| git merge upstream/master                          | merge the upstream changes (repo forked from) |
