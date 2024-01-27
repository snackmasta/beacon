# $processIds = @(Get-Process -Name powershell).Id
# $currentProcessId = $PID
# $junkId = Get-Content "C:\temp\beacon\log.txt"
# $processIds = $processIds | Where-Object { $_ -ne $currentProcessId }
# Write-Host "Process IDs: $processIds"
Write-Host "Terminated ID: $junkId"
# if ($processIds.Length -ge 1) {
#     for ($i = 0; $i -lt $processIds.Length; $i++) {
#         Stop-Process -Id $processIds[$i]
#     }
# }
Stop-Process -Id $junkId