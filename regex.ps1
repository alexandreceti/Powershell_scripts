$strText = "Alexandre Cunha Cruz Oliveira";
$search = "(?i)cruz";
$replace = "santos";

$teste = [regex]::replace($strText,$search,$replace);
Write-Host $teste;