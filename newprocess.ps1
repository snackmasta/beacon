Start-Process -FilePath 'powershell.exe' -WindowStyle Hidden -ArgumentList '-command "& {C:\temp\beacon\GetState.ps1}"'

$processIds = @(Get-Process -Name powershell -ErrorAction SilentlyContinue).Id
# Get the first line of log.txt
$junkId = Get-Content "C:\temp\beacon\log.txt" -First 1

if ($junkId -ne $null -and $junkId -match '^\d+$' -and $processIds -contains $junkId) {
    try {
        Stop-Process -Id $junkId -ErrorAction Stop
        Write-Host "Terminated ID: $junkId"
    }
    catch {
        Write-Host "Failed to terminate process with ID: $junkId"
    }
}
else {
    Write-Host "No valid process ID found in log file or the process is not running."
    # Query and write all PowerShell process IDs
    $allPowerShellProcessIds = @(Get-Process -Name powershell).Id
    Write-Host "All PowerShell process IDs: $allPowerShellProcessIds"
}

# Stop-Process -Id $allPowerShellProcessIds -ErrorAction Stop