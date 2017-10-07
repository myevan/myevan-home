# 윈도우 동기화 robocopy

```bat
C:\> robocopy O:\Origin T:\Target /MIR /MT:8 /R:1 /W:5
```

* /MIR 전체 디렉토리 동기화
* /MT:n 멀티 쓰레드 사용 (n 개)
* /R:n 재시도 횟수
* /W:n 재시도 대기 시간