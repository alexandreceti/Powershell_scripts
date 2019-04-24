#region Download file from website
$web = New-Object System.Net.WebClient
$web.UseDefaultCredentials = $True
$url = "https://download.microsoft.com/download/E/A/E/EAE6F7FC-767A-4038-A954-49B8B05D04EB/Express 64BIT/SQLEXPR_x64_ENU.exe"
$Index = $url.LastIndexOf("/")
$file = $url.Substring($Index + 1)
$newurl = $url.Substring(0, $index)
$Global:isDownloaded = $false
Unregister-Event -SourceIdentifier "Web.DownloadFileCompleted"
Unregister-Event -SourceIdentifier "Web.DownloadProgressChanged"
Register-ObjectEvent -InputObject $web -EventName DownloadFileCompleted -SourceIdentifier Web.DownloadFileCompleted -Action {    
  $Global:isDownloaded = $True
}
Register-ObjectEvent -InputObject $web -EventName DownloadProgressChanged -SourceIdentifier Web.DownloadProgressChanged -Action {
  $Global:Data = $event
  # $Global:isDownloaded = $false
}
$web.DownloadFileAsync($url, ("C:\temp\{0}" -f $file))
While (-Not $isDownloaded) {
  $percent = $Global:Data.SourceArgs.ProgressPercentage
  $totalBytes = $Global:Data.SourceArgs.TotalBytesToReceive
  $receivedBytes = $Global:Data.SourceArgs.BytesReceived
  If ($percent -ne $null) {
    Write-Progress -Activity ("Downloading {0} from {1}" -f $file, $newurl) `
      -Status ("{0} bytes \ {1} bytes" -f $receivedBytes, $totalBytes)  -PercentComplete $percent
  }
}
Write-Progress -Activity ("Downloading {0} from {1}" -f $file, $newurl) `
  -Status ("{0} bytes \ {1} bytes" -f $receivedBytes, $totalBytes)  -Completed
#endregion Download file from website