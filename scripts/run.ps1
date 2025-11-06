param(
    [string] $ApplicationFilePath
)

if([string]::IsNullOrEmpty($ApplicationFilePath)) {
    $ApplicationFilePath = (Join-Path -Path $PSScriptRoot -ChildPath '../src/RemoveSingleInstanceCharacters/bin/Debug/net8.0/RemoveSingleInstanceCharacters.exe')
}

Import-Module -Name (Join-Path -Path $PSScriptRoot -ChildPath 'NoSingleInstanceCharacters')
# Build-Solution -SolutionFilePath (Join-Path -Path $PSScriptRoot -ChildPath '../RemoveSingleInstanceCharacters.sln')
$opaProcess = Start-OpenPolicyAgent -PolicyDirectoryPath (Join-Path -Path $PSScriptRoot -ChildPath '../policy')
(Import-Tests -TestsFilePath (Join-Path -Path $PSScriptRoot -ChildPath 'test_arguments.json')).tests | Test-Application -ApplicationFilePath $ApplicationFilePath
$opaProcess | Stop-Process
Remove-Module -Name 'NoSingleInstanceCharacters'
