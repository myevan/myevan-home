# 언리얼 엔진 셋업 요약

## 기능

* git 저장소에 포함되지 않은 바이너리 파일 다운로드
* git 후킹 설정
* 필수 구성 요소 설치
* 레지스트리에 연진 경로 등록

## 옵션

* 제외(`--exclude`): 특정 플랫폼 바이너리 제외
    * 불필요한 플랫폼 바이너리를 받지 않으므로 셋업 시간 및 로컬 용량 단축됨
    * 하지만 4.15.0 기준 구현은 그냥 제외 경로 필터인지 Win64 플랫폼만 받기 위해  Win32, IOS 등을 제외하면 빌드에 실패함


## 실행

### 윈도우

<https://github.com/EpicGames/UnrealEngine/blob/release/Setup.bat> 

    :::bat
    cd C:\UnrealEngine
    Setup.bat 
