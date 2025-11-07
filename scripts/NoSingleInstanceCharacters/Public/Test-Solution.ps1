<#
.Synopsis
    Tests the provided dotnet solution file.
.DESCRIPTION
    Tests the provided dotnet solution file.
.EXAMPLE
    Build-Solution -SolutionFilePath './solution.sln'
.INPUTS
    System.String. The solution file path.
#>

function Test-Solution {
    param(
        [string] $SolutionFilePath
    )
    dotnet test $SolutionFilePath
}

Export-ModuleMember -Function Test-Solution
