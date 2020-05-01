# 맥 vim (vim on mac)

<https://macnews.tistory.com/2195>

vim hjkl 키 이동시 악센트 문자 팝업으로 편집이 불가능할 경우 ApplePressAndHoldEnabled 를 비활성화 해준 다음 앱을 재실행합니다.

```bash
$ defaults write -g ApplePressAndHoldEnabled -bool false
```
