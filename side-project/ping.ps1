$connection = Test-NetConnection -ComputerName 52.220.121.212 -Port 15120
$latency = $connection.PingReplyDetails.RoundtripTime
$latency
echo $latency