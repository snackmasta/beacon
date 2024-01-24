# Save this script as "BackgroundScript.ps1"

# Your background task goes here
function RunInBackground {
    while ($true) {
        Write-Host "Background task is running..."
        Start-Sleep -Seconds 10  # Adjust the sleep duration as needed
    }
}

# Run the background task in a new PowerShell background job
$backgroundJob = Start-Job -ScriptBlock { RunInBackground }

# Optionally, you can wait for the job to finish, or you can continue with other tasks
# Wait-Job $backgroundJob

# Display a message indicating that the script is running in the background
Write-Host "PowerShell script is running in the background. Press Ctrl+C to exit."

# Keep the script running to allow the background job to continue
try {
    Wait-Event -Timeout ([System.Threading.Timeout]::Infinite)
} finally {
    # Clean up: Stop the background job when the script is terminated
    Stop-Job $backgroundJob
    Remove-Job $backgroundJob
}
