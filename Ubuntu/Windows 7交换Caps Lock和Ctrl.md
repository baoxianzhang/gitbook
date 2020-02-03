# Windows 7交换Caps Lock和Ctrl



原文地址：http://www.kodiva.com/post/swapping-caps-lock-and-control-keys

1. Click Start -> Run
2. Type: regedit, and click OK
3. Go to: HKEY_LOCAL_MACHINE -> System -> CurrentControlSet -> Control -> KeyBoard Layout 

Note: KeyBoard Layout, and not KeyBoard Layouts

1. Right-click: Keyboard Layout, and select New -> Binary value
2. Rename: New Value #1 -> Scancode Map
3. Right click: Scancode Map -> Modify

0000  00 00 00 00 00 00 00 00 

0008  03 00 00 00 1d 00 3a 00 

0010  3a 00 1d 00 00 00 00 00   

0018

1. Close regedit and restart your computer