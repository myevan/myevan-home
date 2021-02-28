# 언리얼 윈도우 파이썬 (UE4 Windows Python)

## 환경 (Environment)

UE_4.26.1 (Python-3.7.7)

## 준비 (Setup)

### 플러그인 (Plugin)

편집(Edit) > 플러그인(Plugin) > Python Editor Script Plugin 활성화 후 에디터 재시작

### 런처 (Launcher)

<https://github.com/myevan/UnrealProject/blob/main/Build/BatchFiles/UE4Python3.bat#L3>

```bat
%UE_DIR%\Engine\Binaries\ThirdParty\Python3\Win64\python.exe %*
```

### 초기화 (Initialization)

`Content/Python/init_unreal.py`

