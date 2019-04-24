Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = 'Instalação do Zabbix'
$form.Size = New-Object System.Drawing.Size(400, 500)
$form.StartPosition = 'CenterScreen'

$OKButton = New-Object System.Windows.Forms.Button
$OKButton.Location = New-Object System.Drawing.Point(10, 450)
$OKButton.Size = New-Object System.Drawing.Size(75, 23)
$OKButton.Text = 'OK'
$OKButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $OKButton
$form.Controls.Add($OKButton)

$CancelButton = New-Object System.Windows.Forms.Button
$CancelButton.Location = New-Object System.Drawing.Point(250, 450)
$CancelButton.Size = New-Object System.Drawing.Size(75, 23)
$CancelButton.Text = 'Cancel'
$CancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $CancelButton
$form.Controls.Add($CancelButton)

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10, 20)
$label.Size = New-Object System.Drawing.Size(280, 20)
$label.Text = 'Entre Codigo do cliente'
$form.Controls.Add($label)

$textBox = New-Object System.Windows.Forms.TextBox
$textBox.Location = New-Object System.Drawing.Point(10, 40)
$textBox.Size = New-Object System.Drawing.Size(260, 20)
$form.Controls.Add($textBox)

$label2 = New-Object System.Windows.Forms.Label
$label2.Location = New-Object System.Drawing.Point(10, 60)
$label2.Size = New-Object System.Drawing.Size(280, 20)
$label2.Text = 'E-mail'
$form.Controls.Add($label2)

$textBox2 = New-Object System.Windows.Forms.TextBox
$textBox2.Location = New-Object System.Drawing.Point(10, 80)
$textBox2.Size = New-Object System.Drawing.Size(260, 20)
$form.Controls.Add($textBox2)

$label2 = New-Object System.Windows.Forms.Label
$label2.Location = New-Object System.Drawing.Point(10, 90)
$label2.Size = New-Object System.Drawing.Size(280, 20)
$label2.Text = 'E-mail'
$form.Controls.Add($label2)

$calendar = New-Object System.Windows.Forms.MonthCalendar
$calendar.Location = New-Object System.Drawing.Point(10, 120)
$calendar.ShowTodayCircle = $false
$calendar.MaxSelectionCount = 1
$form.Controls.Add($calendar)

$form.Topmost = $true

$form.Add_Shown( { $textBox.Select() })
#$form.Add_Shown( { $textBox2.Select() })
$result = $form.ShowDialog()

if ($result -eq [System.Windows.Forms.DialogResult]::OK) {
  $x = $textBox.Text
  $x
  $y = $textBox2.Text
  $y
  $date = $calendar.SelectionStart
  Write-Host "Date selected: $($date.ToShortDateString())"
}