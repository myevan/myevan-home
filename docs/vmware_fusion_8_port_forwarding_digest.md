# VM 웨어 퓨전 8 정적 IP 설정

<https://medium.com/@tuweizhong/how-to-setup-port-forward-at-vmware-fusion-8-for-os-x-742ad6ca1344#.8761w21h2>

NAT 설정 파일을 편집합니다

```bash
$ sudo vi /Library/Preferences/VMware\ Fusion/vmnet8/nat.conf
```

`[incomingtcp]`을 찾은 다음 외부-내부 포트 맵핑을 추가합니다.

```diff
[incomingtcp]
# Use these with care — anyone can enter into your VM through these…
# The format and example are as follows:
#<external port number> = <VM’s IP address>:<VM’s port number>
#8080 = 172.16.3.128:80
+8010 = 192.168.149.10:80
+2010 = 192.168.149.10:22
```

VM 웨어 퓨전 네트워크 서비스를 재시작합니다.

```bash
$ sudo /Applications/VMware\ Fusion.app/Contents/Library/vmnet-cli --stop
$ sudo /Applications/VMware\ Fusion.app/Contents/Library/vmnet-cli --start
```

VM 웨어 퓨전 설정 파일은 업그레이드될때마다 리셋되므로 백업해놓는 것이 좋습니다.