$primaryAdapter = Get-NetAdapter | Where-Object { $_.Status -eq 'Up' } | Sort-Object -Property InterfaceIndex | Select-Object -First 1

$stateChild = @{
    "Update" = 1
} | ConvertTo-Json
# PUT the data to the Firebase Realtime Database
Invoke-RestMethod -Uri ('https://curronebox-default-rtdb.asia-southeast1.firebasedatabase.app/clients/' + $primaryAdapter.MacAddress + '.json') -Method PUT -Body $stateChild | Out-Null
