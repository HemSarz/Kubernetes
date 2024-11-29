$dir = @(
    ".githhub/workflows",
    "terraform",
    "k8s",
    "website"
)

$dir | ForEach-Object {
    New-Item -ItemType Directory -Path $_
    New-Item -ItemType File -Path "$_/ .gitkeep" -Force
}