+++
title = "Linux Quick Tips"

aliases = [
  "427c93d0"
]
+++

## systemd

### check status

```bash
systemctl status [myservice].service
```

### enable at system (re)start

```bash
systemctl enable [myservice].service
```

### get the UUID for a filesystem

```bash
blkid /dev/sdb1
```
