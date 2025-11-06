function Test-Application {
    param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [string[]] $TestArgument,
        [string] $ApplicationFilePath
    )

    process {
        Write-Host -Object "Test argument: $TestArgument"
        $output = $TestArgument | Invoke-Application -ApplicationFilePath $ApplicationFilePath
        Write-Host -Object "Output: $output"
        $response = $output | Invoke-OpenPolicyAgent
        Write-Host -Object "Result: $(if($response.result) { "Pass" } else { "Fail" })"
    }
}

Export-ModuleMember -Function Test-Application
