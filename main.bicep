// Parameters
param resourceGroupName string = 'RGroup'
param location string = resourceGroup().location
param appServicePlanName string = 'MyAppServicePlan'
param webAppName string = 'dadaNet'

// Resource: App Service Plan
resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: appServicePlanName
  location: location
  sku: {
    name: 'P1v2'
    tier: 'PremiumV2'
    size: 'P1v2'
    capacity: 1
  }
  properties: {
    reserved: false
  }
}

// Resource: App Service
resource webApp 'Microsoft.Web/sites@2022-03-01' = {
  name: webAppName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
  }
}

// Output
output webAppUrl string = 'https://${webAppName}.azurewebsites.net'
