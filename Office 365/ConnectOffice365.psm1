function Connect-O365Exchange {
    [CmdletBinding()]
    param(
        [ValidateNotNull()]
        [System.Management.Automation.PSCredential]
        [System.Management.Automation.Credential()]
        $Credential = [System.Management.Automation.PSCredential]::Empty
    )

    Begin {}

    Process {
        $O365ExchangeSession = New-PSSession `
        -ConfigurationName Microsoft.Exchange `
        -ConnectionUri https://outlook.office365.com/powershell-liveid/ `
        -Credential $Credential `
        -Authentication Basic `
        -AllowRedirection
    }

    End {
        Import-Module (Import-PSSession $O365ExchangeSession -AllowClobber) -Global
    }
}

function Disconnect-O365Exchange {
    [CmdletBinding()]
    param()

    Begin {}

    Process {
        Remove-PSSession $O365ExchangeSession
    }

    End {
        $O365ExchangeSession = $null
    }
}

function Connect-O365Skype {
    [CmdletBinding()]
    param(
        [ValidateNotNull()]
        [System.Management.Automation.PSCredential]
        [System.Management.Automation.Credential()]
        $Credential = [System.Management.Automation.PSCredential]::Empty
    )

    Begin {
        Import-Module SkypeOnlineConnector
    }

    Process {
        $O365SkypeSession = New-CsOnlineSession -Credential $Credential
    }

    End {
        Import-Module (Import-PSSession $O365SkypeSession -AllowClobber) -Global
    }
}

function Disconnect-O365Skype {
    [CmdletBinding()]
    param()

    Begin {}

    Process {
        Remove-PSSession $O365SkypeSession
    }

    End {
        $O365SkypeSession = $null
        Remove-Module SkypeOnlineConnector
    }
}

function Connect-O365Sharepoint {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [String]$O365Tenant,
        [ValidateNotNull()]
        [System.Management.Automation.PSCredential]
        [System.Management.Automation.Credential()]
        $Credential = [System.Management.Automation.PSCredential]::Empty
    )

    Begin {
        Import-Module Microsoft.Online.SharePoint.PowerShell
    }

    Process {
    }

    End {
    }
}

function Disconnect-O365Sharepoint {
    [CmdletBinding()]
    param()

    Begin {}

    Process {

    }

    End {
        Remove-Module Microsoft.Online.SharePoint.PowerShell
    }
}

function Connect-O365SecurityAndCompliance {
    [CmdletBinding()]
    param(
        [ValidateNotNull()]
        [System.Management.Automation.PSCredential]
        [System.Management.Automation.Credential()]
        $Credential = [System.Management.Automation.PSCredential]::Empty
    )

    Begin {}

    Process {
        $O365SecuritySession = New-PSSession `
        -ConfigurationName Microsoft.Exchange `
        -ConnectionUri https://ps.compliance.protection.outlook.com/powershell-liveid/ `
        -Credential $Credential `
        -Authentication "Basic" `
        -AllowRedirection
    }

    End {
        Import-Module (Import-PSSession $O365SecuritySession -AllowClobber) -Global
    }
}

function Disconnect-O365SecurityAndCompliance {
    [CmdletBinding()]
    param(

    )

    Begin {}

    Process {
        Remove-PSSession $O365SecuritySession
    }

    End {
        $O365SecuritySession = $null
    }
}

function Install-O365Modules {
    [CmdletBinding()]
    param()

    Install-Module MSOnline
    Install-Module AzureAD
    Install-Module SkypeOnlineConnector
}

Export-ModuleMember -Function Connect-O365*
Export-ModuleMember -Function Disconnect-O365*
Export-ModuleMember -Function Install-O365*