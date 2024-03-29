$date = Get-Date
$users = Get-ADUser -Filter {GivenName -like "A*"} -Properties AccountExpirationDate

ForEach ($user in $users)
{
Set-ADUser $user -AccountExpirationDate $date.AddHours(-20)
}
