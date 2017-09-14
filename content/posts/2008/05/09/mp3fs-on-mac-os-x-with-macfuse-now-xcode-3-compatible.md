extends: post.liquid
title: MP3FS on Mac OS X with MacFUSE now Xcode 3 compatible
shortlink: 42422032
date: 09 May 2008 00:00:00 +0100
type: blog
categories: ["Mac OS X"]
---

The original patch for mp3fs was made with the beta of Xcode 3.1 (because i am playing with my iPhone).
The patch now works with Xcode 3.0. Get the new patch for Xcode 3.0 [here](patch-mp3fs-012).

This is the crucial difference:

```diff
< +                     compatibilityVersion = "Xcode 3.0";
---
> +                     compatibilityVersion = "Xcode 3.1";
```
