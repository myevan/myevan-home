# 하이퍼 V 프리 나스 셋업 (Hyper-V FreeNAS Setup)

## 하드웨어

64bit 지원이 필수이므로 가상화 활성화가 필요합니다.

### Gigabyte AM4

* M.I.T. 
* Advanced 주파수 설정 (Advanced Frequency Settings) 
* Advanced CPU 코어 설정 (Advanced CPU Core Settings) 
* SVM Mode: **Enable**

## 다운로드

<https://www.freenas.org/getting-started/>

## HyperV 관리자

### 가상 스위치 관리자

* 새 가상 네트워크 스위치
* 가상 스위치 유형: `외부`
* 이름 `External Switch`


### 새 가상 컴퓨터 마법사

* 작업 > 새로 만들기 > 가상 컴퓨터
* 이름 및 위치 지정
    * 이름: `FreeNAS-11.3`
    * 가상 컴퓨터 다른 위치에 저장: `C:\HyperV`
* 세대 지정: **1세대**
* 메모리 할당
    * 시작 메모리: `8192` MB
    * 동적 메모리 사용 체크
* 네트워크 구성: `External Switch`
* 가상 하드 디스크 연결: **8 GB** ( 운영체제 용량은 매우 작습니다. )
* 설치 옵션
    * 부팅 가능 이미지에서 운영 체제 설치: `FreeNAS-11.3-U2.1.iso`

### 설정

* 하드웨어
    * 프로세서 수: 1 -> `4`
* 관리
    * 검사점
        * 검사점 사용: **체크 해제**
    * 자동 시작 작업: **없음**


## 설치

* Boot NAS Installer 선택
* Console Setup: `Install/Upgrade`
* Choose destination media: `da0` 체크
* 설치 완료 후 Shutdown System 선택
* 설정 > IDE 컨트롤러1 > DVD 드라이브: 미디어 **없음** 선택
* 설정 > IDE 컨트롤러0 > 하드 드라이브 > 가상 하드 디스크 > **새로 만들기** 선택
    * 디스크 형식 선택: `VHDX`
    * 디스크 유형 선택: `동적 확장`
    * 이름: `FreeNAS-Data.vhdx`
    * 위치: `C:\HyperV\FreeNAS-11.3\Virtual Hard Disks\`
    * 디스크 구성: `비어 있는 새 가상 하드 디스크 만들기` 선택
* 가상 컴퓨터 시작


