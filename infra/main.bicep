targetScope = 'subscription'

@minLength(1)
@description('Primary location for all resources')
param location string = 'eastus2'


resource resourceGroup 'Microsoft.Resources/resourceGroups@2020-06-01' = {
    name: 'rg-serverlessresumeapi'
    location: location
}


module resources './resources.bicep' = {
    name: 'resources'
    scope: resourceGroup
    params: {
        location: location
    }
}

output APP_WEB_BASE_URL string = resources.outputs.uri
output AZURE_LOCATION string = location
