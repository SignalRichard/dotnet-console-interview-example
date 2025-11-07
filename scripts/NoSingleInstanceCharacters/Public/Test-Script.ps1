<#
.Synopsis
    Pester PowerShell.
.DESCRIPTION
    Pester PowerShell.
.EXAMPLE
    Test-Script -ScriptsDirectory './scripts'
.INPUTS
    System.String. The scripts directory.
#>

function Test-Script {
    param(
        [string] $ScriptsDirectory
    )

    Invoke-Pester -Path $ScriptsDirectory
}

Export-ModuleMember -Function Test-Script
