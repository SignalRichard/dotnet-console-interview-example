Set-PSRepository -Name PSGallery -InstallationPolicy Trusted

Install-Module -Name PSDepend -Repository PSGallery -Scope CurrentUser -Force

Invoke-PSDepend -Path './requirements.psd1' -Install -Force -WarningAction SilentlyContinue
