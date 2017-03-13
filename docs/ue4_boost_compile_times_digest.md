# 언리얼 엔진 컴파일 속도 향상 요약

<https://wiki.unrealengine.com/Boost_Compile_Times>

## 커스텀 빌드 설정

`C:\UnrealEngine\Engine\Programs\UnrealBuildTool\BuildConfiguration.xml`을 `%USERPROFILE%\Documents\Unreal Engine\UnrealBuildTool\BuildConfiguration.xml`로 복사

## 모든 코어 활용

CPU 가 하이퍼 쓰레드를 지원한다면 [ProcessorCountMultipier](ue4_processor_count_multiplier_analysis.md) 을 2 로 설정합니다.

```xml
<ProcessorCountMultiplier>2</ProcessorCountMultiplier>
```

