title: MP3FS on Mac OS X with MacFUSE
categories:
  - Mac OS X
published_date: "2008-03-27 00:00:00 +0100"
layout: post.liquid
data:
  type: blog
  shortlink: 429bf320
---
My music collection is stored in the FLAC format (see <http://flac.sf.net>), but iTunes for my iPhone is not able to read FLAC-Files. So i decided to give MP3FS a try on my Mac.

1. Install the MacFUSE dmg 1.3.1 from <http://code.google.com/p/macfuse/> (the MacPorts Port is a little bit outdated at the moment).
2. Install libflac, liblame and id3tag from MacPorts (sudo /opt/local/bin/port install lame flac libid3tag).
3. Download and unpack the mp3fs-0.12.tar.gz from <http://mp3fs.sourceforge.net/>.
4. Change Directory to mp3fs-0.12 and install my small [patch](patch-mp3fs-012)
(Upgrades to Interface Version 26, changes the includes for statfs and provides an Xcode project) with:

```
patch -p1 < ../patch-mp3fs-012
```

(diff was created with:

```
diff -ruN mp3fs-0.12.org mp3fs > patch-mp3fs-012
```

5. Start the Xcode project and compile.
6. If everything worked, mount your mp3fs and enjoy.

<!-- more -->

If you like to know what you are doing, here are the source diffs:

```
23c23
< #define FUSE_USE_VERSION 22
---
> #define FUSE_USE_VERSION 26
32a33,36
> #ifdef __APPLE__
>      #include <sys/param.h>
>      #include <sys/mount.h>
> #else
33a38
> #endif
194c199
< static int mp3fs_statfs(const char *path, struct statfs *stbuf) {
---
> static int mp3fs_statfs(const char *path, struct statvfs *stbuf) {
203c208
<   res = statfs(name, stbuf);
---
>   res = statvfs(name, stbuf);
268c273
<   fuse_main(argc-1, argv+1, &mp3fs_ops);
---
>   fuse_main(argc-1, argv+1, &mp3fs_ops, NULL);
diff -r mp3fs-0.12.org/src/transcode.c mp3fs/src/transcode.c
26a27,30
> #ifdef __APPLE__
>       #include <sys/param.h>
>       #include <sys/mount.h>
> #else
27a32
> #endif
```
