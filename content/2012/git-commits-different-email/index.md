+++
title = "git commits with different EMail addresses"
date = 2012-04-27

aliases = [
  "42629108"
]

[taxonomies]
categories = ["other"]
+++

If you do (like me) a lot of git clones for different branches etc on a lot of different projects, the chances are high,
that you want to have different EMails for checkins. You can update the local .git/config file for every clone, but that is a error prone process.

I have written an alias for git, which sets the GIT_AUTHOR_EMAIL environment variable according to the setting of the remote origin for the git repo.
If it is a local repo, the standard EMail from .gitconfig is used.

<!-- more -->

It is used in zsh by me, so if you use a different shell, your mileage may vary.

```bash
function git_email {
  gitemail=mail@uwe-arzt.de
  repodir=`/usr/bin/git config --get remote.origin.url`
  reponame=$(basename -- "$repodir")

  if [ $reponame ]
  then
    while read line
    do
      email=${line/*:/}
      repo=${line/:*/}
      if [[ $repo == $reponame ]]; then
        gitemail=$email
      fi
    done < $HOME/.gitemail
  fi

  echo $gitemail
}

# alias
alias git='GIT_AUTHOR_EMAIL=$(git_email) /usr/bin/git'
```

Here is a part of the .gitemail file i use.

```
Robotics.git:mail@uwe-arzt.de
parstream.git:uwe.arzt@parstream.com
```
