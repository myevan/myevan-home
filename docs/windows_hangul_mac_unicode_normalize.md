# 윈도우 맥 유니코드 노말라이즈 (Windows mac Unicode Normalize): NFC, NFD

## 상황

맥 파일 이름 글자가 분리됨

```
ㅌㅔㅅㅡㅌ.txt
```

## 분석

<https://www.reimaginer.me/entry/unicode-NFC-NFD#:~:text=%EB%A7%90%EA%B7%B8%EB%8C%80%EB%A1%9C%20%ED%95%9C%EA%B8%80%20%EC%A1%B0%ED%95%A9%ED%98%95(NFD,%EC%9C%A0%EB%8B%88%EC%BD%94%EB%93%9C%EB%A1%9C%20%ED%91%9C%ED%98%84%ED%95%9C%EB%8B%A4.&text=%EC%99%84%EC%84%B1%ED%98%95(NFC)%EB%8A%94%20%EC%99%84%EC%84%B1%EB%90%9C,%EC%9C%A0%EB%8B%88%EC%BD%94%EB%93%9C%EB%A1%9C%20%ED%91%9C%ED%98%84%ED%95%9C%20%EA%B2%83%EC%9D%B4%EB%8B%A4.>

* NFC: 완성형
* NFD: 조합형

## 대응

조합형(NFD) 노말라이즈된 텍스트인지 확인

```python
unicodedata.is_normalized('NFD', file_name)
```

완성형(NFC) 노말라이즈 진행
```python
unicodedata.normalize('NFC', file_name)
```

특정 폴더 하위 파일 전체 노말라이즈

```python
import os
import unicodedata

def normalize_file_names(root_path):
    for base_path, dir_names, file_names in os.walk(root_path):
        for old_file_name in file_names:
            if unicodedata.is_normalized('NFD', old_file_name):
                new_file_name = unicodedata.normalize('NFC', file_name)
                old_file_path = os.path.join(base_path, file_name) 
                print(f"NFD:{old_file_path} -> NFC: {new_file_name}")
                new_file_path = os.path.join(base_path, new_file_name) 
                os.rename(old_file_path, new_file_path)
```