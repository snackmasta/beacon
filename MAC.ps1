# Get the primary network adapter
$primaryAdapter = Get-NetAdapter | Where-Object { $_.Status -eq 'Up' } | Sort-Object -Property InterfaceIndex | Select-Object -First 1

# Display the MAC address of the primary adapter
Write-Host "Primary Adapter MAC Address: $($primaryAdapter.MacAddress)"
