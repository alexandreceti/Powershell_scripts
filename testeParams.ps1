[cmdletbinding()]

param(
  [parameter(parametersetname = "network")]
  [switch]$network,
  [parameter(parametersetname = "profile")]
  [switch]$profile,
  [parameter(parametersetname = "server")]
  [switch]$server,
  [parameter(parametersetname = "devicebay")]
  [switch]$devicebay
)

$item = $PsCmdlet.ParameterSetName

Write-Host "show $item -output=script2"

