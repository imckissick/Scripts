# Note: When finished with Exchange Online, close the session with Remove-PSSession
# The session will continue to run disconnected if it is not manually closed

Import-Module MSOnline

$UserCredential = Get-Credential
Connect-MsolService -credential $UserCredential

$Session = New-PSSession `
    -ConfigurationName Microsoft.Exchange `
    -ConnectionUri https://outlook.office365.com/powershell-liveid/ `
    -Credential $UserCredential `
    -Authentication Basic `
    -AllowRedirection

Import-PSSession $Session