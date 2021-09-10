# PS-Scripts
**PowerShell scripts for automating tasks.**
_______________________________________________________________________________
## [Get Data From Remote AD Computers Using PS-Remoting](https://github.com/nathanjalston/PS-Scripts/blob/273ac188ceae6f6c889991367b89264b2196616c/Get%20Data%20From%20Remote%20AD%20Computers%20Using%20PS-Remoting.ps1)

Each function creates temporary PS-Remoting connections/sessions with all AD computers other than the local host and runs a command against each of the sessions to retrieve disk volume, printer, or IP Address information. The temporary session is created and discarded within the Invoke-Command. The disk volume, printer, or IP Address information is stored in a variable and is formatted and output as a table. For fun, the disk volume information is also enumerated to output certain phrases depending on how much space is remaining in each disk volume.

Lessons Learned:
* You must first Sort by a property in order to Group by that property; otherwise, "GroupBy" will not work properly.
* It seems that only one output can be run per PS script. There does not seem to be a way to output data from multiple different commands in one PS script. PS may be treating each output as entering data into a table and then showing the table to the user. In this case, it makes sense that only one output would be allowed in order to prevent conflicting column names in the output / table.

__________________________________________________________________________________
## [Set Expiration Date for AD User Accounts](https://github.com/nathanjalston/PS-Scripts/blob/273ac188ceae6f6c889991367b89264b2196616c/Set%20Expiration%20Date%20for%20AD%20User%20Accounts.ps1)

Sets the account expiration date for AD Users with names that begin with "A".

___________________________________________________________________________________
## [Get Locked AD User Accounts and Unlock](https://github.com/nathanjalston/PS-Scripts/blob/273ac188ceae6f6c889991367b89264b2196616c/Get%20Locked%20AD%20User%20Accounts%20and%20Unlock.ps1)

Retrieves all AD User accounts that currently have Account Lockout Times that are not equal to NULL (are currently locked out). The ForEach enumerates all of the locked accounts and unlocks them with the Unlock-ADAccount cmdlet.
Note: A specific set of the locked accounts can be unlocked by filtering the appropriate property in the Where-Object (?) statement.

____________________________________________________________________________________
## [Get Expired AD User Accounts](https://github.com/nathanjalston/PS-Scripts/blob/273ac188ceae6f6c889991367b89264b2196616c/Get%20Expired%20AD%20User%20Accounts.ps1)

The first script retrieves expired user accounts. The second script retrieves user accounts that expired within the last 24 hours.

______________________________________________________________________________________
## [Create New AD User Accounts From CSV](https://github.com/nathanjalston/PS-Scripts/blob/273ac188ceae6f6c889991367b89264b2196616c/New%20AD%20User%20Accounts%20From%20CSV.ps1)

Imports user data from a Comma-Separated Values file (.csv) and creates AD user accounts.
