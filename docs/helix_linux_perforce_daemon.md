# 헬릭스 리눅스 퍼포스 데몬 (Helix Linux Perforce Daemon)

## 데몬 시작하기 (Start Daemon)

<https://github.com/myevan/cli-helix/blob/master/cli_p4d_run.sh>

```bash
$ mkdir data
$ mkdir var
$ p4d -r data -L var\log -J var\journal -p 1666 -xi
$ p4d -r data -L var\log -J var\journal -p 1666
Server switched to Unicode mode.
Perforce Server starting...
```

## 데몬 정지하기 (Stop Daemon)

```bash
$ p4 -p localhost:1666 admin stop
```