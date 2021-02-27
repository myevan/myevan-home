# VM 웨어 프리 나스 셋업 (VMWare FreeNAS Setup)

## 하드웨어

64bit 지원이 필수이므로 가상화 활성화가 필요합니다.

## 다운로드

<https://www.freenas.org/getting-started/>

## 준비

VMWare Workstation 15 Player

### 새 가상 머신 마법사 (New Virtual Machine Wizard)

* 게스트 운영 체제 선택 (Select a Guest Operating System): `Other` Version: `FreeBSD 11 64-bit`
* 가상 머신 이름 (Name the Virtual Machine)
    * 가상 머신 이름 (Virtual machine name): `FreeNAS-11.3`
    * 위치 (Location): `E:\VMWares\FreeNAS-11.3`
* 디스크 용량 설정 (Specify Disk Capacity): 
    * 최대 디스크 크기 (Maximum disk size): `8` GB ( 운영체제 용량은 매우 작습니다. )
    * 여러 파일로 가상 디스크 분할 (Split virtual disk into multiple files)
* 하드웨어 커스텀 (Customize Hardware...)
    * 메모리 (Memory): 8192 MB
    * 프로세서 (Processors): 4
        * Virtualize Intel VT-x/EPT or AMD-V/RVI 체크
        * Virtualize CPU performance counters 체크
    * CD/DVD > ISO 이미지 사용(Use ISO Image): `FreeNAS-11.3-U2.1.iso`
    * 네트워크 어댑터(Network Adapter): `Bridged=

## 설치

* Boot NAS Installer 선택
* Console Setup: `Install/Upgrade`
* Choose destination media: `da0` 체크
* 설치 완료 후 Shutdown System 선택
* 추가 설정
    * 설치 디스크 제거: 물리 드라이브 사용(Use Physical Drive)
    * 메인 디스크 추가(Add... > Hard Disk)
        * 가상 디스크 종류(Virtual disk type): SCSI
        * 새로운 가상 디스크 생성 (Create a new virtual disk)
        * 디스크 용량 설정 (Specify Disk Capacity):
            * 최대 디스크 크기 (Maximum disk size): `2000` GB
            * 여러 파일로 가상 디스크 분할 (Split virtual disk into multiple files)
        * 디스크 파일(Disk file): `FreeNAS-11.3-Main.vmdk)`

    
