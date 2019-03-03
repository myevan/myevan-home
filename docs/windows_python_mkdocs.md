# 윈도우 파이썬 마크다운 HTML 생성

## 준비 

* [윈도우 파이썬 가상 환경 설치](/windows_python_virtualenv)

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

## 미리 보기

### 서버 실행

```bat
(mkdocs) C:\Mkdocs\example> mkdocs serve
```

### 내용 확인

<http://localhost:8000>

## 테마

### material

#### 준비 

```bat
(mkdocs) C:\> pip install pygments
(mkdocs) C:\> pip install pymdown-extensions
(mkdocs) C:\> pip install mkdocs-material
```

#### 설정

```bat
(mkdocs) C:\> cd \Mkdocs\example
(mkdocs) C:\Mkdocs\example> vim mkdocs.yml
```

```yaml
site_name: "example"
theme: material
pages:
    - "home": index.md
```
