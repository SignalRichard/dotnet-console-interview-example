<#
.Synopsis
    Imports an array of test arguments from the provided JSON tests file.
.DESCRIPTION
    Imports an array of test arguments from the provided JSON tests file.
.EXAMPLE
    Import-Test -TestsFilePath './test_arguments.json'
.INPUTS
    System.String. The tests JSON file containing a "tests" object with the value as an array of strings.
.OUTPUTS
    PSCustomObject containing the converted tests file.
#>
function Import-Test {
    param(
        [string] $TestsFilePath
    )

    return ConvertFrom-Json -InputObject (Get-Content -Path $TestsFilePath -Raw)
}

Export-ModuleMember -Function Import-Test
