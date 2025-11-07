./scripts/Install-Dependencies.ps1
Invoke-psake -TaskList @("ContinuousIntegration")
