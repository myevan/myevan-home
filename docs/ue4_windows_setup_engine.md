# 언리얼 엔진 윈도우 환경 셋업 (UnrealEngine Setup on Windows)

## 준비 (Prepare)

### 클론 (Clone)

```bat
C:\EpicGames>git clone https://github.com/EpicGames/UnrealEngine.git UE_4.git
```

### 브랜치 (Branch)

```bat
C:\EpicGames>git checkout -b x.y.z-custom
```

### 리모트 (Remote)

```bat
C:\EpicGames>git remote add custom https://github.com/GROUP/UnrealEngine.git
```

### 디펜던시 업데이트(Update GitDependencies)

* 환경 변수: `UE4-Proxy`
* 프락시 형식: `xxx.xxx.xxx.xxx:port`

`_GitDependencies.bat`

```bat
@echo off
set PROXY=%UE4-Proxy%
set EXCLUDE=HTML5
if "%PROXY%" == "" (
    %~dp0Engine\Binaries\DotNET\GitDependencies.exe -exclude=%EXCLUDE%
) else (
    echo Proxy: %PROXY%
    %~dp0Engine\Binaries\DotNET\GitDependencies.exe -exclude=%EXCLUDE% -proxy=%PROXY%
)
pause
```

## 빌드 (Build)

### 엔진 셋업 (SetupEngine)

```bat
C:\EpicGames\UE_4.git>Setup.bat
```

### 엔진 프로젝트 생성 (MakeEngineProject)

```bat
C:\EpicGames\UE_4.git>GenerateProjectFiles.bat
```

### 에디터 빌드 (BuildEditor)

```bat
C:\EpicGames\UE_4.git>Engine\Build\BatchFiles\MSBuild.bat UE4.sln /m /p:Platform=Win64 /t:Build /p:Configuration="Development Editor"
```

## 실행 (Run)

### 파생 데이터 캐시 (DerivedDataCache)

* 환경 변수: `UE-SharedDataCachePath`
* 공유 폴더: `\\SHARE\UE4\DDC`

```bat
C:\EpicGames\UE_4.git>setx UE-SharedDataCachePath "\\SHARE\UE4\DDC"
```

### 에디터 실행 (RunEditor)

DDC 환경 변수가 존재할 때만 실행합니다.

```bat
C:\EpicGames\UE_4.git>start Engine\Binaries\Win64\UE4Editor.exe
```

## 인스톨드 빌드 (InstalledBuild)

### 가짜 인스톨드 빌드 (FakeInstalledBuild)

인스톨드 빌드 테스트용입니다. 
바이너리 빌드 상태일 때는 엔진 수정이 되지 않습니다.
엔진 수정이 필요하면 소스 빌드로 변경해주어야 합니다.

#### 바이너리 빌드 변경 (MakeBinaryBuild)

* GeneratedProjectFiles.bat 삭제
* Build\SourceDistribution.txt 삭제
* Build\InstalledBuild.txt 빈 파일 생성

`_MakeBinaryBuild.bat`

```bat
@echo off
if exist %~dp0Engine\Build\InstalledBuild.txt (
    echo Already changed the binary build
    goto finish
)
echo Change to the binary build
if exist %~dp0GenerateProjectFiles.bat del %~dp0GenerateProjectFiles.bat
if exist %~dp0Engine\Build\SourceDistribution.txt del %~dp0Engine\Build\SourceDistribution.txt
copy NUL %~dp0Engine\Build\InstalledBuild.txt

:finish
pause
```

#### 소스 빌드 변경 (MakeSourceBuild)

`_MakeSourceBuild.bat`

```bat
@echo off
if not exist %~dp0Engine\Build\InstalledBuild.txt (
    echo Already changed the source build
    goto finish
)
echo Change to the source build
git restore %~dp0GenerateProjectFiles.bat %~dp0Engine\Build\SourceDistribution.txt
if exist %~dp0Engine\Build\InstalledBuild.txt del %~dp0Engine\Build\InstalledBuild.txt

:finish
pause
```