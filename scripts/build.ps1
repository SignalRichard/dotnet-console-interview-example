./Install-Dependencies.ps1

dotnet build
dotnet test
opa test .\policy
Invoke-Pester -Path ./scripts/NoSingleInstanceCharacters
Invoke-ScriptAnalyzer -Path scripts -Recurse
java -cp "/usr/local/bin/tla2tools.jar" pcal.trans "spec/RemoveSingleInstanceCharacters/RemoveSingleInstanceCharacters.tla"
java -XX:+IgnoreUnrecognizedVMOptions -XX:+UseParallelGC -cp "/usr/local/bin/tla2tools.jar" tlc2.TLC "-deadlock" "spec/RemoveSingleInstanceCharacters/RemoveSingleInstanceCharacters.tla"
