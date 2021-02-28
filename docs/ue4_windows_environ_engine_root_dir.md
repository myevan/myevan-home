# 언리얼 윈도우 환경 변수: 엔진 루트 디렉토리 (UE4 Windows Environment Variable: Engine Root Directory)

## 소스 (Source)

<https://github.com/myevan/UnrealProject/blob/main/Build/BatchFiles/UE4Environ.bat>

로컬 엔진 검색

```bat
for %%i in ("%~dp0..\..\..\UE_4.git") do set "UE_GIT_DIR=%%~fi"
if exist %UE_GIT_DIR% (
	echo found UE_4.git: %UE_GIT_DIR%
	set UE_DIR=%UE_GIT_DIR%
	goto finish
)

for %%i in ("%~dp0..\..\..\UE_4.svn") do set "UE_SVN_DIR=%%~fi"
if exist %UE_SVN_DIR% (
	echo found UE_4.svn: %UE_GIT_DIR% 
	set UE_DIR=%UE_SVN_DIR%
	goto finish
)
```

프로젝트 파일 이름 얻기

```bat
for %%i in ("%~dp0..\..\") do set "PRJ_DIR=%%~fi"
for %%i in ("%~dp0..\..") do set "PRJ_NAME=%%~ni"
set PRJ_FILE=%PRJ_DIR%%PRJ_NAME%.uproject
```

프로젝트 엔진 GUID 검색

```bat
for /f "tokens=2" %%i in ('findstr EngineAssociation %PRJ_FILE%') do set "PRJ_GUID_TOKEN=%%i"
set PRJ_GUID=%PRJ_GUID_TOKEN:~1,-2%
```

인하우스 빌드 레지스트리 검색

```bat
set REG_NAME=%PRJ_GUID%
set REG_PATH="HKEY_CURRENT_USER\Software\Epic Games\Unreal Engine\Builds"
for /F "usebackq tokens=3" %%i IN (`reg query %REG_PATH% /v %REG_NAME% 2^>nul ^| find "%REG_NAME%"`) do (
	echo found UE_4.registered: %%i
	set UE_DIR=%%i
	goto finish
)
```

퍼블릭 빌드 레지스트리 검색

```bat
set REG_PATH2="HKEY_LOCAL_MACHINE\SOFTWARE\EpicGames\Unreal Engine\%REG_NAME%"
for /F "usebackq tokens=3" %%i IN (`reg query %REG_PATH2% /v InstalledDirectory 2^>nul ^| find "InstalledDirectory"`) do (
	echo found UE_4.public: %%i
	set UE_DIR=%%i
	goto finish
)
```

## 참고 (References)

* [언리얼 윈도우 레지스트리](./ue4_windows_registry.md)