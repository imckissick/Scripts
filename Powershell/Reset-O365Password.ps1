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

try {
    $creds = Get-Credential
    Connect-MsolService -Credential $creds -ErrorAction Stop
} catch {
    Write-Host "Failed to connect to Office 365"
}

If((Get-MsolCompanyInformation).PasswordSynchronization) {
    write-host "DirSync is enabled, reset password on the Domain Controller"
    return
}

$Password = Get-UserPassword

try{
    Set-MsolUserPassword `
        -UserPrincipalName $EmailAddress `
        -NewPassword $Password `
        -ForceChangePassword $True `
        -ErrorAction Stop
} catch {
    Write-Host "Failed to update password"
}