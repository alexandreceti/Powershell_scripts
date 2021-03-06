$url = "http://localhost/master/Zabbix_v3-32.zip"
$path = "C:\temp\Zabbix_v3-32.zip"

# dados do Computador
$COMPUTADOR = [System.Net.Dns]::GetHostName()
# param([string]$url, [string]$path)

if (!(Split-Path -parent $path) -or !(Test-Path -pathType Container (Split-Path -parent $path))) { 
  $targetFile = Join-Path $pwd (Split-Path -leaf $path)
  New-Item -Path (Split-Path -parent $path) -ItemType directory
    
} 
Write-Host "Download Zabbix.."
$start_time = Get-Date
(New-Object Net.WebClient).DownloadFileAsync($url, $path) 

Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"
#https://www.7-zip.org/a/7z1900.msi
