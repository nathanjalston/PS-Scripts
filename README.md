# PS-Scripts
**PowerShell scripts for automating tasks.**
_______________________________________________________________________________
## Get Data From Remote AD Computers Using PS-Remoting

Each function creates temporary PS-Remoting connections/sessions with all AD computers other than the local host and runs a command against each of the sessions to retrieve disk volume, printer, or IP Address information. The temporary session is created and discarded within the Invoke-Command. The disk volume, printer, or IP Address information is stored in a variable and is formatted and output as a table. For fun, the disk volume information is also enumerated to output certain phrases depending on how much space is remaining in each disk volume.

Lessons Learned:
* You must first Sort by a property in order to Group by that property; otherwise, "GroupBy" will not work properly.
* It seems that only one output can be run per PS script. There does not seem to be a way to output data from multiple different commands in one PS script. PS may be treating each output as entering data into a table and then showing the table to the user. In this case, it makes sense that only one output would be allowed in order to prevent conflicting column names in the output / table.

__________________________________________________________________________________
## Set Expiration Date for AD User Accounts

Sets the account expiration date for AD Users with names that begin with "A".

___________________________________________________________________________________
## Get Locked AD User Accounts and Unlock

Retrieves all AD User accounts that currently have Account Lockout Times that are not equal to NULL (are currently locked out). The ForEach enumerates all of the locked accounts and unlocks them with the Unlock-ADAccount cmdlet.
Note: A certain set of the locked accounts can be unlocked by filtering the appropriate property in the Where-Object (?) statement.

____________________________________________________________________________________
## Get Expired AD User Accounts

The first script retrieves expired user accounts. The second script retrieves user accounts that expired within the last 24 hours.
