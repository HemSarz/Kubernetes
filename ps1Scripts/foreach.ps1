$sourceDir = Get-Location
$childdir = "test-local-tf-providers"
$items = @(
    "provider.tf", ".terraform", ".terraform.lock.hcl"
)

$targetDir = Join-Path -Path $sourceDir -ChildPath $childdir

New-Item -Path $targetDir -ItemType Directory -Force

foreach ($item in $items) {
    $itemPath = Join-Path -Path $targetDir -ChildPath $item

    try {
        Move-Item -Path $item -Destination $itemPath -Force # -Force to avoid prompt if file exists
        Write-Host "Moved $($item) to $($itemPath)"
    }
    catch {
        Write-Error "Failed to move $($item): $($_.Exception.Message)"
    }
}
