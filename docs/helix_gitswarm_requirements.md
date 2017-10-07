# 깃 스웜 요구 사항 GitSwarm Requirements

<https://www.perforce.com/perforce/doc.current/manuals/gitswarm/install/requirements.html>

## 하드웨어 Hardware

### 코어 Core

* 코어 1개당 500명 (0.002코어/명)
* 최소 코어 개수: 1개 (성능 저하)
* 추천 코어 개수: **2개** 이상

### 메모리 Memory

* 메모리 1GB당 250명 (40MB/명)
* 최소 메모리 용량: 2GB (설정 변경시 에러 발생)
* 추천 메모리 용량: **4GB**

### 스토리지 Storage

* 7200RPM 이상 HDD나 SSD 추천
* 최소 저장소 용량 **2배** 공간 확보
* Helix 미러링 사용시 **4배** 공간 확보
* 추후 확장 대비 LVM 사용 추천
* 네트워크 파일 시스템(NFS) 지원: NAS, SSAN, AWS-EBS

## 소프트웨어 Software

### 운영체제 OS

* Ubuntu-x64: 12.04, 14.04
* CentOS-x64: 6.6+, 7.0+
* RedHat-x64: 6.6+, 7.0+

### 데이터베이스 Database

* 스토리지 1MB당 1명 (1MB/명)

### 유니콘 Unicorn

* 최소 워커 개수: 3개
* 추천 워커 개수: 코어 개수 +1 

### 레디스 Redis

사용자 세션과 백그라운드 작업큐 저장

* 메모리 1MB당 40명 (25KB/명)
* 사용자 세션과 백그라운드 작업 큐 저장

### 사이드킥 Sidekiq

백그라운드 작업 다중 스레드 처리

* 최소 메모리 용량: 200MB 
* 추가 메모리 1MB당 10명 (80KB/명) + 메모리 누수 있음

### 웹브라우저 WebBrowser

* Chrome
* Firefox
* Safari 7+
* Opera
* IE 10+ (Compatibility View 모드 해제)