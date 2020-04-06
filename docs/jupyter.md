# 주피터 (Jupyter)

<https://jupyter.org/>

## 설치 (Installation)

<https://jupyter.org/install>

```bash
$ pip install jupyterlab
```

## 설정(Configuration)

### 생성(Generate)

```bash
$ jupyter notebook --generate-config
```

### 편집(Edit)

```bash
$ vim ~/.jupyter/jupyter_notebook_config.py
```

외부 접속 허용 (포트: 8888)

```python
c.NotebookApp.port = 8888
c.NotebookApp.ip = '0.0.0.0'
c.NotebookApp.allow_origin = '*'
c.NotebookApp.password = 'sha1:000000000000:0000000000000000000000000000000000000000' # from notebook.auth import passwd; passwd()
```

## 실행 (Running)

```bash
$ jupyter lab
```
