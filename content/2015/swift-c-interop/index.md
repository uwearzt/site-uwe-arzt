+++
title = "Example project for Swift C Interop"
date = 2015-09-15

aliases = [
  "42874072"
]

[taxonomies]
categories = ["programming"]

[extra]
project_url = "https://github.com/uwearzt/Swift-C-Interop.git"
+++

I started to learn Swift 2.0, an how to integrate with C. Therefore i have created a small Swift-C Interoperabilty
project, which can be found on [github](https://github.com/uwearzt/Swift-C-Interop.git).

As soon as i will start to wrap some C/C++ Libs, more examples will be added.

There was also a nice Swift compiler crash, which you can test with your environment too, just clone my github
project, uncomment the line leading to the compiler crash and comment the correct line.

<!-- more -->

```swift
// This crashes the compiler:
//   Version 7.0 beta 6 (7A192o)
//   Version 7.1 beta (7B60)
//let myCallback : @convention(c) (i: Int) -> Int = {
// works
let myCallback : @convention(c) (Int) -> Int = {
}
```

If it crashes in your environment too, send Apple a bug report.
