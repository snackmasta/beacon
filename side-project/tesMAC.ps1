$primaryAdapter = Get-NetAdapter | Where-Object { $_.Status -eq 'Up' } | Sort-Object -Property InterfaceIndex | Select-Object -First 1
$url = "https://curronebox-default-rtdb.asia-southeast1.firebasedatabase.app/clients/$($primaryAdapter.MacAddress)/state.json"

$response = Invoke-RestMethod -Uri $url
$state = $response
# echo $state
# echo $primaryAdapter.MacAddress
# echo $url

# cUrl the data to the Firebase Realtime Database
$stateChild = @{
    "state" = 0
} | ConvertTo-Json

Invoke-RestMethod -Uri ('https://curronebox-default-rtdb.asia-southeast1.firebasedatabase.app/clients/' + $primaryAdapter.MacAddress + '.json') -Method PUT -Body $stateChild | Out-Null
# https://curronebox-default-rtdb.asia-southeast1.firebasedatabase.app/clients/AC-12-03-FC-5C-EC/State