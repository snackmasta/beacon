Add-Type -AssemblyName System.Device #Required to access System.Device.Location namespace
$latitude_and_longitude = New-Object System.Device.Location.GeoCoordinateWatcher #Create the required object
$latitude_and_longitude.Start() #Begin resolving current locaton

while (($latitude_and_longitude.Status -ne 'Ready') -and ($latitude_and_longitude.Permission -ne 'Denied')) {
    Start-Sleep -Milliseconds 100 #Wait for discovery.
}  

if ($latitude_and_longitude.Permission -eq 'Denied'){
    Write-Error 'Access Denied for Location Information'
} else {
    $latitude_and_longitude.Position.Location | Select Latitude,Longitude #Select the relevent results.
}
