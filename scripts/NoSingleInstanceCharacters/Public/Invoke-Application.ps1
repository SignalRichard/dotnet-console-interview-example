<#
.Synopsis
    Invokes the provided application with the supplied test argument.
.DESCRIPTION
    Invokes the provided application with the supplied test argument.
.EXAMPLE
    Invoke-Application -TestArgument 'test -ApplicationFilePath 'C:/Temp/app.exe'
.INPUTS
    System.String. The test argument to supply to the application.
    System.String. The file path to the application to run.
.OUTPUTS
    System.String. The application's output.
#>
function Invoke-Application {
    param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [string] $TestArgument,
        [string] $ApplicationFilePath
    )

    process {
        $output = & $ApplicationFilePath $TestArgument
        return $output
    }
}

Export-ModuleMember -Function Invoke-Application
