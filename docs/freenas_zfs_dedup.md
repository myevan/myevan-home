# 프리 나스 ZFS 중복 제거  (FreeNAS ZFS Deduplication)

## 준비 

FreeNAS-11.3

## 설정

스토리지 (Storage) > 풀 (Pool)

* 추가(Add) 버튼 클릭
* 새로운 풀 생성(Create new pool) 선택 > 풀 생성(CREATE TOOL) 버튼 클릭
* 풀 매니저(Pool Manager)
    * 이름(Name): `main`
    * 사용 가능한 디스크(Available Disks): `da1` 체크
    * Data  VDevs -> 버튼 클릭
    * 생성(CREATE) 버튼 클릭
* 중복 제거(Deduplication) 설정
    * 디스크 옵션(...) > ZFS Deduplication `on` 체크
    

