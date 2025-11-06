@{
    PSDependOptions = @{
        Target = 'CurrentUser'
    }

    Pester = @{
        Name = 'Pester'
        DependencyType = 'PSGalleryModule'
        Version = '5.7.1'
    }
    PSScriptAnalyzer = @{
        Name = 'PSScriptAnalyzer'
        DependencyType = 'PSGalleryModule'
        Version = '1.24.0'
    }
}
