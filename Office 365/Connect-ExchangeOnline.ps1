# Note: When finished with Exchange Online, close the session with Remove-PSSession
# The session will continue to run disconnected if it is not manually closed

Import-Module MSOnline

$AdminCredential = Get-Credential
Connect-MsolService -credential $AdminCredential

$Session = New-PSSession `
    -ConfigurationName Microsoft.Exchange `
    -ConnectionUri https://outlook.office365.com/powershell-liveid/ `
    -Credential $AdminCredential `
    -Authentication Basic `
    -AllowRedirection

Import-PSSession $Session