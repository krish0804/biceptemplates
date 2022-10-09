@minLength(3)
@maxLength(19)
param stgActPrefix string

@allowed([
    'Standard_LRS'
    'Standard_GRS'
])
param stgActSKU string = 'Standard_LRS'
param location string = resourceGroup().location

param stgTags object = {
    Environment: 'Lab'
    Dept: 'IT'
}

var uniqueId = uniqueString(resourceGroup().id,deployment().name)
var uniqueIdShort = take(uniqueId,5)
var stgActName = '${stgActPrefix}${uniqueIdShort}'
//var location = resourceGroup().location

resource storage 'Microsoft.Storage/storageAccounts@2021-02-01' = {
    name: stgActName
    sku: {
        name: stgActSKU
    }
    kind: 'StorageV2'
    location: location
    tags: stgTags

}