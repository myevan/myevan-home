
# 헬릭스 리눅스 퍼포스 복원 (Helix Linux Perforce Restore)

주의! 다른 OS 로 복원은 추천되지 않습니다.
<https://www.perforce.com/perforce/r16.1/manuals/p4sag/appendix.moving.html>

데이터 동기화

```bash
$ rsync -avz -e 'ssh -p 22' id@domain:helix/data ~/helix/data
```

기존 디비 제거

```bash
$ rm -rf data/db.*
```

체크포인트 복원

```bash
$ p4d -r data -jr checkpoint.N
```
