@echo off
setlocal

set RAYLIB=C:\raylib-5.5_win64_msvc16\raylib-5.5_win64_msvc16

if not exist build mkdir build

REM /MD = link against the DLL CRT (matches most prebuilt raylib libs)
cl /nologo /FC /Zi /W4 -wd4100 /MD main.c ^
  /I "%RAYLIB%\include" ^
  /link ^
  /OUT:build\platformer.exe ^
  /LIBPATH:"%RAYLIB%\lib" ^
  raylib.lib user32.lib gdi32.lib winmm.lib shell32.lib opengl32.lib

REM Make sure the DLL is next to the exe so it runs
copy /Y "%RAYLIB%\lib\raylib.dll" build\ >nul

endlocal
