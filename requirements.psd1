@{
    PSDependOptions = @{
        Target = 'CurrentUser'
    }

    Pester = @{
        Name = 'Pester'
        DependencyType = 'PSGalleryModule'
        Version = '5.7.1'
    }
    Psake = @{
        Name = 'psake'
        DependencyType = 'PSGalleryModule'
        Version = '4.9.1'
    }
    PSScriptAnalyzer = @{
        Name = 'PSScriptAnalyzer'
        DependencyType = 'PSGalleryModule'
        Version = '1.24.0'
    }
}
