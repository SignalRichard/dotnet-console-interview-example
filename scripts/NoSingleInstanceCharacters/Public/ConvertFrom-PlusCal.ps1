<#
.Synopsis
    Runs PlusCal to TLA+ conversion.
.DESCRIPTION
    Runs PlusCal to TLA+ conversion.
.EXAMPLE
    ConvertFrom-PlusCal -SpecFilePath './spec/RemoveSingleInstanceCharacters/RemoveSingleInstanceCharacters.ps1'
.INPUTS
    System.String. The spec file path.
#>

function ConvertFrom-PlusCal {
    param(
        [string] $SpecFilePath,
        [string] $TLA2ToolsFilePath = '/usr/local/bin/tla2tools.jar'
    )

    java -cp $TLA2ToolsFilePath pcal.trans $SpecFilePath
}

Export-ModuleMember -Function ConvertFrom-PlusCal
