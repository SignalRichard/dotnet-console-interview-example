<#
.Synopsis
    Starts an instance of the Open Policy Agent.
.DESCRIPTION
    Starts the Open Policy Agent and automatically supplies the no_single_instance_characters policy and associated data file.
.EXAMPLE
    Start-OpenPolicyAgent -PolicyDirectoryPath './policy/no_single_instance_characters'
.INPUTS
    System.String. The policy directory path.
.OUTPUTS
    System.Diagnostics.Process. The started process.
#>
function Start-OpenPolicyAgent {
    [CmdletBinding(SupportsShouldProcess=$true)]
    param(
        [string] $PolicyDirectoryPath
    )

    if ($PSCmdlet.ShouldProcess($PolicyDirectoryPath, "Starting Open Policy Agent."))
    {
        $opaProcess = Start-Process -FilePath (Get-Command -Name 'opa').Source -ArgumentList @('run', '--server', "$PolicyDirectoryPath/no_single_instance_characters.rego", "$PolicyDirectoryPath/data.json") -PassThru -RedirectStandardOutput (New-TemporaryFile)
        return $opaProcess
    }
}

Export-ModuleMember -Function Start-OpenPolicyAgent
