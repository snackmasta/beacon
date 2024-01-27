$client = "client_2"

# Replace "https://example.com/api/data" with the URL of your JSON endpoint
$url = "https://curronebox-default-rtdb.asia-southeast1.firebasedatabase.app/data.json"

# Start an infinite loop
while ($true) {
    # Use Invoke-RestMethod to fetch the JSON content
    $response = Invoke-RestMethod -Uri $url

    # Access the value of a specific child object property
    # Replace "ChildObjectName" and "PropertyName" with the actual names in your JSON structure
    $state = $response.clients.$client.state

    # Display the value
    #Write-Output $state

    # If state equals 1, run a script
    if ($state -eq 1) {
        # Replace "PathToYourScript.ps1" with the actual path to your script
        C:\temp\beacon\TCPState.ps1
    }

    # Wait for 5 seconds before the next iteration
    Start-Sleep -Seconds 5
}