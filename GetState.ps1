$client = "client_2"

# Replace "https://example.com/api/data" with the URL of your JSON endpoint
$url = "https://curronebox-default-rtdb.asia-southeast1.firebasedatabase.app/data.json"

# Start an infinite loop
while ($true) {
    # Use Invoke-RestMethod to fetch the JSON content
    $response = Invoke-RestMethod -Uri $url

    # Access the value of a specific child object property
    # Replace "ChildObjectName" and "PropertyName" with the actual names in your JSON structure
    $childObjectValue = $response.clients.client_2.state

    # Display the value
    Write-Output $childObjectValue

    # Wait for 5 seconds before the next iteration
    Start-Sleep -Seconds 5
}