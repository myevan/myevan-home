# VM 웨어 퓨전 8 정적 IP 설정

<https://medium.com/@tuweizhong/how-to-setup-port-forward-at-vmware-fusion-8-for-os-x-742ad6ca1344#.8761w21h2>

DHCP 데몬 설정 파일을 편집합니다.

```bash
sudo vim /Library/Preferences/VMware\ Fusion/vmnet8/dhcpd.conf
```

`DO NOT MODIFY SECTION`을 찾은 다음 아래 내용을 입력합니다.

```
host 가상_머신_이름 {
hardware ethernet MAC_주소; 
fixed-address 정적_IP;
}
```

가상 머신을 재시작합니다.