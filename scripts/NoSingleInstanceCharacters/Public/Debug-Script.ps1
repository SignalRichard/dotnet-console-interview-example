<#
.Synopsis
    Lints PowerShell.
.DESCRIPTION
    Lints PowerShell.
.EXAMPLE
    Debug-Script -ScriptsDirectory './scripts'
.INPUTS
    System.String. The scripts directory.
#>

function Debug-Script {
    param(
        [string] $ScriptsDirectory
    )

    Invoke-ScriptAnalyzer -Path $ScriptsDirectory -Recurse
}

Export-ModuleMember -Function Debug-Script
