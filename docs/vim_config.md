# vim config 설정 (.vimrc)

## 문법 강조 (syntax highlighting)

```
syntax on
```

## 인덴트 설정 (indent)

```
set sw=4 sts=4 ts=4 expandtab
```

* sw 인덴트 스텝(블럭 선택 후 < 혹은 >)시 스페이스 갯수
* sts 편집중 탭 입력시 스페이스 갯수
* ts 탭 문자 표시 간격
* expandtab 탭을 스페이스로 확장

## 인덴트

### 자동 인덴트 (auto indentation)

다음 줄 인덴트를 이전 줄 인덴트와 동일하게 유지해줌

```
set autoindent
```

### 스마트 인덴트 (smart indentation)

autoindent 기반에 {, }, # 특화 처리 수행

```
set smartindent
```

### C 인덴트 (c indent)

C 언어 특화 인덴트 지원

```
set cindent
```

