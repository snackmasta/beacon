# Function to perform the actual work in the job
function Start-MyJob {
    param (
        [string]$jobName
    )

    Write-Host "Starting job: $jobName"

    # Simulate some work in the job (replace this with your actual job logic)
    Start-Sleep -Seconds 15

    Write-Host "Job completed: $jobName"
}

# Main script
$jobCounter = 1

while ($true) {
    $jobName = "Job$jobCounter"

    # Start a new job
    $job = Start-Job -ScriptBlock {
        param ($name)
        Start-MyJob -jobName $name
    } -ArgumentList $jobName

    # Wait for the job to complete or timeout after 10 seconds
    $result = $null
    $timeout = 10

    do {
        $result = Receive-Job $job -ErrorAction SilentlyContinue
        Start-Sleep -Seconds 1
        $timeout--
    } while ($result -eq $null -and $timeout -gt 0)

    # If the job is still running, pause the loop
    if ($result -eq $null) {
        Write-Host "Pausing the loop as the job $jobName is running for more than 10 seconds."
        Remove-Job $job
        Start-Sleep -Seconds 60  # Adjust the pause duration as needed
    } else {
        Write-Host "Job $jobName completed successfully."
    }

    $jobCounter++
}
