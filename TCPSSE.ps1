$client = "client_2"
$url = "https://curronebox-default-rtdb.asia-southeast1.firebasedatabase.app/data/clients/client_2/state.json"

# Start a process to listen for changes
$process = Start-Process -NoNewWindow -FilePath "curl" -ArgumentList "$url?format=event-stream" -PassThru

# Start an infinite loop
while ($true) {
    # Check if there's any new output
    if ($process.StandardOutput.Peek() -ne -1) {
        $output = $process.StandardOutput.ReadLine()

        # If the output contains "data", it's a new event
        if ($output -match "data") {
            $json = $output -replace "data: ", "" | ConvertFrom-Json
            $state = $json[0].state

            Write-Output $state

            # If state equals 1, run a script
            if ($state -eq 1) {
                C:\temp\beacon\TCPState.ps1
            }
        }
    }

    # Wait for a short time before the next iteration
    Start-Sleep -Milliseconds 500
}