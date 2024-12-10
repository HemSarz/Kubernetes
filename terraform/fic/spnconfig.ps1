$MSGraphApi = "00000003-0000-0000-c000-000000000000" # MS Graph API Id
$permissions = @{
    "Directory.ReadWrite.All"   = "19dbc75e-c2e2-444c-a770-ec69d8559fc7=Role"
    "Application.ReadWrite.All" = "1bfefb4e-e0b5-418b-a88f-73c46d2cc8e9=Role"
}

$fields = @("appId", "id")
$backend_spn = "tfazspn"

$spninfo = @{ }
foreach ($field in $fields) {
    $spninfo[$field] = az ad sp show --id $(az ad sp list --display-name $backend_spn --query [0].appId -o tsv) --query $field -o tsv
}

$backend_SPNappId = $spninfo["appId"]
$backend_SPNObjId = $spninfo["id"]

Write-Host "Assign SPN AD Permissions..." -ForegroundColor Yellow

foreach ($permission in $permissions.GetEnumerator()) {
    Write-Host "Assigning permission: $($permission.Key)" -ForegroundColor Green
    az ad app permission add `
        --id $backend_SPNappId `
        --api $MSGraphApi `
        --api-permissions $permission.Value `
        -o table

    Write-Host "Granting permission: $($permission.Key)" -ForegroundColor Green
    az ad app permission grant `
        --id $backend_SPNappId `
        --api $MSGraphApi `
        --scope $permission.Value `
        -o table    
}

Start-Sleep 20

# Admin consent after all permissions have been added
Write-Host 'Granting admin-consent' -ForegroundColor Green
az ad app permission admin-consent `
    --id $backend_SPNappId

Find-MgGraphPermission Directory.ReadWrite.All | Format-List
Find-MgGraphPermission Application.ReadWrite.All | Format-List