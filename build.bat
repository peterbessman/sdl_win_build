@echo off

REM This will get you started building a simple one-file SDL application.
REM Place this in the same directory as your .cpp file and run it from there.

call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat" >nul

if not exist "build" mkdir build
pushd .\build
del /Q *
copy ..\SDL2-2.0.14\lib\x64\* .

cl.exe /FC /Zi /nologo ..\*.cpp /I..\SDL2-2.0.14\include SDL2.lib SDL2main.lib Shell32.lib /link /SUBSYSTEM:CONSOLE
popd
