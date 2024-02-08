# Define the registry path for VBScript execution state
$registryPath = "HKCU:\SOFTWARE\Microsoft\Windows Script Host\Settings"
$registryProperty = "Enabled"

# Check if the registry entry exists and get its value
if (Test-Path $registryPath) {
    $vbscriptEnabled = (Get-ItemProperty -Path $registryPath -Name $registryProperty).$registryProperty

    # Output the result
    if ($vbscriptEnabled -eq 1) {
        Write-Output "VBScript execution is enabled."
        # Set the registry value to enable VBScript execution
        New-Item -Path $registryPath -Force | Out-Null
        Set-ItemProperty -Path $registryPath -Name $registryProperty -Value 0
    } else {
        Write-Output "VBScript execution is disabled."
        # Set the registry value to enable VBScript execution
        New-Item -Path $registryPath -Force | Out-Null
        Set-ItemProperty -Path $registryPath -Name $registryProperty -Value 1
    }
} else {
    Write-Output "VBScript execution state is not found in the registry."
}
