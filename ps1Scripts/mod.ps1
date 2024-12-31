$sourceDir = "C:\1Lab\Kubernetes\"
$childdir = "webapp"
$items = @(
    "index.html", "style.css"
)

$targetDir = Join-Path -Path $sourceDir -ChildPath $childdir
New-Item -Path $targetDir -ItemType Directory -Force

foreach ($item in $items) {
    $itemPath = Join-Path -Path $targetDir -ChildPath $item
    
    New-Item -Path $itemPath -ItemType File -Force
}