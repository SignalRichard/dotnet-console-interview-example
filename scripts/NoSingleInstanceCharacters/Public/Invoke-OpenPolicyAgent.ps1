function Invoke-OpenPolicyAgent {
    param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [string] $TestValue
    )

    $response = Invoke-RestMethod -Uri 'http://localhost:8181/v1/data/no_single_instance_characters/valid' -Method POST -Body (ConvertTo-Json -InputObject @{ input = @{ str = $TestValue } } -Compress) -Headers @{ 'Content-Type' = 'application/json' }
    return $response
}

Export-ModuleMember -Function Invoke-OpenPolicyAgent
