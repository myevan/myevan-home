# emscripten 시작하기 (get started)

## 준비 (Toolchain Requirements)

<https://emscripten.org/docs/building_from_source/toolchain_what_is_needed.html>

### 플랫폼 공통 (All Platforms)

* Node.js (0.8 이상)
* Python (2.7.12 이상 | 3.5 이상)
* Java (`1.6.0_31` 이상)
* Git
* LLVM
* Binaryen
* cmake

### 윈도우 (Windows)

* VS2017

### 맥 (macOS)

* Xcode (Command Line Tools)

### 리눅스 (Linux)

* gcc (ubuntu: build-essential)


## 설치 (Installation instructions)


```bash
$ git clone https://github.com/emscripten-core/emsdk.git
$ cd emsdk
$ git pull
$ ./emsdk install latest
$ ./emsdk activate latest
$ source ./emsdk_env.sh
```

환경 설정이 완료되면 PATH 를 통해 emcc 접근이 가능합니다.

```bash
./emcc -v
```

사전 패키지가 모두 준비되어 있지 않으면 설치가 제대로 되지 않습니다.


## 실행 (Running)

### 테스트 코드 (Test Code)

main.cpp

```cpp
#include <stdio.h>

int main() 
{
    puts("hello, world!");
    return 0;
}
```

### 빌드 (Build)

#### 자바스크립트 빌드 (JavaScript Build)

```bash
$ ./emcc main.cpp
$ node a.out.js
```

### HTML 빌드 (HTML Build)

```bash
$ ./emcc main.cpp -o main.html
```
