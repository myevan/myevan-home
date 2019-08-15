# 우분투 sudo (ubuntu sudo)

# 준비 (Requirements)

에디터를 설정합니다.


```bash
# cd ~
# vim .profile
export EDITOR=vim
```

# 설정 (Config)

visudo 를 실행합니다.

```bash
# visudo
```

아래 문구를 검색합니다.

```
# User privilege specification
root    ALL=(ALL:ALL) ALL
```

특정 아이디(예: myevan)에게 모든 권한을 제공하려면 복사해서 아이디만 변경해 줍니다.

```
# User privilege specification
root    ALL=(ALL:ALL) ALL
myevan  ALL=(ALL:ALL) ALL
```

특정 실행 파일(/bin/ls)에만 접근 권한을 주는 방법입니다.

```
# User privilege specification
root    ALL=(ALL:ALL) ALL
myevan  ALL=(ALL:ALL) /bin/ls
```

특정 호스트(localhost)에서만 권한을 주는 방법입니다.

```
# User privilege specification
root    ALL=(ALL:ALL) ALL
myevan  localhost=(ALL:ALL) ALL
```

