<#
.Synopsis
    Runs the TLC model checker.
.DESCRIPTION
    Runs the TLC model checker.
.EXAMPLE
    Test-Model -SpecFilePath './spec/RemoveSingleInstanceCharacters/RemoveSingleInstanceCharacters.ps1'
.INPUTS
    System.String. The spec file path.
#>

function Test-Model {
    param(
        [string] $SpecFilePath,
        [string] $TLA2ToolsFilePath = '/usr/local/bin/tla2tools.jar',
        [string] $Options = '-deadlock'
    )

    java -XX:+IgnoreUnrecognizedVMOptions -XX:+UseParallelGC -cp $TLA2ToolsFilePath tlc2.TLC $Options $SpecFilePath
}

Export-ModuleMember -Function Test-Model
