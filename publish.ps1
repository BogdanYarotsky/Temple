# Pack your project
dotnet pack

# Find the .nupkg file in the ./nupkg directory, assuming there's only one package in the folder.
$packageFilePath = Get-ChildItem ./nupkg/*.nupkg | Sort-Object LastWriteTime -Descending | Select-Object -First 1

# Check if the package file was found
if ($null -eq $packageFilePath) {
    Write-Error "No .nupkg file found in ./nupkg directory."
    exit 1
}

# Push the package to NuGet
dotnet nuget push $packageFilePath.FullName --api-key "$env:NugetApiKey" --source "https://api.nuget.org/v3/index.json"