# 언리얼 엔진 프로세서 카운트 멀티플라이어 분석

## 기능

* [WMI(Windows Management Instrumentation)](https://en.wikipedia.org/wiki/Windows_Management_Instrumentation)을 사용해 물리 코어 개수를 알아냄
* mono 인 경우는 WMI 쿼리를 사용할 수 없어 논리 프로세서 개수 사용
* 하이퍼 쓰레드가 활성화된 경우(물리 코어 개수보다 논리 코어 개수가 많음)
    * BuildConfigruation.ProcessorCountMultiplier 값이 설정되어 있다면 물리 코어 개수에 지정한 숫자 배수로 액션 수행
    * 물리 코어 개수가 5개 이상부터 물리 코어 개수와 논리 코어 개수 평균 개수로 액션 수행
* 하이퍼 쓰레드가 비활성화된 경우 물리 코어 개수만큼 액션 수행

## 코드

<https://github.com/EpicGames/UnrealEngine/blob/76085d1106078d8988e4404391428252ba1eb9a7/Engine/Source/Programs/UnrealBuildTool/System/LocalExecutor.cs>

```cpp
namespace UnrealBuildTool
{
    class ActionThread
    {
        // ...
        public override bool ExecuteActions(List<Action> Actions)
        {
            // Time to sleep after each iteration of the loop in order to not busy wait.
            const float LoopSleepTime = 0.1f;

            // Use WMI to figure out physical cores, excluding hyper threading.
            int NumCores = Utils.GetPhysicalProcessorCount();
            if (NumCores == -1)
            {
                NumCores = System.Environment.ProcessorCount;
            }
            // The number of actions to execute in parallel is trying to keep the CPU busy enough in presence of I/O stalls.
            int MaxActionsToExecuteInParallel = 0;
            if (NumCores < System.Environment.ProcessorCount && BuildConfiguration.ProcessorCountMultiplier != 1.0)
            {
                // The CPU has more logical cores than physical ones, aka uses hyper-threading. 
                // Use multiplier if provided
                MaxActionsToExecuteInParallel = (int)(NumCores * BuildConfiguration.ProcessorCountMultiplier);
            }
            else if (NumCores < System.Environment.ProcessorCount && NumCores > 4)
            {
                // The CPU has more logical cores than physical ones, aka uses hyper-threading. 
                // Use average of logical and physical if we have "lots of cores"
                MaxActionsToExecuteInParallel = (int)(NumCores + System.Environment.ProcessorCount) / 2;
            }
            // No hyper-threading. Only kicking off a task per CPU to keep machine responsive.
            else
            {
                MaxActionsToExecuteInParallel = NumCores;
            }

            // ...
        }
    }
}
```
