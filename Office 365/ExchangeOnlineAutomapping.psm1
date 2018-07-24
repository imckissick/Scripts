function Enable-EOAutomapping {
    [cmdletbinding()]
    param(
        [Parameter(Mandatory=$true)]
        $Identity,
        [Parameter(Mandatory=$true)]
        $User
    )

    Begin {}

    Process {

        $AccessRights = Get-MailboxPermission -Identity $Identity -User $User
        If($null -eq $AccessRights) {
            Break
        }

        Remove-MailboxPermission -Identity $Identity -User $User
        Add-MailboxPermission -Identity $Identity -User $User -AccessRights $AccessRights -Automapping:$True
    }

    End {}
}

function Disable-EOAutomapping {
    [cmdletbinding()]
    param(
        [Parameter(Mandatory=$true)]
        $Identity,
        [Parameter(Mandatory=$true)]
        $User
    )

    Begin {}

    Process {
        $AccessRights = Get-MailboxPermission -Identity $Identity -User $User
        If($null -eq $AccessRights) {
            Break
        }

        Remove-MailboxPermission -Identity $Identity -User $User
        Add-MailboxPermission -Identity $Identity -User $User -AccessRights $AccessRights -Automapping:$False
    }

    End {}
}

function Remove-EOAutomapping {
    [cmdletbinding()]
    param(
        [Parameter(Mandatory=$true)]
        $Identity
    )

    Begin {}

    Process {
            Remove-MailboxPermission -Identity $Identity -ClearAutomapping
    }

    End {}
}

Export-ModuleMember -Function *-EOAutomapping
