<#
.Synopsis
    Runs the provided application and tests the output against the policies.
.DESCRIPTION
    Invokes the provided application and takes the output and sends it to an instance of the Open Policy Agent to validate.
.EXAMPLE
    Test-Application -TestArgument 'hello' -ApplicationFilePath 'C:/Temp/app.exe'
.INPUTS
    System.String. The test argument to supply to the application.
    System.String. The file path to the application to run.
#>
function Test-Application {
    param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [AllowEmptyString()]
        [string[]] $TestArgument,
        [string] $ApplicationFilePath
    )

    process {
        $InformationPreference = 'Continue'
        Write-Information -MessageData "Test argument: $TestArgument"
        $output = $TestArgument | Invoke-Application -ApplicationFilePath $ApplicationFilePath
        Write-Information -MessageData "Output: $output"
        $response = $output | Invoke-OpenPolicyAgent
        Write-Information -MessageData "Result: $(if($response.result) { "Pass" } else { "Fail" })"
    }
}

Export-ModuleMember -Function Test-Application
