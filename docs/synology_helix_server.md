# 시놀로지 헬릭스 퍼포스 서버 (Synology Helix Perforce Server)

<https://github.com/ambakshi/docker-perforce/tree/master/perforce-server>

## 설치 (Install)

Docker ambakshi/perforce-server 이미지 다운로드

컨테이너 생성 

### 고급 설정

* P4USER 변경 불가 (2022.11 기준)
* P4PORT 변경: `ssl:1667`
* P4PASSWD 추가
* CASE_INSENSITIVE 추가: `1 --unicode` (대소문자 무시 및 유니코드 모드)

### 포트 설정

SSL

* 로컬 포트: 1667
* 컨테이너 포트: 1667
* 유형: TCP

### 볼륨 설정

공유 폴더 docker 내부 helix-server/p4depot 폴더 생성

* 파일/폴더: /docker/helix-server/p4depot
* 마운트 경로: /data/p4depot


## 참고 (Reference)

### 대소문자 무시 (CaseInsensitive)

<https://github.com/ambakshi/docker-perforce/blob/master/perforce-server/setup-perforce.sh#L30>

```
/opt/perforce/sbin/configure-helix-p4d.sh $NAME -n -p $P4PORT -r $P4ROOT -u $P4USER -P "${P4PASSWD}" --case $CASE_INSENSITIVE
```

<https://www.perforce.com/manuals/p4sag/Content/P4SAG/install.linux.packages.configure.html>

