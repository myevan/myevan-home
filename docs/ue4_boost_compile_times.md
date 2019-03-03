# 언리얼 엔진 컴파일 속도 향상 요약

<https://wiki.unrealengine.com/Boost_Compile_Times>

## 커스텀 빌드 설정

`C:\UnrealEngine\Engine\Programs\UnrealBuildTool\BuildConfiguration.xml`을 `%USERPROFILE%\Documents\Unreal Engine\UnrealBuildTool\BuildConfiguration.xml`로 복사

### 코어 활용

언리얼은 기본적으로 코어당 하나의 액션만 수행합니다. [ProcessorCountMultipier](ue4_processor_count_multiplier_analysis) 값을 크게하면 약간의 빌드 속도 향상을 얻을 수 있습니다. 다만 컴파일 하는 도중 컴퓨터 반응성이 매우 나빠질 수 있습니다. CPU 가 하이퍼 쓰레드를 지원한다면 2 를 설정합니다.

```xml
<ProcessorCountMultiplier>2</ProcessorCountMultiplier>
```

## 커스텀 모듈 설정

언리얼 엔진 빌드는 기본적으로 유니티 빌드를 사용합니다. 유니티 빌드는 빌드 시간을 대폭 감소시켜주지만, 소스 변경이 잦은 모듈에는 적합하지 않습니다.  작업중인 모듈이라면 [bFasterWithoutUnity](/ue4_faster_without_unity_analysis) 을 true 로 [MinFilesUsingPrecompiledHeader](/ue4_min_files_using_precompiled_header_analysis) 을 1로 설정해 해당 모듈을 유니티 빌드에서 제외해주는 것이 좋습니다. 

WorkingModule.Build.cs
```csharp
public class WorkingModule : ModuleRules
{
    public Working(TargetInfo Target)
    {
        // ...
        bFasterWithoutUnity = true;
        MinFilesUsingPrecompiledHeader = 1;
    }
    // ...
}
```
