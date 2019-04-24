
param (
  [string]$opcao = $(throw "Opcao is required.")
)

# Write-Host "----------"
# Write-Host $opcao
# Write-Host "----------"
$Script:opcao = $opcao.ToLower()
$Script:bancos = "ng", "ng_adm", "ng_almoxarifado", "ng_analisador", "ng_arquivos", "ng_cnd", "ng_compras", "ng_contabil", "ng_crm", "ng_custom", "ng_dominio", "ng_esocial", "ng_estoque", "ng_faturamento", "ng_financeiro", "ng_fiscal", "ng_folha", "ng_gerencial", "ng_imagem", "ng_integradorerp", "ng_patrimonio", "ng_pdv", "ng_ponto", "ng_protocolo", "ng_reinf", "ng_rh", "ng_sap", "ng_seguranca", "ng_telog", "ng_transact", "ng_tributos", "upgrade";


if (Test-Path 'bancoNG.json') {
  $file = Get-Content 'bancoNG.json';
  $config = $file | Out-String | ConvertFrom-Json ;

}
else {
  $json = '{ "server": "(local)", "instancia": "SQLNG", "user": "","password": ""}'
  $config = $json | Out-String | ConvertFrom-Json ;
}


# Write-Host $config.server
# Write-Host $config.instancia
# Write-Host $config.user
# Write-Host $config.password

###
# acesso ao banco de dados via powershell class .net
###
function StatusDB() {
  param([string]$banco)
  Write-Host "------------------"
  Write-Host "banco Status: " + $banco
  Write-Host "------------------"

  $SqlQuery = "DECLARE @DIAS INTEGER;
  set nocount on;
  USE msdb;
  SELECT @DIAS = DATEDIFF(day, (SELECT max(backup_start_date)
    FROM backupset
    WHERE database_name = '$banco'),(SELECT SYSDATETIME()))
  IF (@DIAS > 1)
  BEGIN
    SELECT @DIAS AS BKP
  END
  ELSE SELECT 0 AS BKP"
  $SqlConnection = New-Object System.Data.SqlClient.SqlConnection;
  $urlConect = "Server = $($config.server)\$($config.instancia); Integrated Security = false; User ID = $($config.user); Password = $($config.password);"
  # Write-Host "------------------"
  # Write-Host $urlConect
  # Write-Host "------------------"
  # Write-Host "------------------"
  # Write-Host $SqlQuery
  # Write-Host "------------------"
  $SqlConnection.ConnectionString = $urlConect
  $SqlCmd = New-Object System.Data.SqlClient.SqlCommand
  $SqlCmd.CommandText = $SqlQuery
  $SqlCmd.Connection = $SqlConnection
  $SqlAdapter = New-Object System.Data.SqlClient.SqlDataAdapter
  $SqlAdapter.SelectCommand = $SqlCmd
  $DataSet = New-Object System.Data.DataSet
  $SqlAdapter.Fill($DataSet) | Out-Null
  $SqlConnection.Close()
  $DataSet.Tables[0] | % { $_.BKP }
  #$temp = foreach ($row in $DataSet.Tables) {
  #  $row;
  #}
}


# Verifica bkp do Bando mConnect.
if ($bancos.Contains($Script:opcao)) {
  #Write-Host $Script:opcao.ToUpper()
  #Write-Host $Script:opcao.ToLower()
  #Write-Host $Script:opcao
  StatusDB($Script:opcao);
}
else {
  Write-Host "99"
}