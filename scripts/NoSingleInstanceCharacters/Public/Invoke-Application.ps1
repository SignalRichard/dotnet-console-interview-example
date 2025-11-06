function Invoke-Application {
    param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [string] $TestArgument,
        [string] $ApplicationFilePath
    )

    $output = & $ApplicationFilePath $TestArgument
    return $output
}

Export-ModuleMember -Function Invoke-Application
