# 언리얼 디버깅 UAT (UE4 Debug UAT on Windows)

## 프로젝트

```
UE_4.git\Engine\Source\Programs\AutomationToolLauncher\AutomationToolLauncher.csproj
```

## 프로퍼티

Debug > Configuration: `Debug`

Debug > Start options > Command line arguments:

```bat
BuildGraph -Script=Engine\Build\InstalledEngineBuild.xml -Target="Make Installed Build Win64" -set:HostPlatformOnly=true -set:WithWin32=false -set:WithLumin=false -set:WithHoloLens=false -set:WithDDC=false -set:WithFullDebugInfo=true 
```

Working directory:

```
UE_4.git\Engine\Binaries\DotNET\
```