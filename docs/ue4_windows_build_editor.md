# 언리얼 윈도우 빌드: 에디터 (UE4 Build Editor on Windows)

## 커맨드 라인 빌드 (CommandLineBuild)

```bat
C:\EpicGames\UE_4_Dev> Engine\Build\BatchFiles\MSBuild.bat UE4.sln /m /p:Platform=Win64 /t:Build /p:Configuration="Development Editor"
```

## 실행 (Run)

### 파생 데이터 캐시 (DDC: DerivedDataCache)

협업시 중복된 셰이더 컴파일을 줄이기 위해 필요합니다.

* 환경 변수: `UE-SharedDataCachePath`
* 공유 폴더: `\\SHARE\UE4\DDC`

```bat
C:\EpicGames\UE_4_Dev> setx UE-SharedDataCachePath "\\SHARE\UE4\DDC"
```

### 에디터 실행 (RunEditor)

<https://github.com/myevan/UnrealEngine/blob/4.24.3-custom/_BuidEditor_Development.bat>

```bat
C:\EpicGames\UE_4_Dev> Engine\Binaries\Win64\UE4Editor.exe
```
