+++
title = "Linux Quick Tips"

aliases = [
  "427c93d0"
]
+++

## ZFS

| description | command | example |
| ----------- | ------- | ------- |
| create snapshot | zfs snapshot [pool]@[name] | zfs snapshot data@2021_04_22 |
| delete snapshot | zfs destroy [pool]@[name] | zfs destroy data@2021_04_22 |
| list snapshots | zfs list -t snapshot | |

## systemd

### check status

```bash
systemctl status [myservice].service
```

### enable at system (re)start

```bash
systemctl enable [myservice].service
```

## filesystem

### get the UUID for a filesystem

```bash
blkid /dev/sdb1
```
