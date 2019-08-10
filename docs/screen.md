# 스크린 사용

## 실행 (create session)

```bash
$ screen
```

### 윈도우 목록 (list windows)

ctrl+a, w

### 윈도우 생성 (create window)

ctrl+a, c

### 윈도우 변경 (change window)

* ctrl+a, 0 0 번 윈도우
* ctrl+a, 1 1 번 윈도우
* ctrl+a, 2 2 번 윈도우
* ctrl+a, a 직전 작업 윈도우
* ctrl+a, n 다음 순서 윈도우
* ctrl+a, p 이전 순서 윈도우

### 윈도우 분할 (split window)

* ctrl+a, S 영역 나눔
* ctrl+a, tab 영역간 이동
* ctrl+a, Q 현재 영역만 남김

### 복사 모드

ctrl+a, esc

### 명령 모드

ctrl+a, :

### 세션 탈출 (detach session)

작업 상태 유지

ctrl+a, k

### 세션 파괴 (kill session)

ctrl+a, k

## 재개

### 세션 목록

```bash
$ screen -list
```

### 세션 재개

다른 곳에서 실행중인 세션 재개

```bash
$ screen -d -r
```

## 정리

```bash
$ screen -XS 번호 quit
```
