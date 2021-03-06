+++
title = "Ansible Swift RPi install"
date = 2016-01-09

aliases = [
  "421dd501",
  "/posts/2016/01/09/ansible-rpi-swift.html"
]

[taxonomies]
categories = ["linux"]
+++

A friend of mine wanted to install the (very beta) <s>Swift Compiler</s> for the
[Raspberry Pi](https://www.raspberrypi.org) in his classroom. He is going to teach some
Swift Coding on the RPi. Because we had to install on multiple machines we decided to go
with Ansible.

After some cleanup in my Ansible Repo you will find the latest and greatest Version on
github too.

<!-- more -->

```yml
---
- name: install swift on rpi
  hosts: rpi
  sudo: True

  tasks:
    - name: install swift repository key
      apt_key: url=http://dev.iachieved.it/iachievedit.gpg.key state=present

    - name: add swift repository
      copy: src=files/swiftarm.sources.list dest=/etc/apt/sources.list.d

    - name: install clang repository key
      apt_key: url=http://repos.rcn-ee.com/debian/conf/repos.rcn-ee.net.gpg.key state=present

    - name: add clang repository
      copy: src=files/clangarm.sources.list dest=/etc/apt/sources.list.d

    - name: install clang
      apt: name={{ item }} update_cache=yes
      with_items:
        - libicu-dev
        - clang-3.6

    - name: update alternatives
      command: update-alternatives --install /usr/bin/clang clang /usr/bin/clang-3.6 100
      command: update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-3.6 100

    - name: install swift
      apt: name={{ item }} update_cache=yes
      with_items:
        - swift-2.2
```
