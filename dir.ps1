$dirstruc = @(
    ".github/workflows",
    "terraform",
    "k8s",
    "website"
)

$dirstruc | ForEach-Object { 
    New-Item -ItemType Directory -Path $_ 
    New-Item -ItemType File -Path "$_/ .gitkeep" -Force | Out-Null
}