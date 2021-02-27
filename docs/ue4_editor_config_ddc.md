# 언리얼 에디터 DDC 설정 (UE4 Editor Config: DDC)

## 설정 (Config)

`Engine/Config/BaseEngine.ini`

```ini
[DerivedDataBackendGraph]
; ... 전략 ...
; Configure the shared DDC that is accessed after local. It's a filesystem DDC and the parameters are explained above
Shared=(Type=FileSystem, ReadOnly=false, Clean=false, Flush=false, DeleteUnused=true, UnusedFileAge=10, FoldersToClean=10, MaxFileChecksPerSec=1, ConsiderSlowAt=70, PromptIfMissing=false, Path=?EpicDDC, EnvPathOverride=UE-SharedDataCachePath, EditorOverrideSetting=SharedDerivedDataCache, CommandLineOverride=SharedDataCachePath)
; Configure an alternate shared DDC that is accessed after local. It's a filesystem DDC and the parameters are explained above
AltShared=(Type=FileSystem, ReadOnly=true, Clean=false, Flush=false, DeleteUnused=true, UnusedFileAge=23, FoldersToClean=10, MaxFileChecksPerSec=1, ConsiderSlowAt=70, PromptIfMissing=false, Path=?EpicDDC2, EnvPathOverride=UE-SharedDataCachePath2)
; ... 후략 ....
```

## 환경 변수 (EnvironmentVariable)

* 로컬 캐쉬 UE-LocalDataCachePath
* 공유 캐쉬 UE-SharedDataCachePath
* 공유 캐쉬2 UE-SharedDataCachePath2 (읽기 전용)

### 윈도우 (Windows)

#### 환경

```bat
setx UE-SharedDataCachePath \\HOST\UnrealShare\DDC
```

### 맥 (Mac)

#### 시작

```bash
[ -d ~/Shares/UnrealShare ] || mkdir ~/Shares/UnrealShare
mount_smbfs //ID:PW@HOST/UnrealShare ~/Shares/UnrealShare
```

#### 환경

```bash
export UE-SharedDataCachePath=$HOME/Shares/UnrealShare/DDC
```
