# 시놀로지 중복 제거 (Synology Deduplication): DupeRemove

<https://github.com/markfasheh/duperemove>

## 설치 (Installion)

Docker ubuntu 이미지 다운로드 > 컨테이너 생성 > 터미널 접속

```bash
# apt-get update
# apt-get upgrade
# apt-get install duperemove
```

## 사용 (Usage)

시놀로지 관리자 SSH 접속

### 옵션 (Options)

<https://markfasheh.github.io/duperemove/duperemove.html>

* --hashfile=파일명: 파일 해쉬를 저장 (중요 옵션)
    * 메모리 사용량 대폭 절약
    * 재실행 시간 단축
* -r: 디렉토리 재귀 순회
* -h: 읽기 쉬운 형식 숫자 출력
* -d: 중복 제거 실행 (btrfs 나 flxfs 에서만 작동)
* -v: 상세 로그 출력
* -A: 읽기 전용 모드 처리 (읽기 전용 스냅샷용)
* --io-threads=숫자: I/O 스레드 숫자 (디폴트 호스트 CPU 숫자)
* --cpu-threads=숫자: CPU 바운드 작업용 스레드 숫자 (디폴트 호스트 CPU 숫자)

### 해쉬 파일 구축 

```bash
$ sudo docker exec ubuntu-dedup duperemove --hashfile=/TARGET_DIR/__dedup.hash -r /TARGET_DIR
```

## 참고 (Reference)

<https://wiki.tnonline.net/w/Btrfs/Deduplication>
