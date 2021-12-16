param name string
param location string = resourceGroup().location
param principalId string
param principalType string

resource lt 'Microsoft.LoadTestService/loadTests@2021-12-01-preview' = {
  name: name
  location: location
  properties: {
  }
}

// Add Load Test Owner role assignment to the service principal
resource ra 'Microsoft.Authorization/roleAssignments@2020-08-01-preview' = {
  name: guid('${resourceGroup().id}/${name}')
  scope: lt
  properties: {
    principalId: principalId
    principalType: principalType
    roleDefinitionId: '${subscription().id}/providers/Microsoft.Authorization/roleDefinitions/45bb0b16-2f0c-4e78-afaa-a07599b003f6'
  }
}

