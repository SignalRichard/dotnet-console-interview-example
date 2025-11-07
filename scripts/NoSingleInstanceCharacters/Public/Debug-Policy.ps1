<#
.Synopsis
    Lints the policies.
.DESCRIPTION
    Lints the policies.
.EXAMPLE
    Debug-Policy -PolicyDirectory './policy'
.INPUTS
    System.String. The policy directory.
#>

function Debug-Policy {
    param(
        [string] $PolicyDirectory
    )
    regal lint $PolicyDirectory
}

Export-ModuleMember -Function Debug-Policy
