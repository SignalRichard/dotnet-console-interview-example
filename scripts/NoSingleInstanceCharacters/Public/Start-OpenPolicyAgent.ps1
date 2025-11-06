function Start-OpenPolicyAgent {
    param(
        [string] $PolicyDirectoryPath
    )

    $opaProcess = Start-Process -FilePath (Get-Command -Name 'opa').Source -ArgumentList @('run', '--server', "$PolicyDirectoryPath/no_single_instance_characters.rego", "$PolicyDirectoryPath/data.json") -PassThru -RedirectStandardOutput (New-TemporaryFile)
    return $opaProcess
}

Export-ModuleMember -Function Start-OpenPolicyAgent
