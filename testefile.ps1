$regex = alexandre

Get-Content .\file.txt | ForEach-Object {
  if($_ -match $regex){
      # Work here
  }
}