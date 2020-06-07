# 언리얼 디버깅 UAT (UE4 Debug UAT on Windows)

## 프로젝트

```
UE_4.git\Engine\Source\Programs\AutomationToolLauncher\AutomationToolLauncher.csproj
```

## 프로퍼티

Debug > Configuration: `Debug`

Debug > Start options > Command line arguments:

```
BuildGraph -Script=Engine\Build\InstalledBuild.xml -Target="Make Installed Build Win64" -set:WithLumin=false -set:WithHoloLens=false -set:WithDDC=false -set:HostPlatformDDCOnly -set:WithFullDebugInfo=true -set:AndroidArchitectures=arm64
```

Working directory:

```
UE_4.git\Engine\Binaries\DotNET\
```