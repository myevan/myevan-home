# 윈도우 리모트 데스크탑 포트 변경 

## 레지스트리 변경 

* 윈도우 메뉴: **regedit** 입력
* 레지스트리 
    * 경로: `\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp`
    * 키: `PortNumber`
    * 값: **10진수** 선택 후 입력

## 방화벽 오픈

* 윈도우 메뉴: **고급 보안이 포함된 방화벽** 실행
* **인바운드 규칙** 선택
* **새 규칙** 버튼 클릭
* 새 인바운드 규칙 마법사
    * 규칙 종류: **포트** 선택
    * 프로토콜 및 포트: **TCP** 와 **특정 로컬 포트** 선택후 포트 입력
    * 작업: *연결 허용*
    * 프로필: *전체 체크*
    * 이름: **_mstsc**
    * 설명: *원격 접속*