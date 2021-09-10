Get-ADUser -Filter * -Property AccountLockoutTime |`
? {$_.AccountLockoutTime -ne $null} |`
ForEach Unlock-ADAccount
