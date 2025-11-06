BeforeAll {
    Import-Module -Name (Join-Path -Path $PSScriptRoot -ChildPath '../NoSingleInstanceCharacters')
}

Describe 'Test-Application' {
    Context "When given a test argument" {
        BeforeEach {
            Mock Write-Host {}
            Mock -Module 'NoSingleInstanceCharacters' Invoke-Application { return "1 unit test" } -Verifiable
            Mock -Module 'NoSingleInstanceCharacters' Invoke-OpenPolicyAgent { return @{result = $true} } -Verifiable

            "1 unit test" | Test-Application
        }

        It "Invokes the application and validates the output" {
            Should -InvokeVerifiable
        }
    }
}

AfterAll {
    Remove-Module -Name 'NoSingleInstanceCharacters'
}
