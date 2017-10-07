# 언리얼 엔진 프리컴파일드 헤더 사용 최소 파일 개수 옵션 분석

## 기능

소스 파일들을 지정한 개수 단위로 묶어서 프리컴파일 헤더를 생성합니다.

* 빌드 설정값(BuildConfigruation.MinFilesUsingPrecompiledHeader)을 기본으로 사용합니다.
* 모듈 설정값(Rules.MinFilesUsingPrecompiledHeaderOverride)이 존재할 경우 우선 사용합니다.
* 게임 모듈(엔진이나 플러그인이 아닌 모듈)이고 BuildConfiguration.bForcePrecompiledHeaderForGameModules 가 설정되어 있을 경우 무조건 1 을 사용합니다.

## 코드

<https://github.com/EpicGames/UnrealEngine/blob/76085d1106078d8988e4404391428252ba1eb9a7/Engine/Source/Programs/UnrealBuildTool/Configuration/UEBuildModule.cs>

```csharp
namespace UnrealBuildTool
{
    class UEBuildExternalModule : UEBuildModule
    {
        public override List<FileItem> Compile(UEBuildTarget Target, UEToolChain ToolChain, CPPEnvironment CompileEnvironment, List<PrecompiledHeaderTemplate> SharedPCHs, ActionGraph ActionGraph)
        {
            // ...

            // Check to see if this is an Engine module (including program or plugin modules).  That is, the module is located under the "Engine" folder
            bool IsPluginModule = ModuleDirectory.IsUnderDirectory(DirectoryReference.Combine(Target.ProjectDirectory, "Plugins"));
            bool IsGameModule = !IsPluginModule && !ModuleDirectory.IsUnderDirectory(UnrealBuildTool.EngineDirectory);

            // Should we force a precompiled header to be generated for this module?  Usually, we only bother with a
            // precompiled header if there are at least several source files in the module (after combining them for unity
            // builds.)  But for game modules, it can be convenient to always have a precompiled header to single-file
            // changes to code is really quick to compile.
            int MinFilesUsingPrecompiledHeader = BuildConfiguration.MinFilesUsingPrecompiledHeader;
            if (Rules.MinFilesUsingPrecompiledHeaderOverride != 0)
            {
                MinFilesUsingPrecompiledHeader = Rules.MinFilesUsingPrecompiledHeaderOverride;
            }
            else if (IsGameModule && BuildConfiguration.bForcePrecompiledHeaderForGameModules)
            {
                // This is a game module with only a small number of source files, so go ahead and force a precompiled header
                // to be generated to make incremental changes to source files as fast as possible for small projects.
                MinFilesUsingPrecompiledHeader = 1;
            }

            // ...

            // Set up the environment with which to compile the CPP files
            CPPEnvironment CPPCompileEnvironment = ModuleCompileEnvironment;
            if (BuildPlatform.ShouldUsePCHFiles(CompileEnvironment.Config.Platform, CompileEnvironment.Config.Configuration))
            {
                // ...

                // If there was one header that was included first by enough C++ files, use it as the precompiled header. Only use precompiled headers for projects with enough files to make the PCH creation worthwhile.
                if (CPPCompileEnvironment.PrecompiledHeaderFile == null && SourceFilesToBuild.CPPFiles.Count >= MinFilesUsingPrecompiledHeader && ProcessedDependencies != null)
                {
                    PrecompiledHeaderInstance Instance = CreatePrivatePCH(ToolChain, ProcessedDependencies.UniquePCHHeaderFile, CPPCompileEnvironment, ActionGraph);

                    CPPCompileEnvironment = CPPCompileEnvironment.DeepCopy();
                    CPPCompileEnvironment.Config.Definitions.Clear();
                    CPPCompileEnvironment.Config.PrecompiledHeaderAction = PrecompiledHeaderAction.Include;
                    CPPCompileEnvironment.Config.PrecompiledHeaderIncludeFilename = Instance.HeaderFile.Reference;
                    CPPCompileEnvironment.PrecompiledHeaderFile = Instance.Output.PrecompiledHeaderFile;

                    LinkInputFiles.AddRange(Instance.Output.ObjectFiles);
                }
                // ...
            }
        }
    }
}
```
