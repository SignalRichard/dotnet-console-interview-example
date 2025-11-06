function Build-Solution {
    param(
        [string] $SolutionFilePath
    )
    dotnet build $SolutionFilePath
}

Export-ModuleMember -Function Build-Solution
