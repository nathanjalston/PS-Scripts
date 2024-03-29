Function Get-RemoteDrives
{
$localhost = $env:ComputerName

$drives = Invoke-Command -ScriptBlock {Get-Volume |`
Where {$_.DriveType -eq "Fixed" -and $_.DriveLetter -ne $null}}`
-ComputerName (Get-ADComputer -Filter {Name -ne $localhost} |`
Select -ExpandProperty Name)

$drives | Select @{n='ComputerName';e={$_.PSComputerName}}, DriveLetter, DriveType,`
@{n='Size (GB)';e={'{0:N2}' -f ($_.Size / 1GB)}},`
@{n='SizeRemaining (GB)';e={'{0:N2}' -f ($_.SizeRemaining / 1GB)}} |`
Sort ComputerName, DriveLetter | Format-Table -GroupBy ComputerName

ForEach ($drive in $drives)
{
if ($drive.SizeRemaining -ge 100)
{Write-Host $drive.PSComputerName drive $drive.DriveLetter is good.}
else
{Write-Host $drive.PSComputerName drive $drive.DriveLetter is not feeling so good.}
}
}

Get-RemoteDrives


<#----------This is a new PS-Script----------#>

Function Get-RemotePrinters
{
$localhost = $env:ComputerName

$printers = Invoke-Command -ScriptBlock {Get-Printer | Select Name}`
-ComputerName (Get-ADComputer -Filter {Name -ne $localhost} |`
Select -ExpandProperty Name)

$printers | Select @{n='ComputerName';e={$_.PSComputerName}}, Name |`
Sort ComputerName, Name | Format-Table -GroupBy ComputerName
}

Get-RemotePrinters


<#----------This is a new PS-Script----------#>

Function Get-RemoteIP
{
$localhost = $env:ComputerName

$IP = Invoke-Command -ScriptBlock {Get-NetIPAddress |`
? {$_.AddressFamily -eq "IPv4"} | Select IPAddress, AddressFamily}`
-ComputerName (Get-ADComputer -Filter {Name -ne $localhost} |`
Select -ExpandProperty Name)

$IP | Select @{n='ComputerName';e={$_.PSComputerName}}, IPAddress |`
Sort ComputerName | Format-Table -GroupBy ComputerName
}

Get-RemoteIP
