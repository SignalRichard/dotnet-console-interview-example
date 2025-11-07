<#
.Synopsis
    Tests the policies.
.DESCRIPTION
    Tests the policies.
.EXAMPLE
    Test-Policy -PolicyDirectory './policy'
.INPUTS
    System.String. The policy directory.
#>

function Test-Policy {
    param(
        [string] $PolicyDirectory
    )
    opa test $PolicyDirectory
}

Export-ModuleMember -Function Test-Policy
