task default -depends Init, Build, Test, Lint

task Init {
    Import-Module -Name './scripts/NoSingleInstanceCharacters'
}

task Build -depends Init {
    Build-Solution -SolutionFilePath './RemoveSingleInstanceCharacters.sln'
    ConvertFrom-PlusCal -SpecFilePath 'spec/RemoveSingleInstanceCharacters/RemoveSingleInstanceCharacters.tla'
}

task Test -depends Build, Init {
    Test-Solution -SolutionFilePath './RemoveSingleInstanceCharacters.sln'
    Test-Policy -PolicyDirectory './policy'
    Test-Script -ScriptsDirectory './scripts'
    Test-Model -SpecFilePath 'spec/RemoveSingleInstanceCharacters/RemoveSingleInstanceCharacters.tla'
}

task Lint -depends Init {
    Debug-Policy -PolicyDirectory './policy'
    Debug-Script -ScriptsDirectory '.'
}
