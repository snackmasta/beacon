# Replace "https://example.com/raw/textfile.txt" with the URL of your raw text file
$url = "https://raw.githubusercontent.com/snackmasta/listener/master/metadata/data.json"

# Use Invoke-RestMethod to fetch the raw text content
$response = Invoke-RestMethod -Uri $url

# Display the content
# Find the latest client ID
$latestClientId = $response.clients.PSObject.Properties | Where-Object { $_.Name -match 'client_\d+' } | Sort-Object Value.num | Select-Object -Last 1

# Access the "state" property of the latest client
$latestClientState = $latestClientId.Value.state

# Display the latest client state
Write-Output $latestClientState