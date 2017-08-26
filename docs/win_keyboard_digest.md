# 윈도우 키보드 드라이버 요약

## 한영키 Capslock 사용

<https://docs.microsoft.com/ko-kr/windows-hardware/drivers/hid/keyboard-and-mouse-class-drivers>

IME_Capslock.reg

```ini
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout]
"Scancode Map"=hex:00,00,00,00,00,00,00,00,02,00,00,00,72,00,3a,00,00,00,00,00
```