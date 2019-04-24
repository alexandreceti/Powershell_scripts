# $zip='C:\Program Files (x86)\7-Zip\7z.exe'

# &$zip x Zabbix.zip -oC:\
Add-Type -Path "C:\Program Files (x86)\Reference Assemblies\Microsoft\Framework\.NETFramework\v4.5\System.IO.Compression.FileSystem.dll"
#Add-Type -AssemblyName System.IO.Compression.FileSystem
function Unzip {
  param([string]$zipfile, [string]$outpath)

  [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
}

Unzip "C:\temp\zabbix.zip" "C:\"
Rename-Item -Path "C:\Zabbix_v3-32" -newName "C:\zabbix"

#msiexec.exe /i 7z1900.msi /qn