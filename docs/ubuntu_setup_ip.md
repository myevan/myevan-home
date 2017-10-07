# 우분투 IP 설정 따라하기

## 동적 IP

```bash
$ sudo vim /etc/network/interfaces
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
auto eth0
iface eth0 inet dhcp
```

## 정적 IP

```bash
$ sudo vim /etc/network/interfaces
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
auto eth0
iface eth0 inet static
        address AAA.BBB.CCC.DDD
        netmask 255.255.255.0
        network AAA.BBB.CCC.0
        broadcast AAA.BBB.CCC.255
        gateway AAA.BBB.CCC.GGG 
        dns-nameservers XXX.XXX.XXX.XXX
```

## 이더넷 재시작

```bash
$ sudo ifdown eth0 && sudo ifup eth0
```
