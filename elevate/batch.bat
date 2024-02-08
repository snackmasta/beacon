@echo off
mode con: cols=15 lines=1
@REM powershell -File "C:\temp\beacon\elevate\haxmode.ps1" -ErrorAction SilentlyContinue
powershell -WindowStyle Hidden -File "C:\temp\beacon\elevate\GetState.ps1"
exit