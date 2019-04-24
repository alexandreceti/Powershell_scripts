<# This form was created using POSHGUI.com  a free online gui designer for PowerShell
.NAME
    zabbix
#>

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$Form = New-Object system.Windows.Forms.Form
$Form.ClientSize = '400,400'
$Form.text = "Instalar Zabbix Agent"
$Form.TopMost = $false
$form.StartPosition = 'CenterScreen'

$Label1 = New-Object system.Windows.Forms.Label
$Label1.text = "Codigo Cliente:"
$Label1.AutoSize = $true
$Label1.width = 25
$Label1.height = 10
$Label1.location = New-Object System.Drawing.Point(10, 14)
$Label1.Font = 'Microsoft Sans Serif,10'

$Label2 = New-Object system.Windows.Forms.Label
$Label2.text = "Nome Computador:"
$Label2.AutoSize = $true
$Label2.width = 25
$Label2.height = 10
$Label2.location = New-Object System.Drawing.Point(10, 76)
$Label2.Font = 'Microsoft Sans Serif,10'

$TextBox1 = New-Object system.Windows.Forms.TextBox
$TextBox1.multiline = $false
$TextBox1.width = 100
$TextBox1.height = 20
$TextBox1.location = New-Object System.Drawing.Point(10, 36)
$TextBox1.Font = 'Microsoft Sans Serif,10'

$TextBox2 = New-Object system.Windows.Forms.TextBox
$TextBox2.multiline = $false
$TextBox2.width = 198
$TextBox2.height = 20
$TextBox2.location = New-Object System.Drawing.Point(10, 98)
$TextBox2.Font = 'Microsoft Sans Serif,10'

$Groupbox1 = New-Object system.Windows.Forms.Groupbox
$Groupbox1.height = 103
$Groupbox1.width = 126
$Groupbox1.text = "Zabbix"
$Groupbox1.location = New-Object System.Drawing.Point(265, 13)

$RadioButton1 = New-Object system.Windows.Forms.RadioButton
$RadioButton1.text = "32Bits"
$RadioButton1.AutoSize = $true
$RadioButton1.width = 104
$RadioButton1.height = 20
$RadioButton1.location = New-Object System.Drawing.Point(6, 24)
$RadioButton1.Font = 'Microsoft Sans Serif,10'

$RadioButton2 = New-Object system.Windows.Forms.RadioButton
$RadioButton2.text = "64Bits"
$RadioButton2.AutoSize = $true
$RadioButton2.width = 104
$RadioButton2.height = 20
$RadioButton2.location = New-Object System.Drawing.Point(5, 69)
$RadioButton2.Font = 'Microsoft Sans Serif,10'

$ButtonIntall = New-Object system.Windows.Forms.Button
$ButtonIntall.BackColor = "#7ed321"
$ButtonIntall.text = "Install"
$ButtonIntall.width = 60
$ButtonIntall.height = 30
$ButtonIntall.location = New-Object System.Drawing.Point(11, 352)
$ButtonIntall.Font = 'Microsoft Sans Serif,10'

$ButtonTeste = New-Object system.Windows.Forms.Button
$ButtonTeste.BackColor = "#4a90e2"
$ButtonTeste.text = "Teste"
$ButtonTeste.width = 60
$ButtonTeste.height = 30
$ButtonTeste.location = New-Object System.Drawing.Point(87, 352)
$ButtonTeste.Font = 'Microsoft Sans Serif,10'

$TextBox3 = New-Object system.Windows.Forms.TextBox
$TextBox3.multiline = $true
$TextBox3.width = 380
$TextBox3.height = 171
$TextBox3.location = New-Object System.Drawing.Point(11, 160)
$TextBox3.Font = 'Microsoft Sans Serif,10'

$Label3 = New-Object system.Windows.Forms.Label
$Label3.text = "Resultado:"
$Label3.AutoSize = $true
$Label3.width = 25
$Label3.height = 10
$Label3.location = New-Object System.Drawing.Point(10, 140)
$Label3.Font = 'Microsoft Sans Serif,10'

$ButtonSair = New-Object system.Windows.Forms.Button
$ButtonSair.BackColor = "#e85a6c"
$ButtonSair.text = "Sair"
$ButtonSair.width = 60
$ButtonSair.height = 30
$ButtonSair.location = New-Object System.Drawing.Point(331, 352)
$ButtonSair.Font = 'Microsoft Sans Serif,10'

$Form.controls.AddRange(@($Label1, $Label2, $TextBox1, $TextBox2, $Groupbox1, $ButtonIntall, $ButtonTeste, $TextBox3, $Label3, $ButtonSair))
$Groupbox1.controls.AddRange(@($RadioButton1, $RadioButton2))







$ButtonSair.Add_Click( { closeForm })
function closeForm() { $Form.close() }



#### fim do script
$Form.Add_Shown( { $Form.Activate() })
[void] $Form.ShowDialog()

