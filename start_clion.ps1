Write-Host "Start Clion at WSL!!!"

$scriptDir = if (-not $PSScriptRoot) {  
    Split-Path -Parent (Convert-Path ([environment]::GetCommandLineArgs()[0])) 
  } 
  else {
    $PSScriptRoot 
  }

Write-Host "configure xserver..."
Stop-Process -name vcxsrv
Invoke-Expression $scriptDir\config.xlaunch

Write-Host "start wsl..."
wsl --distribution Centos7 "ls"

Write-Host "setup networking with anyconnect..."
Get-NetIPInterface -InterfaceAlias "vEthernet (WSL)" | Set-NetIPInterface -InterfaceMetric 1
Get-NetAdapter | Where-Object {$_.InterfaceDescription -Match "Cisco AnyConnect"} | Set-NetIPInterface -InterfaceMetric 4000

$wsl_path = "/mnt/" + $scriptDir.replace('\','/').replace(':','').replace('C','c') + "/start_clion.sh"

Start-Process -Wait -NoNewWindow -FilePath "wsl.exe"  -ArgumentList "$wsl_path"


