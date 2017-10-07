# 언리얼 엔진 유니티 빌드 제외 옵션 분석


## 기능

* `BuildConfiguration.bForceUnityBuild` 설정시 무조건 유니티 빌드 사용
* `BuildConfiguration.bUseUnityBuild` 설정시 조건부 유니티 빌드 사용
    * `Rules.bFasterWithoutUnity` 설정시 해당 모듈 유니티 빌드 제외
    * 모듈 소스 파일 개수가 MinSourceFilesForUnityBuild 보다 적을 경우 유니티 빌드 제외

## 코드

<https://github.com/EpicGames/UnrealEngine/blob/76085d1106078d8988e4404391428252ba1eb9a7/Engine/Source/Programs/UnrealBuildTool/Configuration/UEBuildModule.cs>

```csharp
namespace UnrealBuildTool
{
    public class UEBuildModuleCPP : UEBuildModule
    {
        public override List<FileItem> Compile(UEBuildTarget Target, UEToolChain ToolChain, CPPEnvironment CompileEnvironment, List<PrecompiledHeaderTemplate> SharedPCHs, ActionGraph ActionGraph)
        {
            /// ...

            // Should we use unity build mode for this module?
            bool bModuleUsesUnityBuild = false;
            if (BuildConfiguration.bUseUnityBuild || BuildConfiguration.bForceUnityBuild)
            {
                if (BuildConfiguration.bForceUnityBuild)
                {
                    Log.TraceVerbose("Module '{0}' using unity build mode (bForceUnityBuild enabled for this module)", this.Name);
                    bModuleUsesUnityBuild = true;
                }
                else if (Rules.bFasterWithoutUnity)
                {
                    Log.TraceVerbose("Module '{0}' not using unity build mode (bFasterWithoutUnity enabled for this module)", this.Name);
                    bModuleUsesUnityBuild = false;
                }
                else if (SourceFilesToBuild.CPPFiles.Count < MinSourceFilesForUnityBuild)
                {
                    Log.TraceVerbose("Module '{0}' not using unity build mode (module with fewer than {1} source files)", this.Name, MinSourceFilesForUnityBuild);
                    bModuleUsesUnityBuild = false;
                }
                else
                {
                    Log.TraceVerbose("Module '{0}' using unity build mode (enabled in BuildConfiguration)", this.Name);
                    bModuleUsesUnityBuild = true;
                }
            }
            else
            {
                Log.TraceVerbose("Module '{0}' not using unity build mode (disabled in BuildConfiguration)", this.Name);
            }
            // ...
        }
    }
}
```
