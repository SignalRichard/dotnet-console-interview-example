<#
.Synopsis
    Calls the running instance of the Open Policy Agent.
.DESCRIPTION
    Calls the Open Policy Agent's no_single_instance_characters policy valid policy with the providd test value.
.EXAMPLE
    Invoke-OpenPolicyAgent -TestValue 'hello'
.INPUTS
    System.String. The test value to check against the policy.
.OUTPUTS
    Hashtable. The policy response - will have a field named 'result' with a boolean value.
#>
function Invoke-OpenPolicyAgent {
    param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [string] $TestValue
    )

    process {
        $response = Invoke-RestMethod -Uri 'http://localhost:8181/v1/data/no_single_instance_characters/valid' -Method POST -Body (ConvertTo-Json -InputObject @{ input = @{ str = $TestValue } } -Compress) -Headers @{ 'Content-Type' = 'application/json' }
        return $response
    }
}

Export-ModuleMember -Function Invoke-OpenPolicyAgent
