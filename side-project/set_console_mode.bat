@echo off
powershell -File C:\temp\beacon\side-project\vlcPlay.ps1

timeout /nobreak /t 5 >nul

powershell -Command "Stop-Process -Name vlc"