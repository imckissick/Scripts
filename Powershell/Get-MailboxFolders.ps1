Get-Mailbox |
Select-Object alias |
Foreach-Object {Get-MailboxFolderStatistics -Identity $_.alias | Select-Object Identity,ItemsInFolder,FolderSize} |
Export-Csv C:\Stats.csv -NoTypeInformation