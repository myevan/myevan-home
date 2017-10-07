# 하이퍼 V 우분투 디스크 확장 따라하기

## 환경 Environments

* Windows-10-Pro-x64
* Ubuntu-14.04-x64

## 우분투 가상 머신 종료 Shutdown Ubuntu Virtual Machine

```bash
$ sudo shutdown -P 0
```

## 하이퍼 V 가상 하드 디스크 파일 확장 Expand Hyper-V VHD File

* Hyper-V 관리자 실행
* 디스크 편집 클릭
* 가상 하드 디스크 편집 마법사 다이얼로그
    * 디스크 찾기: `C:\Users\Public\Documents\Hyper-V\Virtual Hard Disks\Ubuntu-14.04.5-x64.vhdx` 선택
    * 작업 선택: `확장` 선택
    * 새 크기: `20` GB 입력

## 우분투 가상 머신 디스크 확장 Expand Ubuntu Virtual Machine Disk

cfdisk 를 실행합니다.

```bash
$ sudo cfdisk
```

* sda5 아래 `FreeSpace` 선택합니다.
* `New`를 선택합니다.
* `Logical`을 선택합니다.
* Size는 `디폴트값`(전체 크기)를 입력합니다.
* `Type`을 선택합니다.
* Enter filesystem type 을 `8e`(Linux LVM) 로 입력합니다.
* `Write`을 선택합니다.
* `Quit` 을 선택합니다.

재부팅합니다.

```bash
$ sudo reboot
```

새로운 물리 볼륨을 생성합니다.

```bash
$ sudod pvcreate /dev/sda6
  Physical volume "/dev/sda6" successfully created
```

볼륨 그룹 이름을 알아냅니다.

```bash
$ sudo lvdisplay
  --- Logical volume ---
  LV Path                /dev/ubuntu-vg/root
  LV Name                root
  VG Name                ubuntu-vg
  LV UUID                u00dDt-ciSk-0wRa-3UF5-riUy-LtaB-i612Qx
  LV Write Access        read/write
  LV Creation host time ubuntu, 2017-03-20 18:26:52 +0900
  LV Status              available
  # open                 1
  LV Size                8.76 GiB
  Current LE             2242
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           252:0

  --- Logical volume ---
  LV Path                /dev/ubuntu-vg/swap_1
  LV Name                swap_1
  VG Name                ubuntu-vg
  LV UUID                i4cKYp-vHd9-6lsi-uBI8-GQv0-ur1f-WG7mbv
  LV Write Access        read/write
  LV Creation host, time ubuntu, 2017-03-20 18:26:52 +0900
  LV Status              available
  # open                 2
  LV Size                1.00 GiB
  Current LE             256
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           252:1
```

볼륨 그룹에 새로운 파티션을 추가해줍니다.

```bash
$ sudo vgextend ubuntu-vg /dev/sda6
  Volume group "ubuntu-vg" successfully extended
```

루트 로직컬 볼륨 크기를 조절합니다.

```bash
$ sudo lvresize -l +100%FREE /dev/ubuntu-vg/root
  Extending logical volume root to 18.75 GiB
  Logical volume root successfully resized
```

파일 시스템 크기도 조절합니다.

```bash
$ sudo resize2fs /dev/ubuntu-vg/root
resize2fs 1.42.9 (4-Feb-2014)
Filesystem at /dev/ubuntu-vg/root is mounted on /; on-line resizing required
old_desc_blocks = 1, new_desc_blocks = 2
The filesystem on /dev/ubuntu-vg/root is now 4916224 blocks long.
```

변경 여부를 확인합니다.

```bash
$ df -H
Filesystem      Size  Used Avail Use% Mounted on
udev            504M  4.1k  504M   1% /dev
tmpfs           104M  410k  103M   1% /run
/dev/dm-0        20G  1.4G   18G   8% /
none            4.1k     0  4.1k   0% /sys/fs/cgroup
none            5.3M     0  5.3M   0% /run/lock
none            516M     0  516M   0% /run/shm
none            105M     0  105M   0% /run/user
/dev/sda1       247M   43M  192M  19% /boot
```