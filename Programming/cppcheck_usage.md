# cppcheck usage

## 1 安装最新版本
http://cppcheck.sourceforge.net/    

需要安装版本2.x。旧的没有一些选项。


## 2 使用
cppcheck manual documentation
```sh
cppchck --help
```

```sh
cppcheck path
cppcheck file
cppcheck src/a src/b       # check only src/a src/b file
cppcheck -isrc/c -isrc/d   # ignore src/c src/d
cppcheck --clang src/      # use clang parser

## CMake
# Generate a compile database:
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON .
The file compile_commands.json is created in the current folder. Now run Cppcheck like this:
cppcheck --project=compile_commands.json
To ignore certain folders you can use -i. This will skip analysis of source files in the foo folder.
cppcheck --project=compile_commands.json -ifoo

## predefined output formats or define own output format
cppcheck --template=gcc xxx.cpp
cppcheck --template=vc xxx.cpp

## Addons
# cert.py SEI CERT
# misra.py
# y2038.py
# threadsafety.py
```

## 3 注意
Please understand that there are limits of Cppcheck. Cppcheck is rarely wrong
about reported errors. But there are many bugs that it doesn’t detect.
