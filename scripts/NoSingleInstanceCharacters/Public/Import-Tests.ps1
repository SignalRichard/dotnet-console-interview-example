function Import-Tests {
    param(
        [string] $TestsFilePath
    )

    return ConvertFrom-Json -InputObject (Get-Content -Path $TestsFilePath -Raw)
}

Export-ModuleMember -Function Import-Tests
