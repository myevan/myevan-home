# 윈도우 마크다운 HTML 문서 생성

## 준비 

[윈도우 파이썬 가상 환경](./windows_python_virtualenv.md) 셋업

```bat
C:\> virtualenv \VirtualEnvs\mkdocs
C:\> \VirtualEnvs\mkdocs\Scripts\active
(mkdocs) C:\> pip install mkdocs
(mkdocs) C:\> md \Mkdocs
(mkdocs) C:\> cd \Mkdocs
```

## 생성 

```bat
(mkdocs) C:\Mkdocs> mkdocs new example
(mkdocs) C:\Mkdocs> cd example
```

## 보기

```bat
(mkdocs) C:\Mkdocs\example> mkdocs serve
```

## 빌드

```bat
(mkdocs) C:\Mkdocs\example> mkdocs build
```

