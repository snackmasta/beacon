# Script content
$scriptContent = @"
while ($true) {
    # Your code goes here
    Write-Host "Background task is running..."
    Start-Sleep -Seconds 60  # Sleep for 60 seconds (adjust as needed)
}
"@

# Script file path
$scriptPath = "$env:USERPROFILE\Documents\BackgroundTask.ps1"

# Create the script file
$scriptContent | Out-File -FilePath $scriptPath -Force

# Create a scheduled task to run the script at startup
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-NoProfile -ExecutionPolicy Bypass -File $scriptPath"
$trigger = New-ScheduledTaskTrigger -AtStartup

Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "BackgroundTask" -Description "Background task running in the background at startup"

