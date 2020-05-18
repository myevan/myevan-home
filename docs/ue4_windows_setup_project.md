# 언리얼 프로젝트 윈도우 환경 셋업 (UnrealEngine Project Setup on Windows)

## 설정 (Settings)

* 이름(Name): 클래스 접두어로 사용되므로 접두어 형태(X)가 좋습니다.
* 타겟 플랫폼(Target Platform): 에디터 프로젝트 설정(Project Settings) > 타겟 하드웨어(Target Hardware)에서 변경할 수 있습니다.

## 구조 (Structures)

```bat
C:\Works\Group\
    UE_4_Dev\ - 개발용 엔진 (소스 버전)
    UE_4\ - 배포용 엔진 (바이너리 버전)
    X\ - 프로젝트
        Binaries\ 바이너리 (자동 생성)
            Win64\
        Build\ (빌드 결과)
            BatchFiles\ 배치 파일 (수동 생성)
                Mac\ 맥용 스크립트 (수동 생성)
        Config\ 설정 (자동 생성)
        Content\ 컨텐츠 (자동 생성)
        Source\ 소스 (자동 생성)
        Saved\ (실행 결과)
        Tools\ 도구 (수동 생성)
```

## 배치 파일 (BatchFiles)

### 언리얼 빌드 찾기 (Find UE Build)

소스 빌드 (UE_4.git) -> 바이너리 빌드 (UE_4.svn) -> 레지스트리 등록 빌드 순서로 언리얼 빌드(UE_4)를 찾아 환경 변수(UE_DIR)에 기록 합니다.
 
`Build\BatchFiles\UE.bat`

```bat
@echo off
for %%i in ("%~dp0..\..\") do set "PRJ_DIR=%%~fi"
for %%i in ("%~dp0..\..") do set "PRJ_NAME=%%~ni"
set PRJ_FILE=%PRJ_DIR%%PRJ_NAME%.uproject

for %%i in ("%~dp0..\..\..\UE_4.git") do set "UE_GIT_DIR=%%~fi"
if exist %UE_GIT_DIR% (
	echo UE4-SourceBuild: %UE_GIT_DIR%
	set UE_DIR=%UE_GIT_DIR%
	goto finish
)

for %%i in ("%~dp0..\..\..\UE_4.svn") do set "UE_SVN_DIR=%%~fi"
if exist %UE_SVN_DIR% (
	echo UE4-BinaryBuild: %UE_GIT_DIR% 
	set UE_DIR=%UE_SVN_DIR%
	goto finish
)

for /f "tokens=2" %%i in ('findstr EngineAssociation %PRJ_FILE%') do set "PRJ_GUID_TOKEN=%%i"
set PRJ_GUID=%PRJ_GUID_TOKEN:~1,-2%

set REG_PATH="HKEY_CURRENT_USER\Software\Epic Games\Unreal Engine\Builds"
set REG_NAME=%PRJ_GUID%
for /F "usebackq tokens=3" %%i IN (`reg query %REG_PATH% /v %REG_NAME% 2^>nul ^| find "%REG_NAME%"`) do (
	echo UE4-RegisteredBuild: %%i
	set UE_DIR=%%i
	goto finish
)

:error
echo UE4-BuildNotFound
echo --------------------
echo * SourceBuild: %UE_GIT_DIR%
echo * BinaryBuild: %UE_SVN_DIR%
echo * RegisteredBuild: %PRJ_GUID%
exit /b 1

:finish
```

### 프로젝트 파일 생성 (GenerateProjectFiles)

```bat
call UE.bat
%UE_DIR%\Engine\Binaries\DotNET\UnrealBuildTool.exe -ProjectFiles -Game -Engine -Project=%PRJ_FILE%
```

### 에디터 실행 (RunEditor)

`RunEditor_Development.bat`

```bat
call UE.bat
start %UE_DIR%\Engine\Binaries\Win64\UE4Editor.exe %PRJ_FILE% -SkipCompile %*
```

`RunEditor_DebugGame.bat`

```bat
call UE.bat
start %UE_DIR%\Engine\Binaries\Win64\UE4Editor-Win64-DebugGame.exe %PRJ_FILE% -SkipCompile -FullCrashDump %*
```
