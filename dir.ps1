$dirstruc = @(
    ".github/workflows",
    "terraform",
    "k8s",
    "website"
)

$dirstruc | ForEach-Object { New-Item -ItemType Directory -Path $_ }