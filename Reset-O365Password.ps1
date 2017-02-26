param([string]$EmailAddress = "Email Address")

Import-Module MSOnline

Function Get-UserPassword {
    Do {
        Write-Host "Enter new password:"
        $Password = Read-Host

        Write-Host "Confirm new Password:"
        $ConfirmPassword = Read-Host

    } Until($Password -eq $ConfirmPassword)

    return $Password
}

$creds = Get-Credential
Connect-MsolService -Credential $creds

If((Get-MsolCompanyInformation).PasswordSynchronization) {
    write-host "DirSync is enabled, reset password on the Domain Controller"
    return
}

$Password = Get-UserPassword

Set-MsolUserPassword `
    -UserPrincipalName $EmailAddress `
    -NewPassword $Password `
    -ForceChangePassword $True