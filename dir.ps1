$dirstruc = @(
    ".github/workflows",
    "terraform",
    "k8s",
    "website"
)

$dirstruc | ForEach-Object {
    $gitkeep = "$_/ .gitkeep"
    if (Test-Path $gitkeep) {
        Remove-Item $gitkeep -Force
    }
}