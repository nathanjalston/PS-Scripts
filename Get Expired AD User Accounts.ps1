# Retrieve expired user accounts.

$date = Get-Date
Get-ADUser -Filter * -Property AccountExpirationDate |`
? {$_.AccountExpirationDate -le $date -and $_.AccountExpirationDate -ne $null} |`
Select AccountExpirationDate, Name, @{n='UPN'; e={$_.UserPrincipalName}} |`
Sort AccountExpirationDate, Name


<#----------This is a new PS-Script----------#>

# Retrieve user accounts that expired within the last 24 hours

$date = Get-Date
Get-ADUser -Filter * -Property AccountExpirationDate |`
? {$_.AccountExpirationDate -le $date -and $_.AccountExpirationDate -ge $date.AddHours(-24)} |`
Select AccountExpirationDate, Name, @{n='UPN'; e={$_.UserPrincipalName}} |`
Sort AccountExpirationDate, Name
