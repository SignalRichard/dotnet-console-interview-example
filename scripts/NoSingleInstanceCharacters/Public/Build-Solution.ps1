<#
.Synopsis
    Builds the provided dotnet solution file.
.DESCRIPTION
    Builds the provided dotnet solution file.
.EXAMPLE
    Build-Solution -SolutionFilePath './solution.sln'
.INPUTS
    System.String. The solution file path.
#>

function Build-Solution {
    param(
        [string] $SolutionFilePath
    )
    dotnet build $SolutionFilePath
}

Export-ModuleMember -Function Build-Solution
