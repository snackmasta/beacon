$scriptPath = "C:\temp\beacon\run.ps1"
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-File `"$scriptPath`""
$trigger = New-ScheduledTaskTrigger -AtLogon
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "RunScriptOnLogin" -Description "Runs a PowerShell script when a user logs in" -RunLevel Highest -Force