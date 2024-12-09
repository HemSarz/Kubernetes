############################################ 
# Set Azure SPN | Permissions VB
############################################

$MSGraphApi = "00000003-0000-0000-c000-000000000000" # MS Graph API Id
$appDirRoleId = "19dbc75e-c2e2-444c-a770-ec69d8559fc7=Role" # Directory.ReadWrite.All

# Existing SPN name
$backend_spn = "tfazspn"

##################################################################
# Retrieve existing Service Principal credentials
##################################################################

Write-Host "Using existing service principal..." -ForegroundColor Yellow

# Retrieve the SPN appId (client ID) for the existing SPN
$backend_SPNappId = $(az ad sp list `
    --display-name $backend_spn `
    --query [0].appId `
    -o tsv)

# Fetch SPN object ID
$backend_SPNObjId = $(az ad sp show `
    --id $backend_SPNappId `
    --query id `
    -o tsv)

Write-Host "Assign SPN AD Permissions..." -ForegroundColor Yellow

# Assign Directory permissions
Write-Host 'Assign permission appDir...' -ForegroundColor Green
az ad app permission add `
    --id $backend_SPNappId `
    --api $MSGraphApi `
    --api-permissions $appDirRoleId

# Grant permissions to the SP
Write-Host 'Granting permissions...' -ForegroundColor Green
az ad app permission grant `
    --id $backend_SPNappId `
    --api $MSGraphApi `
    --scope $appDirRoleId

# Admin consent
Write-Host 'Granting admin-consent' -ForegroundColor Green
az ad app permission admin-consent `
    --id $backend_SPNappId
