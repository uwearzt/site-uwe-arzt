+++
title = "MP3FS on Mac OS X with MacFUSE now Xcode 3 compatible"
date = 2008-05-09

aliases = [
  "42422032"
]

[taxonomies]
categories = ["macos"]
+++
The original patch for mp3fs was made with the beta of Xcode 3.1 (because i am playing with my iPhone).
The patch now works with Xcode 3.0. Get the new patch for Xcode 3.0 [here](patch-mp3fs-012.patch).

This is the crucial difference:

```diff
< +                     compatibilityVersion = "Xcode 3.0";
---
> +                     compatibilityVersion = "Xcode 3.1";
```
