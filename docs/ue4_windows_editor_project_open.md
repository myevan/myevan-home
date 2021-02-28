# 언리얼 윈도우 에디터 프로젝트 열기 (UE4 Windows Editor Open Project)

## 소스 (Source)

### DDC 체크 (CheckDDC)

환경 변수와 공유 폴더 확인

<https://github.com/myevan/UnrealProject/blob/main/UE4Editor.bat#L2-L3>

```bat
if "%UE-SharedDataCachePath%" == "" goto not_found_ddc_env
if not exist %UE-SharedDataCachePath% goto not_found_ddc_dir
```

### 에디터 실행 (RunEditor)

<https://github.com/myevan/UnrealProject/blob/main/UE4Editor.bat#L6>

```bat
%UE_DIR%\Engine\Binaries\Win64\UE4Editor.exe %~dp0%PRJ_NAME%.uproject
```

## 참고 (References)

* [DDC 설정](./ue4_editor_config_ddc.md)
* [윈도우 엔진 루트 디렉토리](./ue4_windows_environ_engine_root_dir.md)