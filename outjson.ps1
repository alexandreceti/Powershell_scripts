
param (
  [string]$opcao = $(throw "Opcao is required.")
)

Write-Host "----------"
Write-Host $opcao
Write-Host "----------"

if (Test-Path 'bancoNG.json') {
  $file = Get-Content 'bancoNG.json';
  $config = $file | Out-String | ConvertFrom-Json ;

}
else {
  $json = '{ "server": "localhost", "instancia": "SQLNG", "user": "","password": ""}'
  $config = $json | Out-String | ConvertFrom-Json ;
}


Write-Host $config.server
Write-Host $config.instancia
Write-Host $config.user
Write-Host $config.password

#$sqlConn = New - Object System.Data.SqlClient.SqlConnection

# $sqlConn = New - Object System.Data.SqlClient.SqlConnection
# $sqlConn.ConnectionString = “Server = localhost\ sql12;
# Integrated Security = true;
# Initial Catalog = master”
# $SqlConn.ConnectionString = "Server = $SQLServer; Database = $SQLDBName; User ID = $uid; Password = $pwd;"
# $sqlConn.Open()

$SqlQuery = "SELECT name, database_id FROM sys.databases;"
$SqlConnection = New-Object System.Data.SqlClient.SqlConnection;
$urlConect = "Server = $($config.server)\$($config.instancia); Integrated Security = false; User ID = $($config.user); Password = $($config.password);"
Write-Host "------------------"
Write-Host $urlConect
Write-Host "------------------"
$SqlConnection.ConnectionString = $urlConect
$SqlCmd = New-Object System.Data.SqlClient.SqlCommand
$SqlCmd.CommandText = $SqlQuery
$SqlCmd.Connection = $SqlConnection
$SqlAdapter = New-Object System.Data.SqlClient.SqlDataAdapter
$SqlAdapter.SelectCommand = $SqlCmd
$DataSet = New-Object System.Data.DataSet
$SqlAdapter.Fill($DataSet) | Out-Null
$SqlConnection.Close()
# $DataSet.Tables[0] | Out-File "xxxx.csv"
Write-Host "------------------"
#$DataSet.Tables | ConvertFrom-Json | Out-File "xxxx.json"

# $temp = foreach ($row in $DataSet.Tables) {
#   $row;
# }
$DataSet.Tables.select("name like '%NG%'")

#Write-Host $temp