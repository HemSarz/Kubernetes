<# $sourceDir = Get-Location
$targetDir = Join-Path -Path $sourceDir -ChildPath "dev"

# Create the target directory if it doesn't exist
if (-not (Test-Path $targetDir)) {
    New-Item -Path $targetDir -ItemType Directory -Force
}

# Move all items from the current directory to the target child directory
foreach ($item in Get-ChildItem -Path $sourceDir) {
    $destination = Join-Path -Path $targetDir -ChildPath $item.Name
    Move-Item -Path $item.FullName -Destination $destination -Force
}
#>
<# 
$sourceDir = Get-Location
$childdir = "ps1Scripts"
$items = @("mod.ps1", "spnconfig.ps1")
$targetDir = Join-Path -Path $sourceDir -ChildPath $childdir

# Create the target directory if it doesn't exist
if ( -not (Test-Path $targetDir) ) {
    New-Item -Path $targetDir -ItemType Directory -Force
}

    foreach ($item in $items) {
        $destination = Join-Path -Path $targetDir -ChildPath $item
        Move-Item -Path $item -Destination $destination -Force
    }
#>

$sourceDir = Get-Location
$targetChildDir = "./kubernetes"
$sourceChildDir = "ps1Scripts"

$targetDirCombined = Join-Path $sourceDir $targetChildDir
$targetChildDirCombined = Join-Path $targetDirCombined $sourceChildDir # Path for the ps1Scripts inside kubernetes

New-Item -Path $targetChildDirCombined -ItemType Directory -Force # Create ps1Scripts inside kubernetes

$items = Get-ChildItem -Path $sourceDir -Filter "*.ps1"

foreach ($item in $items) {
    $sourceItemPath = $item.FullName
    $destination = Join-Path $targetChildDirCombined $item.Name

    Move-Item $sourceItemPath $destination -Force
}