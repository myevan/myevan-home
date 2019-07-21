# python-tcod

<https://github.com/libtcod/python-tcod>

libtcod 의 파이썬 cffi 포팅입니다.

## 설치

```bash
pip install tcod
```

## 요구 사항

* python 3.5 이상 추천
* OS
    * Windows VS2015 런타임 이상
    * macOS 10.9 이상
    * Linux libsdl2(2.0.5 이상), libomp5

## 따라하기

로깅 모듈을 준비합니다.

```python
import logging
logging.basicConfig(level=logging.DEBUG)
```

텍스트 출력에 필요한 폰트가 필요합니다. github 에서 폰트 이미지를 다운로드 받습니다.

```python
import os
import urllib.request

def download_file(remote_file_path, local_file_path):
    if os.path.isfile(local_file_path):
        logging.debug(f"found_local_file:{local_file_path}")
    else:
        logging.debug(f"download_remote_file:{remote_file_path}")
        file_data = urllib.request.urlopen(remote_file_path).read()

        local_dir_path = os.path.dirname(local_file_path)
        if not os.path.isdir(local_file_path):
            logging.debug(f"make_local_dir:{local_dir_path}")
            os.makedirs(local_dir_path)

        logging.debug(f"save_local_file:{local_file_path}")
        open(local_file_path, 'wb').write(file_data)

download_file(
    remote_file_path='https://github.com/libtcod/python-tcod/raw/master/fonts/libtcod/arial10x10.png',
    local_file_path='fonts/font.png')
```

tcod 초기화 진행 합니다. 커스텀 폰트를 설정하고 80x60 화면을 FPS 30 기준으로 설정했습니다.

```python
import tcod
tcod.console_set_custom_font('fonts/font.png', flags=tcod.FONT_TYPE_GREYSCALE|tcod.FONT_LAYOUT_TCOD)
tcod.console_init_root(w=80, h=60, title='example', fullscreen=False)
tcod.sys_set_fps(30)
```

tcod 루프를 작동시킵니다. @ 글자를 (40, 30) 위치에 출력하고 ESC 키 입력을 받으면 종료합니다. 

```python
while not tcod.console_is_window_closed():
    tcod.console_set_default_foreground(0, tcod.white)
    tcod.console_put_char(0, 40, 30, '@', tcod.BKGND_NONE)
    tcod.console_flush()

    key = tcod.console_check_for_keypress()
    if key.vk == tcod.KEY_ESCAPE:
        break
```

(주의: 키 입력 대기를 하지 않으면 화면 출력도 되지 않습니다)
