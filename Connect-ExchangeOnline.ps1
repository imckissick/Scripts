# Note: After running this script, run Remove-PSSession $Session
# The session will continue to run disconnect if it is not manually ended

Import-Module MsOnline

$UserCredential = Get-Credential

$Global:Session = New-PSSession `
    -ConfigurationName Microsoft.Exchange `
    -ConnectionUri https://outlook.office365.com/powershell-liveid/ `
    -Credential $UserCredential `
    -Authentication Basic `
    -AllowRedirection

Import-PSSession $Session

Write-Host "When finished run 'Remove-PSSesion `$Session' to end the session"