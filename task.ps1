# $Action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "C:\temp\beacon\run.ps1"
# $Trigger = New-ScheduledTaskTrigger -AtLogOn
# Set-ScheduledTask -Action $Action -Trigger $Trigger -TaskName "BIOS Utility"

# Specify the path to your PowerShell script
$scriptPath = "C:\temp\beacon\run.ps1"

# Specify the action to run the script
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-File `"$scriptPath`""

# Specify the trigger for the login event
$trigger = New-ScheduledTaskTrigger -AtLogon

# Register the scheduled task
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "RunScriptOnLogin" -Description "Runs a PowerShell script when a user logs in" -RunLevel Highest -Force