$registryPath = "HKLM:Software\Policies\Microsoft\Windows\Installer"

$Name = "AlwaysInstallElevated"

$value = "1"

IF(!(Test-Path $registryPath))

  {

    New-Item -Path $registryPath -Force | Out-Null

    New-ItemProperty -Path $registryPath -Name $name -Value $value -PropertyType DWORD -Force | Out-Null}

 ELSE {

    New-ItemProperty -Path $registryPath -Name $name -Value $value -PropertyType DWORD -Force | Out-Null}



$registryPath1 = "HKCU:Software\Policies\Microsoft\Windows\Installer"

$Name1 = "AlwaysInstallElevated"

$value1 = "1"

IF(!(Test-Path $registryPath1))

  {

    New-Item -Path $registryPath1 -Force | Out-Null

    New-ItemProperty -Path $registryPath1 -Name $name1 -Value $value1 -PropertyType DWORD -Force | Out-Null}

 ELSE {

    New-ItemProperty -Path $registryPath1 -Name $name1 -Value $value1 -PropertyType DWORD -Force | Out-Null}