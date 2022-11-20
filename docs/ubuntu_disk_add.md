# 우분투 디스크 추가 (ubuntu disk)

## 디스크 리스트

```
$ sudo fdisk -l
Disk /dev/vda: 64 GiB, 68719476736 bytes, 134217728 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: 85E7FD25-DCEE-4AC0-B222-9F380E8DB445

Device       Start       End   Sectors  Size Type
/dev/vda1     2048   2203647   2201600    1G EFI System
/dev/vda2  2203648   6397951   4194304    2G Linux filesystem
/dev/vda3  6397952 134215679 127817728 60.9G Linux filesystem


Disk /dev/vdb: 128 GiB, 137438953472 bytes, 268435456 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
```

## 디스크 이름 용량 확인

* 기존 디스크(vda): 64 GB
* 신규 디스크(vdb): 128 GB

## 디스크 파티션 (2TB 미만)

```bash
$ sudo fdisk /dev/vdb

Welcome to fdisk (util-linux 2.37.2).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.


Command (m for help):
```

### 파티션 생성(add a new partition)


```
Command: n
```

파티션 넘버: 디폴트

```
Partition number (1-128, default 1):
```

첫번째 섹터: 디폴트
```
First Sector (34-268435422, default 2048): 
```

마지막 섹터: 디폴트
```
Last sector, +/-sectors or +/-size{K,M,G,T,P} (2048-268435422, default 268435422):
```

파티션 생성됨
```
Created a new partition 1 of type 'Linux filesystem' and of size 128 GiB.
```

### 파티션 출력(print the partition table)


```
Command: p
Disk /dev/vdb: 128 GiB, 137438953472 bytes, 268435456 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: 2220C4F1-EBB7-4D40-A3D2-61EADFC6361B

Device     Start       End   Sectors  Size Type
/dev/vdb1   2048 268435422 268433375  128G Linux filesystem
```

### 파티션 저장 (write table to disk and exit)


```
Command: w

The partition table has been altered.
Calling ioctl() to re-read partition table.
Syncing disks.
```

## 디스크 포멧 (ext4)

```bash
$ sudo mkfs.ext4 /dev/vdb
```

## 디스크 마운트

UUID 확인

```bash
$ sudo blkid
/dev/vdb: UUID="071ca808-5e19-4dd1-ac37-2a297e723f34" BLOCK_SIZE="4096" TYPE="ext4"
```

마운트 디렉토리 생성

```bash
$ sudo mkdir /ext
```

부팅시 자동 마운트 설정

```
$ sudo vim /etc/fstab
UUID=071ca808-5e19-4dd1-ac37-2a297e723f34 /ext ext4 defaults 0 0
```

수동 마운트

```
$ sudo mount -a
```