resource myexpenses_docintelligence 'Microsoft.CognitiveServices/accounts@2026-05-01' = {
  name: 'myexpenses-docintelligence'
  location: 'centralus'
  sku: {
    name: 'F0'
  }
  kind: 'FormRecognizer'
  identity: {
    type: 'None'
  }
  properties: {
    customSubDomainName: 'myexpenses-docintelligence'
    networkAcls: {
      defaultAction: 'Allow'
      virtualNetworkRules: []
      ipRules: []
    }
    allowProjectManagement: false
    publicNetworkAccess: 'Enabled'
  }
}

resource myexpenses_db_server 'Microsoft.Sql/servers@2025-02-01-preview' = {
  name: 'myexpenses-db-server'
  location: 'centralus'
  kind: 'v12.0'
  properties: {
    administratorLogin: 'CloudSAac3e3eda'
    version: '12.0'
    minimalTlsVersion: '1.2'
    publicNetworkAccess: 'Enabled'
    administrators: {
      administratorType: 'ActiveDirectory'
      principalType: 'User'
      login: 'vijayabhaarathy_gmail.com#EXT#@vijayabhaarathygmail.onmicrosoft.com'
      sid: 'cfc503bb-4463-4939-bbd7-49fb4051fd16'
      tenantId: '4dbc0a24-85b3-42fa-9bda-511e124b4972'
      azureADOnlyAuthentication: false
    }
    restrictOutboundNetworkAccess: 'Disabled'
    retentionDays: -1
  }
}

resource myexpensesstorageacc 'Microsoft.Storage/storageAccounts@2026-04-01' = {
  name: 'myexpensesstorageacc'
  location: 'centralus'
  sku: {
    name: 'Standard_RAGRS'
    tier: 'Standard'
  }
  kind: 'StorageV2'
  properties: {
    dualStackEndpointPreference: {
      publishIpv6Endpoint: false
    }
    dnsEndpointType: 'Standard'
    defaultToOAuthAuthentication: false
    publicNetworkAccess: 'Enabled'
    allowCrossTenantReplication: false
    minimumTlsVersion: 'TLS1_2'
    allowBlobPublicAccess: false
    allowSharedKeyAccess: true
    largeFileSharesState: 'Enabled'
    networkAcls: {
      ipv6Rules: []
      bypass: 'AzureServices'
      virtualNetworkRules: []
      ipRules: []
      defaultAction: 'Allow'
    }
    supportsHttpsTrafficOnly: true
    encryption: {
      requireInfrastructureEncryption: false
      services: {
        file: {
          keyType: 'Account'
          enabled: true
        }
        blob: {
          keyType: 'Account'
          enabled: true
        }
      }
      keySource: 'Microsoft.Storage'
    }
    accessTier: 'Hot'
  }
}

resource azureblob 'Microsoft.Web/connections@2016-06-01' = {
  name: 'azureblob'
  location: 'centralus'
  kind: 'V1'
  properties: {
    displayName: 'new_conn_13d40'
    statuses: [
      {
        status: 'Ready'
      }
    ]
    customParameterValues: {}
    createdTime: '2025-09-03T07:09:46.6124083Z'
    changedTime: '2025-09-03T07:09:46.6124083Z'
    api: {
      name: 'azureblob'
      displayName: 'Azure Blob Storage'
      description: 'Microsoft Azure Storage provides a massively scalable, durable, and highly available storage for data on the cloud, and serves as the data storage solution for modern applications. Connect to Blob Storage to perform various operations such as create, update, get and delete on blobs in your Azure Storage account.'
      iconUri: 'https://static.powerapps.com/resource/ppcr/releases/v1.0.1819/1.0.1819.4795/azureblob/icon.png'
      brandColor: '#804998'
      id: '/subscriptions/dc047e3c-dc08-457f-92cc-3a531d30bb7b/providers/Microsoft.Web/locations/centralus/managedApis/azureblob'
      type: 'Microsoft.Web/locations/managedApis'
    }
    testLinks: [
      {
        requestUri: 'https://management.azure.com:443/subscriptions/dc047e3c-dc08-457f-92cc-3a531d30bb7b/resourceGroups/myexpenses-suite-rg/providers/Microsoft.Web/connections/azureblob/extensions/proxy/testconnection?api-version=2016-06-01'
        method: 'get'
      }
    ]
  }
}

resource azureblob_1 'Microsoft.Web/connections@2016-06-01' = {
  name: 'azureblob-1'
  location: 'centralus'
  kind: 'V1'
  properties: {
    displayName: 'new_conn_638d8'
    statuses: [
      {
        status: 'Connected'
      }
    ]
    customParameterValues: {}
    createdTime: '2025-09-03T07:39:14.4363095Z'
    changedTime: '2025-09-03T07:39:14.4363095Z'
    api: {
      name: 'azureblob'
      displayName: 'Azure Blob Storage'
      description: 'Microsoft Azure Storage provides a massively scalable, durable, and highly available storage for data on the cloud, and serves as the data storage solution for modern applications. Connect to Blob Storage to perform various operations such as create, update, get and delete on blobs in your Azure Storage account.'
      iconUri: 'https://static.powerapps.com/resource/ppcr/releases/v1.0.1819/1.0.1819.4795/azureblob/icon.png'
      brandColor: '#804998'
      id: '/subscriptions/dc047e3c-dc08-457f-92cc-3a531d30bb7b/providers/Microsoft.Web/locations/centralus/managedApis/azureblob'
      type: 'Microsoft.Web/locations/managedApis'
    }
    testLinks: [
      {
        requestUri: 'https://management.azure.com:443/subscriptions/dc047e3c-dc08-457f-92cc-3a531d30bb7b/resourceGroups/myexpenses-suite-rg/providers/Microsoft.Web/connections/azureblob-1/extensions/proxy/testconnection?api-version=2016-06-01'
        method: 'get'
      }
    ]
  }
}

resource azureblob_10 'Microsoft.Web/connections@2016-06-01' = {
  name: 'azureblob-10'
  location: 'centralus'
  kind: 'V1'
  properties: {
    displayName: 'new_conn_045e6'
    statuses: [
      {
        status: 'Ready'
      }
    ]
    customParameterValues: {}
    createdTime: '2025-10-03T16:33:48.8283711Z'
    changedTime: '2025-10-03T16:33:48.8283711Z'
    api: {
      name: 'azureblob'
      displayName: 'Azure Blob Storage'
      description: 'Microsoft Azure Storage provides a massively scalable, durable, and highly available storage for data on the cloud, and serves as the data storage solution for modern applications. Connect to Blob Storage to perform various operations such as create, update, get and delete on blobs in your Azure Storage account.'
      iconUri: 'https://static.powerapps.com/resource/ppcr/releases/v1.0.1819/1.0.1819.4795/azureblob/icon.png'
      brandColor: '#804998'
      id: '/subscriptions/dc047e3c-dc08-457f-92cc-3a531d30bb7b/providers/Microsoft.Web/locations/centralus/managedApis/azureblob'
      type: 'Microsoft.Web/locations/managedApis'
    }
    testLinks: [
      {
        requestUri: 'https://management.azure.com:443/subscriptions/dc047e3c-dc08-457f-92cc-3a531d30bb7b/resourceGroups/myexpenses-suite-rg/providers/Microsoft.Web/connections/azureblob-10/extensions/proxy/testconnection?api-version=2016-06-01'
        method: 'get'
      }
    ]
  }
}

resource azureblob_11 'Microsoft.Web/connections@2016-06-01' = {
  name: 'azureblob-11'
  location: 'centralus'
  kind: 'V1'
  properties: {
    displayName: 'new_conn_1f6f3'
    statuses: [
      {
        status: 'Ready'
      }
    ]
    customParameterValues: {}
    createdTime: '2025-10-03T16:41:26.22358Z'
    changedTime: '2025-10-03T16:41:26.22358Z'
    api: {
      name: 'azureblob'
      displayName: 'Azure Blob Storage'
      description: 'Microsoft Azure Storage provides a massively scalable, durable, and highly available storage for data on the cloud, and serves as the data storage solution for modern applications. Connect to Blob Storage to perform various operations such as create, update, get and delete on blobs in your Azure Storage account.'
      iconUri: 'https://static.powerapps.com/resource/ppcr/releases/v1.0.1819/1.0.1819.4795/azureblob/icon.png'
      brandColor: '#804998'
      id: '/subscriptions/dc047e3c-dc08-457f-92cc-3a531d30bb7b/providers/Microsoft.Web/locations/centralus/managedApis/azureblob'
      type: 'Microsoft.Web/locations/managedApis'
    }
    testLinks: [
      {
        requestUri: 'https://management.azure.com:443/subscriptions/dc047e3c-dc08-457f-92cc-3a531d30bb7b/resourceGroups/myexpenses-suite-rg/providers/Microsoft.Web/connections/azureblob-11/extensions/proxy/testconnection?api-version=2016-06-01'
        method: 'get'
      }
    ]
  }
}

resource azureblob_12 'Microsoft.Web/connections@2016-06-01' = {
  name: 'azureblob-12'
  location: 'centralus'
  kind: 'V1'
  properties: {
    displayName: 'new_conn_eadd7'
    statuses: [
      {
        status: 'Ready'
      }
    ]
    customParameterValues: {}
    createdTime: '2025-10-04T17:45:08.5763518Z'
    changedTime: '2025-10-04T17:45:08.5763518Z'
    api: {
      name: 'azureblob'
      displayName: 'Azure Blob Storage'
      description: 'Microsoft Azure Storage provides a massively scalable, durable, and highly available storage for data on the cloud, and serves as the data storage solution for modern applications. Connect to Blob Storage to perform various operations such as create, update, get and delete on blobs in your Azure Storage account.'
      iconUri: 'https://static.powerapps.com/resource/ppcr/releases/v1.0.1819/1.0.1819.4795/azureblob/icon.png'
      brandColor: '#804998'
      id: '/subscriptions/dc047e3c-dc08-457f-92cc-3a531d30bb7b/providers/Microsoft.Web/locations/centralus/managedApis/azureblob'
      type: 'Microsoft.Web/locations/managedApis'
    }
    testLinks: [
      {
        requestUri: 'https://management.azure.com:443/subscriptions/dc047e3c-dc08-457f-92cc-3a531d30bb7b/resourceGroups/myexpenses-suite-rg/providers/Microsoft.Web/connections/azureblob-12/extensions/proxy/testconnection?api-version=2016-06-01'
        method: 'get'
      }
    ]
  }
}

resource azureblob_2 'Microsoft.Web/connections@2016-06-01' = {
  name: 'azureblob-2'
  location: 'centralus'
  kind: 'V1'
  properties: {
    displayName: 'new_conn_78c4d'
    statuses: [
      {
        status: 'Ready'
      }
    ]
    customParameterValues: {}
    createdTime: '2025-10-02T13:14:01.9316449Z'
    changedTime: '2025-10-02T13:14:01.9316449Z'
    api: {
      name: 'azureblob'
      displayName: 'Azure Blob Storage'
      description: 'Microsoft Azure Storage provides a massively scalable, durable, and highly available storage for data on the cloud, and serves as the data storage solution for modern applications. Connect to Blob Storage to perform various operations such as create, update, get and delete on blobs in your Azure Storage account.'
      iconUri: 'https://static.powerapps.com/resource/ppcr/releases/v1.0.1819/1.0.1819.4795/azureblob/icon.png'
      brandColor: '#804998'
      id: '/subscriptions/dc047e3c-dc08-457f-92cc-3a531d30bb7b/providers/Microsoft.Web/locations/centralus/managedApis/azureblob'
      type: 'Microsoft.Web/locations/managedApis'
    }
    testLinks: [
      {
        requestUri: 'https://management.azure.com:443/subscriptions/dc047e3c-dc08-457f-92cc-3a531d30bb7b/resourceGroups/myexpenses-suite-rg/providers/Microsoft.Web/connections/azureblob-2/extensions/proxy/testconnection?api-version=2016-06-01'
        method: 'get'
      }
    ]
  }
}

resource azureblob_3 'Microsoft.Web/connections@2016-06-01' = {
  name: 'azureblob-3'
  location: 'centralus'
  kind: 'V1'
  properties: {
    displayName: 'new_conn_d67e8'
    statuses: [
      {
        status: 'Connected'
      }
    ]
    customParameterValues: {}
    createdTime: '2025-09-03T07:59:09.9817734Z'
    changedTime: '2025-09-03T07:59:09.9817734Z'
    api: {
      name: 'azureblob'
      displayName: 'Azure Blob Storage'
      description: 'Microsoft Azure Storage provides a massively scalable, durable, and highly available storage for data on the cloud, and serves as the data storage solution for modern applications. Connect to Blob Storage to perform various operations such as create, update, get and delete on blobs in your Azure Storage account.'
      iconUri: 'https://static.powerapps.com/resource/ppcr/releases/v1.0.1819/1.0.1819.4795/azureblob/icon.png'
      brandColor: '#804998'
      id: '/subscriptions/dc047e3c-dc08-457f-92cc-3a531d30bb7b/providers/Microsoft.Web/locations/centralus/managedApis/azureblob'
      type: 'Microsoft.Web/locations/managedApis'
    }
    testLinks: [
      {
        requestUri: 'https://management.azure.com:443/subscriptions/dc047e3c-dc08-457f-92cc-3a531d30bb7b/resourceGroups/myexpenses-suite-rg/providers/Microsoft.Web/connections/azureblob-3/extensions/proxy/testconnection?api-version=2016-06-01'
        method: 'get'
      }
    ]
  }
}

resource azureblob_4 'Microsoft.Web/connections@2016-06-01' = {
  name: 'azureblob-4'
  location: 'centralus'
  kind: 'V1'
  properties: {
    displayName: 'new_conn_8654e'
    statuses: [
      {
        status: 'Connected'
      }
    ]
    customParameterValues: {}
    createdTime: '2025-10-02T13:16:38.4542373Z'
    changedTime: '2025-10-02T13:16:38.4542373Z'
    api: {
      name: 'azureblob'
      displayName: 'Azure Blob Storage'
      description: 'Microsoft Azure Storage provides a massively scalable, durable, and highly available storage for data on the cloud, and serves as the data storage solution for modern applications. Connect to Blob Storage to perform various operations such as create, update, get and delete on blobs in your Azure Storage account.'
      iconUri: 'https://static.powerapps.com/resource/ppcr/releases/v1.0.1819/1.0.1819.4795/azureblob/icon.png'
      brandColor: '#804998'
      id: '/subscriptions/dc047e3c-dc08-457f-92cc-3a531d30bb7b/providers/Microsoft.Web/locations/centralus/managedApis/azureblob'
      type: 'Microsoft.Web/locations/managedApis'
    }
    testLinks: [
      {
        requestUri: 'https://management.azure.com:443/subscriptions/dc047e3c-dc08-457f-92cc-3a531d30bb7b/resourceGroups/myexpenses-suite-rg/providers/Microsoft.Web/connections/azureblob-4/extensions/proxy/testconnection?api-version=2016-06-01'
        method: 'get'
      }
    ]
  }
}

resource azureblob_5 'Microsoft.Web/connections@2016-06-01' = {
  name: 'azureblob-5'
  location: 'centralus'
  kind: 'V1'
  properties: {
    displayName: 'new_conn_726f3'
    statuses: [
      {
        status: 'Connected'
      }
    ]
    customParameterValues: {}
    createdTime: '2025-10-02T13:28:56.028787Z'
    changedTime: '2025-10-02T13:28:56.028787Z'
    api: {
      name: 'azureblob'
      displayName: 'Azure Blob Storage'
      description: 'Microsoft Azure Storage provides a massively scalable, durable, and highly available storage for data on the cloud, and serves as the data storage solution for modern applications. Connect to Blob Storage to perform various operations such as create, update, get and delete on blobs in your Azure Storage account.'
      iconUri: 'https://static.powerapps.com/resource/ppcr/releases/v1.0.1819/1.0.1819.4795/azureblob/icon.png'
      brandColor: '#804998'
      id: '/subscriptions/dc047e3c-dc08-457f-92cc-3a531d30bb7b/providers/Microsoft.Web/locations/centralus/managedApis/azureblob'
      type: 'Microsoft.Web/locations/managedApis'
    }
    testLinks: [
      {
        requestUri: 'https://management.azure.com:443/subscriptions/dc047e3c-dc08-457f-92cc-3a531d30bb7b/resourceGroups/myexpenses-suite-rg/providers/Microsoft.Web/connections/azureblob-5/extensions/proxy/testconnection?api-version=2016-06-01'
        method: 'get'
      }
    ]
  }
}

resource azureblob_6 'Microsoft.Web/connections@2016-06-01' = {
  name: 'azureblob-6'
  location: 'centralus'
  kind: 'V1'
  properties: {
    displayName: 'new_conn_261dd'
    statuses: [
      {
        status: 'Ready'
      }
    ]
    customParameterValues: {}
    createdTime: '2025-10-03T15:25:13.992875Z'
    changedTime: '2025-10-03T15:25:13.992875Z'
    api: {
      name: 'azureblob'
      displayName: 'Azure Blob Storage'
      description: 'Microsoft Azure Storage provides a massively scalable, durable, and highly available storage for data on the cloud, and serves as the data storage solution for modern applications. Connect to Blob Storage to perform various operations such as create, update, get and delete on blobs in your Azure Storage account.'
      iconUri: 'https://static.powerapps.com/resource/ppcr/releases/v1.0.1819/1.0.1819.4795/azureblob/icon.png'
      brandColor: '#804998'
      id: '/subscriptions/dc047e3c-dc08-457f-92cc-3a531d30bb7b/providers/Microsoft.Web/locations/centralus/managedApis/azureblob'
      type: 'Microsoft.Web/locations/managedApis'
    }
    testLinks: [
      {
        requestUri: 'https://management.azure.com:443/subscriptions/dc047e3c-dc08-457f-92cc-3a531d30bb7b/resourceGroups/myexpenses-suite-rg/providers/Microsoft.Web/connections/azureblob-6/extensions/proxy/testconnection?api-version=2016-06-01'
        method: 'get'
      }
    ]
  }
}

resource azureblob_7 'Microsoft.Web/connections@2016-06-01' = {
  name: 'azureblob-7'
  location: 'centralus'
  kind: 'V1'
  properties: {
    displayName: 'new_conn_6bdcd'
    statuses: [
      {
        status: 'Ready'
      }
    ]
    customParameterValues: {}
    createdTime: '2025-10-03T15:31:20.4421499Z'
    changedTime: '2025-10-03T15:31:20.4421499Z'
    api: {
      name: 'azureblob'
      displayName: 'Azure Blob Storage'
      description: 'Microsoft Azure Storage provides a massively scalable, durable, and highly available storage for data on the cloud, and serves as the data storage solution for modern applications. Connect to Blob Storage to perform various operations such as create, update, get and delete on blobs in your Azure Storage account.'
      iconUri: 'https://static.powerapps.com/resource/ppcr/releases/v1.0.1819/1.0.1819.4795/azureblob/icon.png'
      brandColor: '#804998'
      id: '/subscriptions/dc047e3c-dc08-457f-92cc-3a531d30bb7b/providers/Microsoft.Web/locations/centralus/managedApis/azureblob'
      type: 'Microsoft.Web/locations/managedApis'
    }
    testLinks: [
      {
        requestUri: 'https://management.azure.com:443/subscriptions/dc047e3c-dc08-457f-92cc-3a531d30bb7b/resourceGroups/myexpenses-suite-rg/providers/Microsoft.Web/connections/azureblob-7/extensions/proxy/testconnection?api-version=2016-06-01'
        method: 'get'
      }
    ]
  }
}

resource azureblob_8 'Microsoft.Web/connections@2016-06-01' = {
  name: 'azureblob-8'
  location: 'centralus'
  kind: 'V1'
  properties: {
    displayName: 'myexpensesstorageacc_v2'
    statuses: [
      {
        status: 'Ready'
      }
    ]
    customParameterValues: {}
    createdTime: '2025-10-03T16:28:09.4041698Z'
    changedTime: '2025-10-03T16:28:09.4041698Z'
    api: {
      name: 'azureblob'
      displayName: 'Azure Blob Storage'
      description: 'Microsoft Azure Storage provides a massively scalable, durable, and highly available storage for data on the cloud, and serves as the data storage solution for modern applications. Connect to Blob Storage to perform various operations such as create, update, get and delete on blobs in your Azure Storage account.'
      iconUri: 'https://static.powerapps.com/resource/ppcr/releases/v1.0.1819/1.0.1819.4795/azureblob/icon.png'
      brandColor: '#804998'
      id: '/subscriptions/dc047e3c-dc08-457f-92cc-3a531d30bb7b/providers/Microsoft.Web/locations/centralus/managedApis/azureblob'
      type: 'Microsoft.Web/locations/managedApis'
    }
    testLinks: [
      {
        requestUri: 'https://management.azure.com:443/subscriptions/dc047e3c-dc08-457f-92cc-3a531d30bb7b/resourceGroups/myexpenses-suite-rg/providers/Microsoft.Web/connections/azureblob-8/extensions/proxy/testconnection?api-version=2016-06-01'
        method: 'get'
      }
    ]
  }
}

resource azureblob_9 'Microsoft.Web/connections@2016-06-01' = {
  name: 'azureblob-9'
  location: 'centralus'
  kind: 'V1'
  properties: {
    displayName: 'new_conn_acdaf'
    statuses: [
      {
        status: 'Connected'
      }
    ]
    customParameterValues: {}
    createdTime: '2025-10-03T16:29:01.1225139Z'
    changedTime: '2025-10-03T16:29:01.1225139Z'
    api: {
      name: 'azureblob'
      displayName: 'Azure Blob Storage'
      description: 'Microsoft Azure Storage provides a massively scalable, durable, and highly available storage for data on the cloud, and serves as the data storage solution for modern applications. Connect to Blob Storage to perform various operations such as create, update, get and delete on blobs in your Azure Storage account.'
      iconUri: 'https://static.powerapps.com/resource/ppcr/releases/v1.0.1819/1.0.1819.4795/azureblob/icon.png'
      brandColor: '#804998'
      id: '/subscriptions/dc047e3c-dc08-457f-92cc-3a531d30bb7b/providers/Microsoft.Web/locations/centralus/managedApis/azureblob'
      type: 'Microsoft.Web/locations/managedApis'
    }
    testLinks: [
      {
        requestUri: 'https://management.azure.com:443/subscriptions/dc047e3c-dc08-457f-92cc-3a531d30bb7b/resourceGroups/myexpenses-suite-rg/providers/Microsoft.Web/connections/azureblob-9/extensions/proxy/testconnection?api-version=2016-06-01'
        method: 'get'
      }
    ]
  }
}

resource azureeventgrid 'Microsoft.Web/connections@2016-06-01' = {
  name: 'azureeventgrid'
  location: 'centralus'
  kind: 'V1'
  properties: {
    displayName: 'live.com#vijayabhaarathy@gmail.com'
    statuses: [
      {
        status: 'Connected'
      }
    ]
    customParameterValues: {}
    nonSecretParameterValues: {
      'token:tenantId': '4dbc0a24-85b3-42fa-9bda-511e124b4972'
      'token:grantType': 'code'
    }
    createdTime: '2025-09-03T06:13:59.8080074Z'
    changedTime: '2026-08-07T15:56:17.4466648Z'
    api: {
      name: 'azureeventgrid'
      displayName: 'Azure Event Grid'
      description: 'Azure Event Grid is an eventing backplane that enables event based programing with pub/sub semantics and reliable distribution & delivery for all services in Azure as well as third parties.'
      iconUri: 'https://static.powerapps.com/resource/ppcr/releases/v1.0.1819/1.0.1819.4795/azureeventgrid/icon.png'
      brandColor: '#0072c6'
      id: '/subscriptions/dc047e3c-dc08-457f-92cc-3a531d30bb7b/providers/Microsoft.Web/locations/centralus/managedApis/azureeventgrid'
      type: 'Microsoft.Web/locations/managedApis'
    }
    testLinks: []
  }
}

resource formrecognizer 'Microsoft.Web/connections@2016-06-01' = {
  name: 'formrecognizer'
  location: 'centralus'
  kind: 'V1'
  properties: {
    displayName: 'myexpenses-doc-intelligence-connection'
    statuses: [
      {
        status: 'Connected'
      }
    ]
    customParameterValues: {}
    nonSecretParameterValues: {
      siteUrl: 'https://myexpenses-docintelligence.cognitiveservices.azure.com/'
    }
    createdTime: '2025-09-03T06:23:45.1954379Z'
    changedTime: '2025-09-03T06:23:45.1954379Z'
    api: {
      name: 'formrecognizer'
      displayName: 'Azure AI Document Intelligence (form recognizer)'
      description: 'Extracts text (printed and handwritten OCR) and additional information (tables, checkboxes, fields / key value pairs) from PDFs, images or Microsoft Office documents and forms into structured data based on pre-trained models (layout, invoice, receipt, id, business card) or custom model created by a set of representative training forms using AI powered document understanding.'
      iconUri: 'https://static.powerapps.com/resource/ppcr/releases/v1.0.1819/1.0.1819.4795/formrecognizer/icon.png'
      brandColor: '#0063B1'
      id: '/subscriptions/dc047e3c-dc08-457f-92cc-3a531d30bb7b/providers/Microsoft.Web/locations/centralus/managedApis/formrecognizer'
      type: 'Microsoft.Web/locations/managedApis'
    }
    testLinks: []
  }
}

resource formrecognizer_1 'Microsoft.Web/connections@2016-06-01' = {
  name: 'formrecognizer-1'
  location: 'centralus'
  kind: 'V1'
  properties: {
    displayName: 'new_conn_58ac0'
    statuses: [
      {
        status: 'Connected'
      }
    ]
    customParameterValues: {}
    nonSecretParameterValues: {
      siteUrl: 'https://myexpenses-docintelligence.cognitiveservices.azure.com/'
    }
    createdTime: '2025-11-19T07:15:51.5324289Z'
    changedTime: '2025-11-19T07:15:51.5324289Z'
    api: {
      name: 'formrecognizer'
      displayName: 'Azure AI Document Intelligence (form recognizer)'
      description: 'Extracts text (printed and handwritten OCR) and additional information (tables, checkboxes, fields / key value pairs) from PDFs, images or Microsoft Office documents and forms into structured data based on pre-trained models (layout, invoice, receipt, id, business card) or custom model created by a set of representative training forms using AI powered document understanding.'
      iconUri: 'https://static.powerapps.com/resource/ppcr/releases/v1.0.1819/1.0.1819.4795/formrecognizer/icon.png'
      brandColor: '#0063B1'
      id: '/subscriptions/dc047e3c-dc08-457f-92cc-3a531d30bb7b/providers/Microsoft.Web/locations/centralus/managedApis/formrecognizer'
      type: 'Microsoft.Web/locations/managedApis'
    }
    testLinks: []
  }
}

resource formrecognizer_2 'Microsoft.Web/connections@2016-06-01' = {
  name: 'formrecognizer-2'
  location: 'centralus'
  kind: 'V1'
  properties: {
    displayName: 'new_conn_89917'
    statuses: [
      {
        status: 'Connected'
      }
    ]
    customParameterValues: {}
    nonSecretParameterValues: {
      siteUrl: 'https://myexpenses-docintelligence.cognitiveservices.azure.com/'
    }
    createdTime: '2025-11-19T15:09:06.6418487Z'
    changedTime: '2025-11-19T15:09:06.6418487Z'
    api: {
      name: 'formrecognizer'
      displayName: 'Azure AI Document Intelligence (form recognizer)'
      description: 'Extracts text (printed and handwritten OCR) and additional information (tables, checkboxes, fields / key value pairs) from PDFs, images or Microsoft Office documents and forms into structured data based on pre-trained models (layout, invoice, receipt, id, business card) or custom model created by a set of representative training forms using AI powered document understanding.'
      iconUri: 'https://static.powerapps.com/resource/ppcr/releases/v1.0.1819/1.0.1819.4795/formrecognizer/icon.png'
      brandColor: '#0063B1'
      id: '/subscriptions/dc047e3c-dc08-457f-92cc-3a531d30bb7b/providers/Microsoft.Web/locations/centralus/managedApis/formrecognizer'
      type: 'Microsoft.Web/locations/managedApis'
    }
    testLinks: []
  }
}

resource sql 'Microsoft.Web/connections@2016-06-01' = {
  name: 'sql'
  location: 'centralus'
  kind: 'V1'
  properties: {
    displayName: 'new_conn_cdea9'
    statuses: [
      {
        status: 'Ready'
      }
    ]
    customParameterValues: {}
    createdTime: '2025-10-02T06:04:58.7980876Z'
    changedTime: '2025-10-02T06:04:58.7980876Z'
    api: {
      name: 'sql'
      displayName: 'SQL Server'
      description: 'Microsoft SQL Server is a relational database management system developed by Microsoft. Connect to SQL Server to manage data. You can perform various actions such as create, update, get, and delete on rows in a table.'
      iconUri: 'https://static.powerapps.com/resource/ppcr/releases/v1.0.1816/1.0.1816.4770/sql/icon.png'
      brandColor: '#ba141a'
      id: '/subscriptions/dc047e3c-dc08-457f-92cc-3a531d30bb7b/providers/Microsoft.Web/locations/centralus/managedApis/sql'
      type: 'Microsoft.Web/locations/managedApis'
    }
    testLinks: [
      {
        requestUri: 'https://management.azure.com:443/subscriptions/dc047e3c-dc08-457f-92cc-3a531d30bb7b/resourceGroups/myexpenses-suite-rg/providers/Microsoft.Web/connections/sql/extensions/proxy/testconnection?api-version=2016-06-01'
        method: 'get'
      }
    ]
  }
}

resource sql_1 'Microsoft.Web/connections@2016-06-01' = {
  name: 'sql-1'
  location: 'centralus'
  kind: 'V1'
  properties: {
    displayName: 'new_conn_2f4a4'
    statuses: [
      {
        status: 'Ready'
      }
    ]
    customParameterValues: {}
    createdTime: '2025-10-02T07:52:18.3549538Z'
    changedTime: '2025-10-02T07:52:18.3549538Z'
    api: {
      name: 'sql'
      displayName: 'SQL Server'
      description: 'Microsoft SQL Server is a relational database management system developed by Microsoft. Connect to SQL Server to manage data. You can perform various actions such as create, update, get, and delete on rows in a table.'
      iconUri: 'https://static.powerapps.com/resource/ppcr/releases/v1.0.1816/1.0.1816.4770/sql/icon.png'
      brandColor: '#ba141a'
      id: '/subscriptions/dc047e3c-dc08-457f-92cc-3a531d30bb7b/providers/Microsoft.Web/locations/centralus/managedApis/sql'
      type: 'Microsoft.Web/locations/managedApis'
    }
    testLinks: [
      {
        requestUri: 'https://management.azure.com:443/subscriptions/dc047e3c-dc08-457f-92cc-3a531d30bb7b/resourceGroups/myexpenses-suite-rg/providers/Microsoft.Web/connections/sql-1/extensions/proxy/testconnection?api-version=2016-06-01'
        method: 'get'
      }
    ]
  }
}

resource sql_2 'Microsoft.Web/connections@2016-06-01' = {
  name: 'sql-2'
  location: 'centralus'
  kind: 'V1'
  properties: {
    displayName: 'new_conn_50860'
    statuses: [
      {
        status: 'Ready'
      }
    ]
    customParameterValues: {}
    createdTime: '2025-10-02T13:22:43.3236061Z'
    changedTime: '2025-10-02T13:22:43.3236061Z'
    api: {
      name: 'sql'
      displayName: 'SQL Server'
      description: 'Microsoft SQL Server is a relational database management system developed by Microsoft. Connect to SQL Server to manage data. You can perform various actions such as create, update, get, and delete on rows in a table.'
      iconUri: 'https://static.powerapps.com/resource/ppcr/releases/v1.0.1816/1.0.1816.4770/sql/icon.png'
      brandColor: '#ba141a'
      id: '/subscriptions/dc047e3c-dc08-457f-92cc-3a531d30bb7b/providers/Microsoft.Web/locations/centralus/managedApis/sql'
      type: 'Microsoft.Web/locations/managedApis'
    }
    testLinks: [
      {
        requestUri: 'https://management.azure.com:443/subscriptions/dc047e3c-dc08-457f-92cc-3a531d30bb7b/resourceGroups/myexpenses-suite-rg/providers/Microsoft.Web/connections/sql-2/extensions/proxy/testconnection?api-version=2016-06-01'
        method: 'get'
      }
    ]
  }
}

resource sql_3 'Microsoft.Web/connections@2016-06-01' = {
  name: 'sql-3'
  location: 'centralus'
  kind: 'V1'
  properties: {
    displayName: 'new_conn_e3a3a'
    statuses: [
      {
        status: 'Connected'
      }
    ]
    customParameterValues: {}
    createdTime: '2025-10-04T17:30:39.518482Z'
    changedTime: '2025-10-04T17:30:39.518482Z'
    api: {
      name: 'sql'
      displayName: 'SQL Server'
      description: 'Microsoft SQL Server is a relational database management system developed by Microsoft. Connect to SQL Server to manage data. You can perform various actions such as create, update, get, and delete on rows in a table.'
      iconUri: 'https://static.powerapps.com/resource/ppcr/releases/v1.0.1816/1.0.1816.4770/sql/icon.png'
      brandColor: '#ba141a'
      id: '/subscriptions/dc047e3c-dc08-457f-92cc-3a531d30bb7b/providers/Microsoft.Web/locations/centralus/managedApis/sql'
      type: 'Microsoft.Web/locations/managedApis'
    }
    testLinks: [
      {
        requestUri: 'https://management.azure.com:443/subscriptions/dc047e3c-dc08-457f-92cc-3a531d30bb7b/resourceGroups/myexpenses-suite-rg/providers/Microsoft.Web/connections/sql-3/extensions/proxy/testconnection?api-version=2016-06-01'
        method: 'get'
      }
    ]
  }
}

resource sqldw 'Microsoft.Web/connections@2016-06-01' = {
  name: 'sqldw'
  location: 'centralus'
  kind: 'V1'
  properties: {
    displayName: 'new_conn_0f9fa'
    statuses: [
      {
        status: 'Connected'
      }
    ]
    customParameterValues: {}
    createdTime: '2025-11-23T12:22:09.7604494Z'
    changedTime: '2025-11-23T12:22:09.7604494Z'
    api: {
      name: 'sqldw'
      displayName: 'Azure SQL Data Warehouse'
      description: 'Microsoft Azure SQL Data Warehouse is a relational database management system developed by Microsoft. Connect to Azure SQL Data Warehouse to view your data.'
      iconUri: 'https://static.powerapps.com/resource/ppcr/releases/v1.0.1807/1.0.1807.4698/sqldw/icon.png'
      id: '/subscriptions/dc047e3c-dc08-457f-92cc-3a531d30bb7b/providers/Microsoft.Web/locations/centralus/managedApis/sqldw'
      type: 'Microsoft.Web/locations/managedApis'
    }
    testLinks: [
      {
        requestUri: 'https://management.azure.com:443/subscriptions/dc047e3c-dc08-457f-92cc-3a531d30bb7b/resourceGroups/myexpenses-suite-rg/providers/Microsoft.Web/connections/sqldw/extensions/proxy/testconnection?api-version=2016-06-01'
        method: 'get'
      }
    ]
  }
}

resource myexpensesstorageacc_3d4e4493_77a0_4bc1_a914_32ef44a08c19 'Microsoft.EventGrid/systemTopics@2025-07-15-preview' = {
  name: 'myexpensesstorageacc-3d4e4493-77a0-4bc1-a914-32ef44a08c19'
  location: 'centralus'
  properties: {
    source: myexpensesstorageacc.id
    topicType: 'microsoft.storage.storageaccounts'
  }
}

resource myexpensesstorageacc_3d4e4493_77a0_4bc1_a914_32ef44a08c19_95b69246_6ca0_fad5_0a82_a209facf0499 'Microsoft.EventGrid/systemTopics/eventSubscriptions@2025-07-15-preview' = {
  parent: myexpensesstorageacc_3d4e4493_77a0_4bc1_a914_32ef44a08c19
  name: '95b69246-6ca0-fad5-0a82-a209facf0499'
  properties: {
    destination: {
      properties: {
        maxEventsPerBatch: 1
        preferredBatchSizeInKilobytes: 64
      }
      endpointType: 'WebHook'
    }
    filter: {
      subjectBeginsWith: '/blobServices/default/containers/myexpenses-bulkupload/blobs/'
      includedEventTypes: [
        'Microsoft.Storage.BlobCreated'
      ]
      advancedFilters: [
        {
          values: [
            'CopyBlob'
            'PutBlob'
            'PutBlockList'
            'FlushWithClose'
            'DeleteBlob'
            'CreateFile'
            'DeleteFile'
          ]
          operatorType: 'StringIn'
          key: 'data.api'
        }
        {
          value: json('0')
          operatorType: 'NumberGreaterThan'
          key: 'data.contentLength'
        }
      ]
    }
    eventDeliverySchema: 'EventGridSchema'
    retryPolicy: {
      maxDeliveryAttempts: 30
      eventTimeToLiveInMinutes: 1440
    }
  }
}

resource myexpenses_db_server_ActiveDirectory 'Microsoft.Sql/servers/administrators@2025-02-01-preview' = {
  parent: myexpenses_db_server
  name: 'ActiveDirectory'
  properties: {
    administratorType: 'ActiveDirectory'
    login: 'vijayabhaarathy_gmail.com#EXT#@vijayabhaarathygmail.onmicrosoft.com'
    sid: 'cfc503bb-4463-4939-bbd7-49fb4051fd16'
    tenantId: '4dbc0a24-85b3-42fa-9bda-511e124b4972'
  }
}

resource myexpenses_db_server_Default 'Microsoft.Sql/servers/advancedThreatProtectionSettings@2025-02-01-preview' = {
  parent: myexpenses_db_server
  name: 'Default'
  properties: {
    state: 'Disabled'
  }
}

resource myexpenses_db_server_CreateIndex 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: myexpenses_db_server
  name: 'CreateIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource myexpenses_db_server_DbParameterization 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: myexpenses_db_server
  name: 'DbParameterization'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource myexpenses_db_server_DefragmentIndex 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: myexpenses_db_server
  name: 'DefragmentIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource myexpenses_db_server_DropIndex 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: myexpenses_db_server
  name: 'DropIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource myexpenses_db_server_ForceLastGoodPlan 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: myexpenses_db_server
  name: 'ForceLastGoodPlan'
  properties: {
    autoExecuteValue: 'Enabled'
  }
}

resource Microsoft_Sql_servers_auditingPolicies_myexpenses_db_server_Default 'Microsoft.Sql/servers/auditingPolicies@2014-04-01' = {
  parent: myexpenses_db_server
  name: 'Default'
  location: 'Central US'
  properties: {
    auditingState: 'Disabled'
  }
}

resource Microsoft_Sql_servers_auditingSettings_myexpenses_db_server_Default 'Microsoft.Sql/servers/auditingSettings@2025-02-01-preview' = {
  parent: myexpenses_db_server
  name: 'Default'
  properties: {
    retentionDays: 0
    auditActionsAndGroups: []
    isStorageSecondaryKeyInUse: false
    isAzureMonitorTargetEnabled: false
    isManagedIdentityInUse: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
}

resource Microsoft_Sql_servers_azureADOnlyAuthentications_myexpenses_db_server_Default 'Microsoft.Sql/servers/azureADOnlyAuthentications@2025-02-01-preview' = {
  parent: myexpenses_db_server
  name: 'Default'
  properties: {
    azureADOnlyAuthentication: false
  }
}

resource Microsoft_Sql_servers_connectionPolicies_myexpenses_db_server_default 'Microsoft.Sql/servers/connectionPolicies@2025-02-01-preview' = {
  parent: myexpenses_db_server
  name: 'default'
  location: 'centralus'
  properties: {
    connectionType: 'Default'
  }
}

resource myexpenses_db_server_myexpenses_db 'Microsoft.Sql/servers/databases@2025-02-01-preview' = {
  parent: myexpenses_db_server
  name: 'myexpenses_db'
  location: 'centralus'
  sku: {
    name: 'GP_S_Gen5_2'
    tier: 'GeneralPurpose'
    family: 'Gen5'
    capacity: 2
  }
  kind: 'v12.0,user,vcore,serverless,freelimit'
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    maxSizeBytes: 34359738368
    catalogCollation: 'SQL_Latin1_General_CP1_CI_AS'
    zoneRedundant: false
    readScale: 'Disabled'
    autoPauseDelay: 60
    requestedBackupStorageRedundancy: 'Local'
    minCapacity: json('0.5')
    maintenanceConfigurationId: '/subscriptions/dc047e3c-dc08-457f-92cc-3a531d30bb7b/providers/Microsoft.Maintenance/publicMaintenanceConfigurations/SQL_Default'
    isLedgerOn: false
    useFreeLimit: true
    freeLimitExhaustionBehavior: 'AutoPause'
    availabilityZone: 'NoPreference'
  }
}

resource myexpenses_db_server_master_Default 'Microsoft.Sql/servers/databases/advancedThreatProtectionSettings@2025-02-01-preview' = {
  name: 'myexpenses-db-server/master/Default'
  properties: {
    state: 'Disabled'
  }
  dependsOn: [
    myexpenses_db_server
  ]
}

resource Microsoft_Sql_servers_databases_auditingPolicies_myexpenses_db_server_master_Default 'Microsoft.Sql/servers/databases/auditingPolicies@2014-04-01' = {
  name: 'myexpenses-db-server/master/Default'
  location: 'Central US'
  properties: {
    auditingState: 'Disabled'
  }
  dependsOn: [
    myexpenses_db_server
  ]
}

resource Microsoft_Sql_servers_databases_auditingSettings_myexpenses_db_server_master_Default 'Microsoft.Sql/servers/databases/auditingSettings@2025-02-01-preview' = {
  name: 'myexpenses-db-server/master/Default'
  properties: {
    retentionDays: 0
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    myexpenses_db_server
  ]
}

resource Microsoft_Sql_servers_databases_extendedAuditingSettings_myexpenses_db_server_master_Default 'Microsoft.Sql/servers/databases/extendedAuditingSettings@2025-02-01-preview' = {
  name: 'myexpenses-db-server/master/Default'
  properties: {
    retentionDays: 0
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    myexpenses_db_server
  ]
}

resource Microsoft_Sql_servers_databases_geoBackupPolicies_myexpenses_db_server_master_Default 'Microsoft.Sql/servers/databases/geoBackupPolicies@2025-02-01-preview' = {
  name: 'myexpenses-db-server/master/Default'
  properties: {
    state: 'Disabled'
  }
  dependsOn: [
    myexpenses_db_server
  ]
}

resource myexpenses_db_server_master_Current 'Microsoft.Sql/servers/databases/ledgerDigestUploads@2025-02-01-preview' = {
  name: 'myexpenses-db-server/master/Current'
  properties: {}
  dependsOn: [
    myexpenses_db_server
  ]
}

resource Microsoft_Sql_servers_databases_securityAlertPolicies_myexpenses_db_server_master_Default 'Microsoft.Sql/servers/databases/securityAlertPolicies@2025-02-01-preview' = {
  name: 'myexpenses-db-server/master/Default'
  properties: {
    state: 'Disabled'
    disabledAlerts: [
      ''
    ]
    emailAddresses: [
      ''
    ]
    emailAccountAdmins: false
    retentionDays: 0
  }
  dependsOn: [
    myexpenses_db_server
  ]
}

resource Microsoft_Sql_servers_databases_transparentDataEncryption_myexpenses_db_server_master_Current 'Microsoft.Sql/servers/databases/transparentDataEncryption@2025-02-01-preview' = {
  name: 'myexpenses-db-server/master/Current'
  properties: {
    state: 'Disabled'
  }
  dependsOn: [
    myexpenses_db_server
  ]
}

resource Microsoft_Sql_servers_databases_vulnerabilityAssessments_myexpenses_db_server_master_Default 'Microsoft.Sql/servers/databases/vulnerabilityAssessments@2025-02-01-preview' = {
  name: 'myexpenses-db-server/master/Default'
  properties: {
    recurringScans: {
      isEnabled: false
      emailSubscriptionAdmins: true
    }
  }
  dependsOn: [
    myexpenses_db_server
  ]
}

resource Microsoft_Sql_servers_devOpsAuditingSettings_myexpenses_db_server_Default 'Microsoft.Sql/servers/devOpsAuditingSettings@2025-02-01-preview' = {
  parent: myexpenses_db_server
  name: 'Default'
  properties: {
    isAzureMonitorTargetEnabled: false
    isManagedIdentityInUse: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
}

resource myexpenses_db_server_current 'Microsoft.Sql/servers/encryptionProtector@2025-02-01-preview' = {
  parent: myexpenses_db_server
  name: 'current'
  kind: 'servicemanaged'
  properties: {
    serverKeyName: 'ServiceManaged'
    serverKeyType: 'ServiceManaged'
    autoRotationEnabled: false
  }
}

resource Microsoft_Sql_servers_extendedAuditingSettings_myexpenses_db_server_Default 'Microsoft.Sql/servers/extendedAuditingSettings@2025-02-01-preview' = {
  parent: myexpenses_db_server
  name: 'Default'
  properties: {
    retentionDays: 0
    auditActionsAndGroups: []
    isStorageSecondaryKeyInUse: false
    isAzureMonitorTargetEnabled: false
    isManagedIdentityInUse: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
}

resource myexpenses_db_server_AllowAllWindowsAzureIps 'Microsoft.Sql/servers/firewallRules@2025-02-01-preview' = {
  parent: myexpenses_db_server
  name: 'AllowAllWindowsAzureIps'
  properties: {
    startIpAddress: '0.0.0.0'
    endIpAddress: '0.0.0.0'
  }
}

resource myexpenses_db_server_ClientIPAddress_2025_10_2_11_58_31 'Microsoft.Sql/servers/firewallRules@2025-02-01-preview' = {
  parent: myexpenses_db_server
  name: 'ClientIPAddress_2025-10-2_11-58-31'
  properties: {
    startIpAddress: '49.207.236.5'
    endIpAddress: '49.207.236.5'
  }
}

resource myexpenses_db_server_LogicApp_IP_01 'Microsoft.Sql/servers/firewallRules@2025-02-01-preview' = {
  parent: myexpenses_db_server
  name: 'LogicApp-IP-01'
  properties: {
    startIpAddress: '52.141.218.55'
    endIpAddress: '52.141.218.55'
  }
}

resource myexpenses_db_server_LogicApp_IP_02 'Microsoft.Sql/servers/firewallRules@2025-02-01-preview' = {
  parent: myexpenses_db_server
  name: 'LogicApp-IP-02'
  properties: {
    startIpAddress: '20.109.202.29'
    endIpAddress: '20.109.202.29'
  }
}

resource myexpenses_db_server_LogicApp_IP_03 'Microsoft.Sql/servers/firewallRules@2025-02-01-preview' = {
  parent: myexpenses_db_server
  name: 'LogicApp-IP-03'
  properties: {
    startIpAddress: '20.118.195.232'
    endIpAddress: '20.118.195.232'
  }
}

resource myexpenses_db_server_LogicApp_IP_04 'Microsoft.Sql/servers/firewallRules@2025-02-01-preview' = {
  parent: myexpenses_db_server
  name: 'LogicApp-IP-04'
  properties: {
    startIpAddress: '20.118.195.233'
    endIpAddress: '20.118.195.233'
  }
}

resource myexpenses_db_server_LogicApp_IP_05 'Microsoft.Sql/servers/firewallRules@2025-02-01-preview' = {
  parent: myexpenses_db_server
  name: 'LogicApp-IP-05'
  properties: {
    startIpAddress: '20.118.195.234'
    endIpAddress: '20.118.195.234'
  }
}

resource myexpenses_db_server_LogicApp_IP_06 'Microsoft.Sql/servers/firewallRules@2025-02-01-preview' = {
  parent: myexpenses_db_server
  name: 'LogicApp-IP-06'
  properties: {
    startIpAddress: '20.118.195.235'
    endIpAddress: '20.118.195.235'
  }
}

resource myexpenses_db_server_LogicApp_IP_07 'Microsoft.Sql/servers/firewallRules@2025-02-01-preview' = {
  parent: myexpenses_db_server
  name: 'LogicApp-IP-07'
  properties: {
    startIpAddress: '20.118.195.236'
    endIpAddress: '20.118.195.236'
  }
}

resource myexpenses_db_server_LogicApp_IP_08 'Microsoft.Sql/servers/firewallRules@2025-02-01-preview' = {
  parent: myexpenses_db_server
  name: 'LogicApp-IP-08'
  properties: {
    startIpAddress: '20.118.195.237'
    endIpAddress: '20.118.195.237'
  }
}

resource myexpenses_db_server_LogicApp_IP_09 'Microsoft.Sql/servers/firewallRules@2025-02-01-preview' = {
  parent: myexpenses_db_server
  name: 'LogicApp-IP-09'
  properties: {
    startIpAddress: '20.118.195.238'
    endIpAddress: '20.118.195.238'
  }
}

resource myexpenses_db_server_LogicApp_IP_10 'Microsoft.Sql/servers/firewallRules@2025-02-01-preview' = {
  parent: myexpenses_db_server
  name: 'LogicApp-IP-10'
  properties: {
    startIpAddress: '20.118.195.239'
    endIpAddress: '20.118.195.239'
  }
}

resource myexpenses_db_server_query_editor_54ce97 'Microsoft.Sql/servers/firewallRules@2025-02-01-preview' = {
  parent: myexpenses_db_server
  name: 'query-editor-54ce97'
  properties: {
    startIpAddress: '49.207.200.255'
    endIpAddress: '49.207.200.255'
  }
}

resource myexpenses_db_server_query_editor_77d7ce 'Microsoft.Sql/servers/firewallRules@2025-02-01-preview' = {
  parent: myexpenses_db_server
  name: 'query-editor-77d7ce'
  properties: {
    startIpAddress: '49.207.213.28'
    endIpAddress: '49.207.213.28'
  }
}

resource myexpenses_db_server_query_editor_794a85 'Microsoft.Sql/servers/firewallRules@2025-02-01-preview' = {
  parent: myexpenses_db_server
  name: 'query-editor-794a85'
  properties: {
    startIpAddress: '49.207.227.234'
    endIpAddress: '49.207.227.234'
  }
}

resource myexpenses_db_server_query_editor_a0c2a7 'Microsoft.Sql/servers/firewallRules@2025-02-01-preview' = {
  parent: myexpenses_db_server
  name: 'query-editor-a0c2a7'
  properties: {
    startIpAddress: '49.207.222.179'
    endIpAddress: '49.207.222.179'
  }
}

resource myexpenses_db_server_query_editor_ab32b9 'Microsoft.Sql/servers/firewallRules@2025-02-01-preview' = {
  parent: myexpenses_db_server
  name: 'query-editor-ab32b9'
  properties: {
    startIpAddress: '49.207.211.243'
    endIpAddress: '49.207.211.243'
  }
}

resource myexpenses_db_server_query_editor_b3dd36 'Microsoft.Sql/servers/firewallRules@2025-02-01-preview' = {
  parent: myexpenses_db_server
  name: 'query-editor-b3dd36'
  properties: {
    startIpAddress: '49.207.204.18'
    endIpAddress: '49.207.204.18'
  }
}

resource myexpenses_db_server_query_editor_c780a7 'Microsoft.Sql/servers/firewallRules@2025-02-01-preview' = {
  parent: myexpenses_db_server
  name: 'query-editor-c780a7'
  properties: {
    startIpAddress: '49.207.205.133'
    endIpAddress: '49.207.205.133'
  }
}

resource myexpenses_db_server_QueryEditorClientIPAddress_1773899766786 'Microsoft.Sql/servers/firewallRules@2025-02-01-preview' = {
  parent: myexpenses_db_server
  name: 'QueryEditorClientIPAddress_1773899766786'
  properties: {
    startIpAddress: '49.207.198.36'
    endIpAddress: '49.207.198.36'
  }
}

resource myexpenses_db_server_ServiceManaged 'Microsoft.Sql/servers/keys@2025-02-01-preview' = {
  parent: myexpenses_db_server
  name: 'ServiceManaged'
  kind: 'servicemanaged'
  properties: {
    serverKeyType: 'ServiceManaged'
  }
}

resource Microsoft_Sql_servers_securityAlertPolicies_myexpenses_db_server_Default 'Microsoft.Sql/servers/securityAlertPolicies@2025-02-01-preview' = {
  parent: myexpenses_db_server
  name: 'Default'
  properties: {
    state: 'Disabled'
    disabledAlerts: [
      ''
    ]
    emailAddresses: [
      ''
    ]
    emailAccountAdmins: false
    retentionDays: 0
  }
}

resource Microsoft_Sql_servers_sqlVulnerabilityAssessments_myexpenses_db_server_Default 'Microsoft.Sql/servers/sqlVulnerabilityAssessments@2025-02-01-preview' = {
  parent: myexpenses_db_server
  name: 'Default'
  properties: {
    state: 'Disabled'
  }
}

resource Microsoft_Sql_servers_vulnerabilityAssessments_myexpenses_db_server_Default 'Microsoft.Sql/servers/vulnerabilityAssessments@2025-02-01-preview' = {
  parent: myexpenses_db_server
  name: 'Default'
  properties: {
    recurringScans: {
      isEnabled: false
      emailSubscriptionAdmins: true
    }
    storageContainerPath: null
  }
}

resource myexpensesstorageacc_default 'Microsoft.Storage/storageAccounts/blobServices@2026-04-01' = {
  parent: myexpensesstorageacc
  name: 'default'
  sku: {
    name: 'Standard_RAGRS'
    tier: 'Standard'
  }
  properties: {
    staticWebsite: {
      enabled: false
    }
    containerDeleteRetentionPolicy: {
      enabled: true
      days: 7
    }
    cors: {
      corsRules: [
        {
          allowedOrigins: [
            'https://documentintelligence.ai.azure.com'
          ]
          allowedMethods: [
            'DELETE'
            'GET'
            'HEAD'
            'MERGE'
            'OPTIONS'
            'PATCH'
            'POST'
            'PUT'
          ]
          maxAgeInSeconds: 120
          exposedHeaders: [
            '*'
          ]
          allowedHeaders: [
            '*'
          ]
        }
      ]
    }
    deleteRetentionPolicy: {
      allowPermanentDelete: false
      enabled: true
      days: 7
    }
  }
}

resource Microsoft_Storage_storageAccounts_fileServices_myexpensesstorageacc_default 'Microsoft.Storage/storageAccounts/fileServices@2026-04-01' = {
  parent: myexpensesstorageacc
  name: 'default'
  sku: {
    name: 'Standard_RAGRS'
    tier: 'Standard'
  }
  properties: {
    protocolSettings: {
      smb: {}
    }
    cors: {
      corsRules: []
    }
    shareDeleteRetentionPolicy: {
      enabled: true
      days: 7
    }
  }
}

resource Microsoft_Storage_storageAccounts_queueServices_myexpensesstorageacc_default 'Microsoft.Storage/storageAccounts/queueServices@2026-04-01' = {
  parent: myexpensesstorageacc
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
  }
}

resource Microsoft_Storage_storageAccounts_tableServices_myexpensesstorageacc_default 'Microsoft.Storage/storageAccounts/tableServices@2026-04-01' = {
  parent: myexpensesstorageacc
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
  }
}

resource myexpenses_db_server_myexpenses_db_Default 'Microsoft.Sql/servers/databases/advancedThreatProtectionSettings@2025-02-01-preview' = {
  parent: myexpenses_db_server_myexpenses_db
  name: 'Default'
  properties: {
    state: 'Disabled'
  }
  dependsOn: [
    myexpenses_db_server
  ]
}

resource Microsoft_Sql_servers_databases_auditingPolicies_myexpenses_db_server_myexpenses_db_Default 'Microsoft.Sql/servers/databases/auditingPolicies@2014-04-01' = {
  parent: myexpenses_db_server_myexpenses_db
  name: 'Default'
  location: 'Central US'
  properties: {
    auditingState: 'Disabled'
  }
  dependsOn: [
    myexpenses_db_server
  ]
}

resource Microsoft_Sql_servers_databases_auditingSettings_myexpenses_db_server_myexpenses_db_Default 'Microsoft.Sql/servers/databases/auditingSettings@2025-02-01-preview' = {
  parent: myexpenses_db_server_myexpenses_db
  name: 'Default'
  properties: {
    retentionDays: 0
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    myexpenses_db_server
  ]
}

resource Microsoft_Sql_servers_databases_backupLongTermRetentionPolicies_myexpenses_db_server_myexpenses_db_default 'Microsoft.Sql/servers/databases/backupLongTermRetentionPolicies@2025-02-01-preview' = {
  parent: myexpenses_db_server_myexpenses_db
  name: 'default'
  properties: {
    timeBasedImmutability: 'Disabled'
    weeklyRetention: 'PT0S'
    monthlyRetention: 'PT0S'
    yearlyRetention: 'PT0S'
    weekOfYear: 0
  }
  dependsOn: [
    myexpenses_db_server
  ]
}

resource Microsoft_Sql_servers_databases_backupShortTermRetentionPolicies_myexpenses_db_server_myexpenses_db_default 'Microsoft.Sql/servers/databases/backupShortTermRetentionPolicies@2025-02-01-preview' = {
  parent: myexpenses_db_server_myexpenses_db
  name: 'default'
  properties: {
    retentionDays: 7
    diffBackupIntervalInHours: 12
  }
  dependsOn: [
    myexpenses_db_server
  ]
}

resource Microsoft_Sql_servers_databases_extendedAuditingSettings_myexpenses_db_server_myexpenses_db_Default 'Microsoft.Sql/servers/databases/extendedAuditingSettings@2025-02-01-preview' = {
  parent: myexpenses_db_server_myexpenses_db
  name: 'Default'
  properties: {
    retentionDays: 0
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    myexpenses_db_server
  ]
}

resource Microsoft_Sql_servers_databases_geoBackupPolicies_myexpenses_db_server_myexpenses_db_Default 'Microsoft.Sql/servers/databases/geoBackupPolicies@2025-02-01-preview' = {
  parent: myexpenses_db_server_myexpenses_db
  name: 'Default'
  properties: {
    state: 'Disabled'
  }
  dependsOn: [
    myexpenses_db_server
  ]
}

resource myexpenses_db_server_myexpenses_db_Current 'Microsoft.Sql/servers/databases/ledgerDigestUploads@2025-02-01-preview' = {
  parent: myexpenses_db_server_myexpenses_db
  name: 'Current'
  properties: {}
  dependsOn: [
    myexpenses_db_server
  ]
}

resource Microsoft_Sql_servers_databases_securityAlertPolicies_myexpenses_db_server_myexpenses_db_Default 'Microsoft.Sql/servers/databases/securityAlertPolicies@2025-02-01-preview' = {
  parent: myexpenses_db_server_myexpenses_db
  name: 'Default'
  properties: {
    state: 'Disabled'
    disabledAlerts: [
      ''
    ]
    emailAddresses: [
      ''
    ]
    emailAccountAdmins: false
    retentionDays: 0
  }
  dependsOn: [
    myexpenses_db_server
  ]
}

resource Microsoft_Sql_servers_databases_transparentDataEncryption_myexpenses_db_server_myexpenses_db_Current 'Microsoft.Sql/servers/databases/transparentDataEncryption@2025-02-01-preview' = {
  parent: myexpenses_db_server_myexpenses_db
  name: 'Current'
  properties: {
    state: 'Enabled'
  }
  dependsOn: [
    myexpenses_db_server
  ]
}

resource Microsoft_Sql_servers_databases_vulnerabilityAssessments_myexpenses_db_server_myexpenses_db_Default 'Microsoft.Sql/servers/databases/vulnerabilityAssessments@2025-02-01-preview' = {
  parent: myexpenses_db_server_myexpenses_db
  name: 'Default'
  properties: {
    recurringScans: {
      isEnabled: false
      emailSubscriptionAdmins: true
    }
  }
  dependsOn: [
    myexpenses_db_server
  ]
}

resource myexpensesstorageacc_default_copyactivity_logs 'Microsoft.Storage/storageAccounts/blobServices/containers@2026-04-01' = {
  parent: myexpensesstorageacc_default
  name: 'copyactivity-logs'
  properties: {
    immutableStorageWithVersioning: {
      enabled: false
    }
    defaultEncryptionScope: '$account-encryption-key'
    denyEncryptionScopeOverride: false
    publicAccess: 'None'
  }
  dependsOn: [
    myexpensesstorageacc
  ]
}

resource myexpensesstorageacc_default_logs 'Microsoft.Storage/storageAccounts/blobServices/containers@2026-04-01' = {
  parent: myexpensesstorageacc_default
  name: 'logs'
  properties: {
    immutableStorageWithVersioning: {
      enabled: false
    }
    defaultEncryptionScope: '$account-encryption-key'
    denyEncryptionScopeOverride: false
    publicAccess: 'None'
  }
  dependsOn: [
    myexpensesstorageacc
  ]
}

resource myexpensesstorageacc_default_myexpenses_blobcontainer 'Microsoft.Storage/storageAccounts/blobServices/containers@2026-04-01' = {
  parent: myexpensesstorageacc_default
  name: 'myexpenses-blobcontainer'
  properties: {
    immutableStorageWithVersioning: {
      enabled: false
    }
    defaultEncryptionScope: '$account-encryption-key'
    denyEncryptionScopeOverride: false
    publicAccess: 'None'
  }
  dependsOn: [
    myexpensesstorageacc
  ]
}

resource myexpensesstorageacc_default_myexpenses_bulkupload 'Microsoft.Storage/storageAccounts/blobServices/containers@2026-04-01' = {
  parent: myexpensesstorageacc_default
  name: 'myexpenses-bulkupload'
  properties: {
    immutableStorageWithVersioning: {
      enabled: false
    }
    defaultEncryptionScope: '$account-encryption-key'
    denyEncryptionScopeOverride: false
    publicAccess: 'None'
  }
  dependsOn: [
    myexpensesstorageacc
  ]
}

resource myexpensesstorageacc_default_myexpenses_categories_tempdb 'Microsoft.Storage/storageAccounts/blobServices/containers@2026-04-01' = {
  parent: myexpensesstorageacc_default
  name: 'myexpenses-categories-tempdb'
  properties: {
    immutableStorageWithVersioning: {
      enabled: false
    }
    defaultEncryptionScope: '$account-encryption-key'
    denyEncryptionScopeOverride: false
    publicAccess: 'None'
  }
  dependsOn: [
    myexpensesstorageacc
  ]
}

resource myexpenses_logicapp 'Microsoft.Logic/workflows@2017-07-01' = {
  name: 'myexpenses-logicapp'
  location: 'centralus'
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    state: 'Disabled'
    definition: {
      '$schema': 'https://schema.management.azure.com/providers/Microsoft.Logic/schemas/2016-06-01/workflowdefinition.json#'
      contentVersion: '1.0.0.0'
      parameters: {
        '$connections': {
          defaultValue: {}
          type: 'Object'
        }
      }
      triggers: {
        'When_a_blob_is_added_or_modified_(properties_only)_(V2)': {
          recurrence: {
            interval: 3
            frequency: 'Minute'
          }
          evaluatedRecurrence: {
            interval: 3
            frequency: 'Minute'
          }
          splitOn: '@triggerBody()'
          metadata: {
            JTJmbXlleHBlbnNlcy1ibG9iY29udGFpbmVy: '/myexpenses-blobcontainer'
          }
          type: 'ApiConnection'
          inputs: {
            host: {
              connection: {
                name: '@parameters(\'$connections\')[\'azureblob-1\'][\'connectionId\']'
              }
            }
            method: 'get'
            path: '/v2/datasets/@{encodeURIComponent(encodeURIComponent(\'AccountNameFromSettings\'))}/triggers/batch/onupdatedfile'
            queries: {
              folderId: 'JTJmbXlleHBlbnNlcy1ibG9iY29udGFpbmVy'
              maxFileCount: 10
              checkBothCreatedAndModifiedDateTime: false
            }
          }
        }
      }
      actions: {
        'Get_blob_content_(V2)': {
          runAfter: {}
          type: 'ApiConnection'
          inputs: {
            host: {
              connection: {
                name: '@parameters(\'$connections\')[\'azureblob-1\'][\'connectionId\']'
              }
            }
            method: 'get'
            path: '/v2/datasets/@{encodeURIComponent(encodeURIComponent(\'AccountNameFromSettings\'))}/files/@{encodeURIComponent(encodeURIComponent(triggerBody()?[\'Path\']))}/content'
            queries: {
              inferContentType: true
            }
          }
        }
        'Analyze_Document_for_Prebuilt_or_Custom_models_(v4.x_API)_1': {
          runAfter: {
            'Get_blob_content_(V2)': [
              'Succeeded'
            ]
          }
          type: 'ApiConnection'
          inputs: {
            host: {
              connection: {
                name: '@parameters(\'$connections\')[\'formrecognizer\'][\'connectionId\']'
              }
            }
            method: 'post'
            body: '@body(\'Get_blob_content_(V2)\')'
            path: '/connectorinternaldocumentintelligence/documentModels/@{encodeURIComponent(\'Expenses_pdf_parser\')}:analyze'
            queries: {
              'api-version': '2024-11-30'
            }
          }
        }
        Parse_JSON: {
          runAfter: {
            'Analyze_Document_for_Prebuilt_or_Custom_models_(v4.x_API)_1': [
              'Succeeded'
            ]
          }
          type: 'ParseJson'
          inputs: {
            content: '@body(\'Analyze_Document_for_Prebuilt_or_Custom_models_(v4.x_API)_1\')?[\'analyzeResult\']'
            schema: {
              type: 'object'
              properties: {
                status: {
                  type: 'string'
                }
                createdDateTime: {
                  type: 'string'
                }
                lastUpdatedDateTime: {
                  type: 'string'
                }
                analyzeResult: {
                  type: 'object'
                  properties: {
                    apiVersion: {
                      type: 'string'
                    }
                    modelId: {
                      type: 'string'
                    }
                    stringIndexType: {
                      type: 'string'
                    }
                    content: {
                      type: 'string'
                    }
                    pages: {
                      type: 'array'
                      items: {
                        type: 'object'
                        properties: {
                          pageNumber: {
                            type: 'integer'
                          }
                          angle: {
                            type: 'number'
                          }
                          width: {
                            type: 'number'
                          }
                          height: {
                            type: 'number'
                          }
                          unit: {
                            type: 'string'
                          }
                          words: {
                            type: 'array'
                            items: {
                              type: 'object'
                              properties: {
                                content: {
                                  type: 'string'
                                }
                                polygon: {
                                  type: 'array'
                                  items: {
                                    type: 'number'
                                  }
                                }
                                confidence: {
                                  type: 'number'
                                }
                                span: {
                                  type: 'object'
                                  properties: {
                                    offset: {
                                      type: 'integer'
                                    }
                                    length: {
                                      type: 'integer'
                                    }
                                  }
                                }
                              }
                              required: [
                                'content'
                                'polygon'
                                'confidence'
                                'span'
                              ]
                            }
                          }
                          lines: {
                            type: 'array'
                            items: {
                              type: 'object'
                              properties: {
                                content: {
                                  type: 'string'
                                }
                                polygon: {
                                  type: 'array'
                                  items: {
                                    type: 'number'
                                  }
                                }
                                spans: {
                                  type: 'array'
                                  items: {
                                    type: 'object'
                                    properties: {
                                      offset: {
                                        type: 'integer'
                                      }
                                      length: {
                                        type: 'integer'
                                      }
                                    }
                                    required: [
                                      'offset'
                                      'length'
                                    ]
                                  }
                                }
                              }
                              required: [
                                'content'
                                'polygon'
                                'spans'
                              ]
                            }
                          }
                          spans: {
                            type: 'array'
                            items: {
                              type: 'object'
                              properties: {
                                offset: {
                                  type: 'integer'
                                }
                                length: {
                                  type: 'integer'
                                }
                              }
                              required: [
                                'offset'
                                'length'
                              ]
                            }
                          }
                        }
                        required: [
                          'pageNumber'
                          'angle'
                          'width'
                          'height'
                          'unit'
                          'words'
                          'lines'
                          'spans'
                        ]
                      }
                    }
                    tables: {
                      type: 'array'
                      items: {
                        type: 'object'
                        properties: {
                          rowCount: {
                            type: 'integer'
                          }
                          columnCount: {
                            type: 'integer'
                          }
                          cells: {
                            type: 'array'
                            items: {
                              type: 'object'
                              properties: {
                                kind: {
                                  type: 'string'
                                }
                                rowIndex: {
                                  type: 'integer'
                                }
                                columnIndex: {
                                  type: 'integer'
                                }
                                content: {
                                  type: 'string'
                                }
                                boundingRegions: {
                                  type: 'array'
                                  items: {
                                    type: 'object'
                                    properties: {
                                      pageNumber: {
                                        type: 'integer'
                                      }
                                      polygon: {
                                        type: 'array'
                                        items: {
                                          type: 'number'
                                        }
                                      }
                                    }
                                    required: [
                                      'pageNumber'
                                      'polygon'
                                    ]
                                  }
                                }
                                spans: {
                                  type: 'array'
                                  items: {
                                    type: 'object'
                                    properties: {
                                      offset: {
                                        type: 'integer'
                                      }
                                      length: {
                                        type: 'integer'
                                      }
                                    }
                                    required: [
                                      'offset'
                                      'length'
                                    ]
                                  }
                                }
                                elements: {
                                  type: 'array'
                                  items: {
                                    type: 'string'
                                  }
                                }
                              }
                              required: [
                                'rowIndex'
                                'columnIndex'
                                'content'
                                'boundingRegions'
                                'spans'
                                'elements'
                              ]
                            }
                          }
                          boundingRegions: {
                            type: 'array'
                            items: {
                              type: 'object'
                              properties: {
                                pageNumber: {
                                  type: 'integer'
                                }
                                polygon: {
                                  type: 'array'
                                  items: {
                                    type: 'number'
                                  }
                                }
                              }
                              required: [
                                'pageNumber'
                                'polygon'
                              ]
                            }
                          }
                          spans: {
                            type: 'array'
                            items: {
                              type: 'object'
                              properties: {
                                offset: {
                                  type: 'integer'
                                }
                                length: {
                                  type: 'integer'
                                }
                              }
                              required: [
                                'offset'
                                'length'
                              ]
                            }
                          }
                        }
                        required: [
                          'rowCount'
                          'columnCount'
                          'cells'
                          'boundingRegions'
                          'spans'
                        ]
                      }
                    }
                    paragraphs: {
                      type: 'array'
                      items: {
                        type: 'object'
                        properties: {
                          spans: {
                            type: 'array'
                            items: {
                              type: 'object'
                              properties: {
                                offset: {
                                  type: 'integer'
                                }
                                length: {
                                  type: 'integer'
                                }
                              }
                              required: [
                                'offset'
                                'length'
                              ]
                            }
                          }
                          boundingRegions: {
                            type: 'array'
                            items: {
                              type: 'object'
                              properties: {
                                pageNumber: {
                                  type: 'integer'
                                }
                                polygon: {
                                  type: 'array'
                                  items: {
                                    type: 'number'
                                  }
                                }
                              }
                              required: [
                                'pageNumber'
                                'polygon'
                              ]
                            }
                          }
                          role: {
                            type: 'string'
                          }
                          content: {
                            type: 'string'
                          }
                        }
                        required: [
                          'spans'
                          'boundingRegions'
                          'content'
                        ]
                      }
                    }
                    styles: {
                      type: 'array'
                    }
                    documents: {
                      type: 'array'
                      items: {
                        type: 'object'
                        properties: {
                          docType: {
                            type: 'string'
                          }
                          boundingRegions: {
                            type: 'array'
                            items: {
                              type: 'object'
                              properties: {
                                pageNumber: {
                                  type: 'integer'
                                }
                                polygon: {
                                  type: 'array'
                                }
                              }
                              required: [
                                'pageNumber'
                                'polygon'
                              ]
                            }
                          }
                          fields: {
                            type: 'object'
                            properties: {
                              CardHolderName: {
                                type: 'object'
                                properties: {
                                  type: {
                                    type: 'string'
                                  }
                                  valueString: {
                                    type: 'string'
                                  }
                                  content: {
                                    type: 'string'
                                  }
                                  boundingRegions: {
                                    type: 'array'
                                    items: {
                                      type: 'object'
                                      properties: {
                                        pageNumber: {
                                          type: 'integer'
                                        }
                                        polygon: {
                                          type: 'array'
                                          items: {
                                            type: 'number'
                                          }
                                        }
                                      }
                                      required: [
                                        'pageNumber'
                                        'polygon'
                                      ]
                                    }
                                  }
                                  confidence: {
                                    type: 'number'
                                  }
                                  spans: {
                                    type: 'array'
                                    items: {
                                      type: 'object'
                                      properties: {
                                        offset: {
                                          type: 'integer'
                                        }
                                        length: {
                                          type: 'integer'
                                        }
                                      }
                                      required: [
                                        'offset'
                                        'length'
                                      ]
                                    }
                                  }
                                }
                              }
                              IssuingBank: {
                                type: 'object'
                                properties: {
                                  type: {
                                    type: 'string'
                                  }
                                  valueString: {
                                    type: 'string'
                                  }
                                  content: {
                                    type: 'string'
                                  }
                                  boundingRegions: {
                                    type: 'array'
                                    items: {
                                      type: 'object'
                                      properties: {
                                        pageNumber: {
                                          type: 'integer'
                                        }
                                        polygon: {
                                          type: 'array'
                                          items: {
                                            type: 'number'
                                          }
                                        }
                                      }
                                      required: [
                                        'pageNumber'
                                        'polygon'
                                      ]
                                    }
                                  }
                                  confidence: {
                                    type: 'number'
                                  }
                                  spans: {
                                    type: 'array'
                                    items: {
                                      type: 'object'
                                      properties: {
                                        offset: {
                                          type: 'integer'
                                        }
                                        length: {
                                          type: 'integer'
                                        }
                                      }
                                      required: [
                                        'offset'
                                        'length'
                                      ]
                                    }
                                  }
                                }
                              }
                              'Transaction Details': {
                                type: 'object'
                                properties: {
                                  type: {
                                    type: 'string'
                                  }
                                  valueString: {
                                    type: 'string'
                                  }
                                  content: {
                                    type: 'string'
                                  }
                                  boundingRegions: {
                                    type: 'array'
                                    items: {
                                      type: 'object'
                                      properties: {
                                        pageNumber: {
                                          type: 'integer'
                                        }
                                        polygon: {
                                          type: 'array'
                                          items: {
                                            type: 'number'
                                          }
                                        }
                                      }
                                      required: [
                                        'pageNumber'
                                        'polygon'
                                      ]
                                    }
                                  }
                                  confidence: {
                                    type: 'number'
                                  }
                                  spans: {
                                    type: 'array'
                                    items: {
                                      type: 'object'
                                      properties: {
                                        offset: {
                                          type: 'integer'
                                        }
                                        length: {
                                          type: 'integer'
                                        }
                                      }
                                      required: [
                                        'offset'
                                        'length'
                                      ]
                                    }
                                  }
                                }
                              }
                              'Account Type': {
                                type: 'object'
                                properties: {
                                  type: {
                                    type: 'string'
                                  }
                                  valueString: {
                                    type: 'string'
                                  }
                                  content: {
                                    type: 'string'
                                  }
                                  boundingRegions: {
                                    type: 'array'
                                    items: {
                                      type: 'object'
                                      properties: {
                                        pageNumber: {
                                          type: 'integer'
                                        }
                                        polygon: {
                                          type: 'array'
                                          items: {
                                            type: 'number'
                                          }
                                        }
                                      }
                                      required: [
                                        'pageNumber'
                                        'polygon'
                                      ]
                                    }
                                  }
                                  confidence: {
                                    type: 'number'
                                  }
                                  spans: {
                                    type: 'array'
                                    items: {
                                      type: 'object'
                                      properties: {
                                        offset: {
                                          type: 'integer'
                                        }
                                        length: {
                                          type: 'integer'
                                        }
                                      }
                                      required: [
                                        'offset'
                                        'length'
                                      ]
                                    }
                                  }
                                }
                              }
                              CardNumber: {
                                type: 'object'
                                properties: {
                                  type: {
                                    type: 'string'
                                  }
                                  valueString: {
                                    type: 'string'
                                  }
                                  content: {
                                    type: 'string'
                                  }
                                  boundingRegions: {
                                    type: 'array'
                                    items: {
                                      type: 'object'
                                      properties: {
                                        pageNumber: {
                                          type: 'integer'
                                        }
                                        polygon: {
                                          type: 'array'
                                          items: {
                                            type: 'number'
                                          }
                                        }
                                      }
                                      required: [
                                        'pageNumber'
                                        'polygon'
                                      ]
                                    }
                                  }
                                  confidence: {
                                    type: 'number'
                                  }
                                  spans: {
                                    type: 'array'
                                    items: {
                                      type: 'object'
                                      properties: {
                                        offset: {
                                          type: 'integer'
                                        }
                                        length: {
                                          type: 'integer'
                                        }
                                      }
                                      required: [
                                        'offset'
                                        'length'
                                      ]
                                    }
                                  }
                                }
                              }
                              'Transaction Date': {
                                type: 'object'
                                properties: {
                                  type: {
                                    type: 'string'
                                  }
                                  valueString: {
                                    type: 'string'
                                  }
                                  content: {
                                    type: 'string'
                                  }
                                  boundingRegions: {
                                    type: 'array'
                                    items: {
                                      type: 'object'
                                      properties: {
                                        pageNumber: {
                                          type: 'integer'
                                        }
                                        polygon: {
                                          type: 'array'
                                          items: {
                                            type: 'number'
                                          }
                                        }
                                      }
                                      required: [
                                        'pageNumber'
                                        'polygon'
                                      ]
                                    }
                                  }
                                  confidence: {
                                    type: 'number'
                                  }
                                  spans: {
                                    type: 'array'
                                    items: {
                                      type: 'object'
                                      properties: {
                                        offset: {
                                          type: 'integer'
                                        }
                                        length: {
                                          type: 'integer'
                                        }
                                      }
                                      required: [
                                        'offset'
                                        'length'
                                      ]
                                    }
                                  }
                                }
                              }
                              'Debit Amount': {
                                type: 'object'
                                properties: {
                                  type: {
                                    type: 'string'
                                  }
                                  valueString: {
                                    type: 'string'
                                  }
                                  content: {
                                    type: 'string'
                                  }
                                  boundingRegions: {
                                    type: 'array'
                                    items: {
                                      type: 'object'
                                      properties: {
                                        pageNumber: {
                                          type: 'integer'
                                        }
                                        polygon: {
                                          type: 'array'
                                          items: {
                                            type: 'number'
                                          }
                                        }
                                      }
                                      required: [
                                        'pageNumber'
                                        'polygon'
                                      ]
                                    }
                                  }
                                  confidence: {
                                    type: 'number'
                                  }
                                  spans: {
                                    type: 'array'
                                    items: {
                                      type: 'object'
                                      properties: {
                                        offset: {
                                          type: 'integer'
                                        }
                                        length: {
                                          type: 'integer'
                                        }
                                      }
                                      required: [
                                        'offset'
                                        'length'
                                      ]
                                    }
                                  }
                                }
                              }
                              'Credit Amount': {
                                type: 'object'
                                properties: {
                                  type: {
                                    type: 'string'
                                  }
                                  valueString: {
                                    type: 'string'
                                  }
                                  content: {
                                    type: 'string'
                                  }
                                  boundingRegions: {
                                    type: 'array'
                                    items: {
                                      type: 'object'
                                      properties: {
                                        pageNumber: {
                                          type: 'integer'
                                        }
                                        polygon: {
                                          type: 'array'
                                          items: {
                                            type: 'number'
                                          }
                                        }
                                      }
                                      required: [
                                        'pageNumber'
                                        'polygon'
                                      ]
                                    }
                                  }
                                  confidence: {
                                    type: 'number'
                                  }
                                  spans: {
                                    type: 'array'
                                    items: {
                                      type: 'object'
                                      properties: {
                                        offset: {
                                          type: 'integer'
                                        }
                                        length: {
                                          type: 'integer'
                                        }
                                      }
                                      required: [
                                        'offset'
                                        'length'
                                      ]
                                    }
                                  }
                                }
                              }
                              'Transaction Name': {
                                type: 'object'
                                properties: {
                                  type: {
                                    type: 'string'
                                  }
                                  valueString: {
                                    type: 'string'
                                  }
                                  content: {
                                    type: 'string'
                                  }
                                  boundingRegions: {
                                    type: 'array'
                                    items: {
                                      type: 'object'
                                      properties: {
                                        pageNumber: {
                                          type: 'integer'
                                        }
                                        polygon: {
                                          type: 'array'
                                          items: {
                                            type: 'number'
                                          }
                                        }
                                      }
                                      required: [
                                        'pageNumber'
                                        'polygon'
                                      ]
                                    }
                                  }
                                  confidence: {
                                    type: 'number'
                                  }
                                  spans: {
                                    type: 'array'
                                    items: {
                                      type: 'object'
                                      properties: {
                                        offset: {
                                          type: 'integer'
                                        }
                                        length: {
                                          type: 'integer'
                                        }
                                      }
                                      required: [
                                        'offset'
                                        'length'
                                      ]
                                    }
                                  }
                                }
                              }
                              'Card Name': {
                                type: 'object'
                                properties: {
                                  type: {
                                    type: 'string'
                                  }
                                  confidence: {
                                    type: 'number'
                                  }
                                }
                              }
                              'Payment Due Date': {
                                type: 'object'
                                properties: {
                                  type: {
                                    type: 'string'
                                  }
                                  confidence: {
                                    type: 'number'
                                  }
                                }
                              }
                              ExpirationDate: {
                                type: 'object'
                                properties: {
                                  type: {
                                    type: 'string'
                                  }
                                  confidence: {
                                    type: 'number'
                                  }
                                }
                              }
                              ValidDate: {
                                type: 'object'
                                properties: {
                                  type: {
                                    type: 'string'
                                  }
                                  confidence: {
                                    type: 'number'
                                  }
                                }
                              }
                            }
                          }
                          confidence: {
                            type: 'number'
                          }
                          spans: {
                            type: 'array'
                            items: {
                              type: 'object'
                              properties: {
                                offset: {
                                  type: 'integer'
                                }
                                length: {
                                  type: 'integer'
                                }
                              }
                              required: [
                                'offset'
                                'length'
                              ]
                            }
                          }
                        }
                        required: [
                          'docType'
                          'boundingRegions'
                          'fields'
                          'confidence'
                          'spans'
                        ]
                      }
                    }
                    contentFormat: {
                      type: 'string'
                    }
                    sections: {
                      type: 'array'
                      items: {
                        type: 'object'
                        properties: {
                          spans: {
                            type: 'array'
                            items: {
                              type: 'object'
                              properties: {
                                offset: {
                                  type: 'integer'
                                }
                                length: {
                                  type: 'integer'
                                }
                              }
                              required: [
                                'offset'
                                'length'
                              ]
                            }
                          }
                          elements: {
                            type: 'array'
                            items: {
                              type: 'string'
                            }
                          }
                        }
                        required: [
                          'spans'
                          'elements'
                        ]
                      }
                    }
                    figures: {
                      type: 'array'
                      items: {
                        type: 'object'
                        properties: {
                          id: {
                            type: 'string'
                          }
                          boundingRegions: {
                            type: 'array'
                            items: {
                              type: 'object'
                              properties: {
                                pageNumber: {
                                  type: 'integer'
                                }
                                polygon: {
                                  type: 'array'
                                  items: {
                                    type: 'number'
                                  }
                                }
                              }
                              required: [
                                'pageNumber'
                                'polygon'
                              ]
                            }
                          }
                          spans: {
                            type: 'array'
                            items: {
                              type: 'object'
                              properties: {
                                offset: {
                                  type: 'integer'
                                }
                                length: {
                                  type: 'integer'
                                }
                              }
                              required: [
                                'offset'
                                'length'
                              ]
                            }
                          }
                          elements: {
                            type: 'array'
                            items: {
                              type: 'string'
                            }
                          }
                        }
                        required: [
                          'id'
                          'boundingRegions'
                          'spans'
                          'elements'
                        ]
                      }
                    }
                  }
                }
              }
            }
          }
        }
        For_each_Table: {
          foreach: '@body(\'Parse_JSON\')?[\'tables\']'
          actions: {
            For_each_Row: {
              foreach: '@items(\'For_each_Table\')?[\'cells\']'
              actions: {
                'Insert_row_(V2)': {
                  type: 'ApiConnection'
                  inputs: {
                    host: {
                      connection: {
                        name: '@parameters(\'$connections\')[\'sql-1\'][\'connectionId\']'
                      }
                    }
                    method: 'post'
                    body: {
                      AccountNo_Ref: '@coalesce(body(\'Parse_JSON\')?[\'Card Number\'], body(\'Parse_JSON\')?[\'Account No\'], \'Unknown\')\r\n'
                      SourceFileName: '@triggerBody()?[\'Name\']'
                      TransactionDate: '@items(\'For_each_Row\')?[\'Date\']?[\'content\']'
                      Narration: '@items(\'For_each_Row\')?[\'Narration\']?[\'content\']'
                      WithdrawalAmount: '@items(\'For_each_Row\')?[\'Withdrawal Amt.\']?[\'content\']'
                      DepositAmount: '@items(\'For_each_Row\')?[\'Deposit Amt.\']?[\'content\']'
                    }
                    path: '/v2/datasets/@{encodeURIComponent(encodeURIComponent(\'myexpenses-db-server.database.windows.net\'))},@{encodeURIComponent(encodeURIComponent(\'myexpenses_db\'))}/tables/@{encodeURIComponent(encodeURIComponent(\'dbo.Transactions\'))}/items'
                  }
                }
              }
              type: 'Foreach'
            }
          }
          runAfter: {
            Parse_JSON: [
              'Succeeded'
            ]
          }
          type: 'Foreach'
        }
      }
      outputs: {}
    }
    parameters: {
      '$connections': {
        value: {
          'azureblob-1': {
            id: '/subscriptions/dc047e3c-dc08-457f-92cc-3a531d30bb7b/providers/Microsoft.Web/locations/centralus/managedApis/azureblob'
            connectionId: azureblob_5.id
            connectionName: 'azureblob-5'
          }
          formrecognizer: {
            id: '/subscriptions/dc047e3c-dc08-457f-92cc-3a531d30bb7b/providers/Microsoft.Web/locations/centralus/managedApis/formrecognizer'
            connectionId: formrecognizer.id
            connectionName: 'formrecognizer'
          }
          'sql-1': {
            id: '/subscriptions/dc047e3c-dc08-457f-92cc-3a531d30bb7b/providers/Microsoft.Web/locations/centralus/managedApis/sql'
            connectionId: sql_1.id
            connectionName: 'sql-1'
            connectionProperties: {
              authentication: {
                type: 'ManagedServiceIdentity'
              }
            }
          }
        }
      }
    }
  }
}

resource logicapp_newstrategy 'Microsoft.Logic/workflows@2017-07-01' = {
  name: 'logicapp_newstrategy'
  location: 'centralus'
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    state: 'Enabled'
    definition: {
      '$schema': 'https://schema.management.azure.com/providers/Microsoft.Logic/schemas/2016-06-01/workflowdefinition.json#'
      contentVersion: '1.0.0.0'
      parameters: {
        '$connections': {
          defaultValue: {}
          type: 'Object'
        }
      }
      triggers: {
        'When_a_blob_is_added_or_modified_(properties_only)_(V2)': {
          recurrence: {
            interval: 1
            frequency: 'Minute'
          }
          evaluatedRecurrence: {
            interval: 1
            frequency: 'Minute'
          }
          splitOn: '@triggerBody()'
          metadata: {
            JTJmbXlleHBlbnNlcy1ibG9iY29udGFpbmVy: '/myexpenses-blobcontainer'
          }
          type: 'ApiConnection'
          inputs: {
            host: {
              connection: {
                name: '@parameters(\'$connections\')[\'azureblob\'][\'connectionId\']'
              }
            }
            method: 'get'
            path: '/v2/datasets/@{encodeURIComponent(encodeURIComponent(\'myexpensesstorageacc\'))}/triggers/batch/onupdatedfile'
            queries: {
              folderId: 'JTJmbXlleHBlbnNlcy1ibG9iY29udGFpbmVy'
              maxFileCount: 10
              checkBothCreatedAndModifiedDateTime: false
            }
          }
        }
      }
      actions: {
        'Get_blob_content_(V2)': {
          runAfter: {}
          type: 'ApiConnection'
          inputs: {
            host: {
              connection: {
                name: '@parameters(\'$connections\')[\'azureblob-2\'][\'connectionId\']'
              }
            }
            method: 'get'
            path: '/v2/datasets/@{encodeURIComponent(encodeURIComponent(\'myexpensesstorageacc\'))}/files/@{encodeURIComponent(encodeURIComponent(triggerBody()?[\'Path\']))}/content'
            queries: {
              inferContentType: true
            }
          }
        }
        'Classify_document_with_document_classifier_(v4.x_API)': {
          runAfter: {
            'Get_blob_content_(V2)': [
              'Succeeded'
            ]
          }
          type: 'ApiConnection'
          inputs: {
            host: {
              connection: {
                name: '@parameters(\'$connections\')[\'formrecognizer\'][\'connectionId\']'
              }
            }
            method: 'post'
            body: '@body(\'Get_blob_content_(V2)\')'
            path: '/connectorinternaldocumentintelligence/documentClassifiers/@{encodeURIComponent(\'Document_Classifier\')}:analyze'
            queries: {
              'api-version': '2024-11-30'
              split: 'none'
            }
          }
        }
        ParseJSON: {
          runAfter: {
            'Classify_document_with_document_classifier_(v4.x_API)': [
              'Succeeded'
            ]
          }
          type: 'ParseJson'
          inputs: {
            content: '@body(\'Classify_document_with_document_classifier_(v4.x_API)\')'
            schema: {
              type: 'object'
              properties: {
                apiVersion: {
                  type: 'string'
                }
                modelId: {
                  type: 'string'
                }
                stringIndexType: {
                  type: 'string'
                }
                content: {
                  type: 'string'
                }
                pages: {
                  type: 'array'
                  items: {
                    type: 'object'
                    properties: {
                      pageNumber: {
                        type: 'integer'
                      }
                      angle: {
                        type: 'integer'
                      }
                      width: {
                        type: 'number'
                      }
                      height: {
                        type: 'number'
                      }
                      unit: {
                        type: 'string'
                      }
                      words: {
                        type: 'array'
                      }
                      lines: {
                        type: 'array'
                      }
                      spans: {
                        type: 'array'
                      }
                    }
                    required: [
                      'pageNumber'
                      'angle'
                      'width'
                      'height'
                      'unit'
                      'words'
                      'lines'
                      'spans'
                    ]
                  }
                }
                documents: {
                  type: 'array'
                  items: {
                    type: 'object'
                    properties: {
                      docType: {
                        type: 'string'
                      }
                      boundingRegions: {
                        type: 'array'
                        items: {
                          type: 'object'
                          properties: {
                            pageNumber: {
                              type: 'integer'
                            }
                            polygon: {
                              type: 'array'
                            }
                          }
                          required: [
                            'pageNumber'
                            'polygon'
                          ]
                        }
                      }
                      confidence: {
                        type: 'number'
                      }
                      spans: {
                        type: 'array'
                      }
                    }
                    required: [
                      'docType'
                      'boundingRegions'
                      'confidence'
                      'spans'
                    ]
                  }
                }
                contentFormat: {
                  type: 'string'
                }
              }
            }
          }
        }
        Route_by_Document_Type: {
          runAfter: {
            Normalize_Document_Type: [
              'Succeeded'
            ]
          }
          cases: {
            Credit_Cards: {
              case: 'Credit Card'
              actions: {
                'Analyze_Document_for_Prebuilt_or_Custom_models_(v4.x_API)': {
                  type: 'ApiConnection'
                  inputs: {
                    host: {
                      connection: {
                        name: '@parameters(\'$connections\')[\'formrecognizer\'][\'connectionId\']'
                      }
                    }
                    method: 'post'
                    body: '@body(\'Get_blob_content_(V2)\')'
                    path: '/connectorinternaldocumentintelligence/documentModels/@{encodeURIComponent(\'prebuilt-invoice\')}:analyze'
                    queries: {
                      'api-version': '2024-11-30'
                    }
                  }
                }
                ParseJSON_CreditCard: {
                  runAfter: {
                    'Analyze_Document_for_Prebuilt_or_Custom_models_(v4.x_API)': [
                      'Succeeded'
                    ]
                  }
                  type: 'ParseJson'
                  inputs: {
                    content: '@body(\'Analyze_Document_for_Prebuilt_or_Custom_models_(v4.x_API)\')'
                    schema: {
                      type: 'object'
                      properties: {
                        apiVersion: {
                          type: 'string'
                        }
                        modelId: {
                          type: 'string'
                        }
                        stringIndexType: {
                          type: 'string'
                        }
                        content: {
                          type: 'string'
                        }
                        pages: {
                          type: 'array'
                          items: {
                            type: 'object'
                            properties: {
                              pageNumber: {
                                type: 'integer'
                              }
                              angle: {
                                type: 'number'
                              }
                              width: {
                                type: 'number'
                              }
                              height: {
                                type: 'integer'
                              }
                              unit: {
                                type: 'string'
                              }
                              words: {
                                type: 'array'
                                items: {
                                  type: 'object'
                                  properties: {
                                    content: {
                                      type: 'string'
                                    }
                                    polygon: {
                                      type: 'array'
                                      items: {
                                        type: 'number'
                                      }
                                    }
                                    confidence: {
                                      type: 'number'
                                    }
                                    span: {
                                      type: 'object'
                                      properties: {
                                        offset: {
                                          type: 'integer'
                                        }
                                        length: {
                                          type: 'integer'
                                        }
                                      }
                                    }
                                  }
                                  required: [
                                    'content'
                                    'polygon'
                                    'confidence'
                                    'span'
                                  ]
                                }
                              }
                              selectionMarks: {
                                type: 'array'
                                items: {
                                  type: 'object'
                                  properties: {
                                    state: {
                                      type: 'string'
                                    }
                                    polygon: {
                                      type: 'array'
                                      items: {
                                        type: 'number'
                                      }
                                    }
                                    confidence: {
                                      type: 'number'
                                    }
                                    span: {
                                      type: 'object'
                                      properties: {
                                        offset: {
                                          type: 'integer'
                                        }
                                        length: {
                                          type: 'integer'
                                        }
                                      }
                                    }
                                  }
                                  required: [
                                    'state'
                                    'polygon'
                                    'confidence'
                                    'span'
                                  ]
                                }
                              }
                              lines: {
                                type: 'array'
                                items: {
                                  type: 'object'
                                  properties: {
                                    content: {
                                      type: 'string'
                                    }
                                    polygon: {
                                      type: 'array'
                                      items: {
                                        type: 'number'
                                      }
                                    }
                                    spans: {
                                      type: 'array'
                                      items: {
                                        type: 'object'
                                        properties: {
                                          offset: {
                                            type: 'integer'
                                          }
                                          length: {
                                            type: 'integer'
                                          }
                                        }
                                        required: [
                                          'offset'
                                          'length'
                                        ]
                                      }
                                    }
                                  }
                                  required: [
                                    'content'
                                    'polygon'
                                    'spans'
                                  ]
                                }
                              }
                              spans: {
                                type: 'array'
                                items: {
                                  type: 'object'
                                  properties: {
                                    offset: {
                                      type: 'integer'
                                    }
                                    length: {
                                      type: 'integer'
                                    }
                                  }
                                  required: [
                                    'offset'
                                    'length'
                                  ]
                                }
                              }
                            }
                            required: [
                              'pageNumber'
                              'angle'
                              'width'
                              'height'
                              'unit'
                              'words'
                              'lines'
                              'spans'
                            ]
                          }
                        }
                        tables: {
                          type: 'array'
                          items: {
                            type: 'object'
                            properties: {
                              rowCount: {
                                type: 'integer'
                              }
                              columnCount: {
                                type: 'integer'
                              }
                              cells: {
                                type: 'array'
                                items: {
                                  type: 'object'
                                  properties: {
                                    kind: {
                                      type: 'string'
                                    }
                                    rowIndex: {
                                      type: 'integer'
                                    }
                                    columnIndex: {
                                      type: 'integer'
                                    }
                                    content: {
                                      type: 'string'
                                    }
                                    boundingRegions: {
                                      type: 'array'
                                      items: {
                                        type: 'object'
                                        properties: {
                                          pageNumber: {
                                            type: 'integer'
                                          }
                                          polygon: {
                                            type: 'array'
                                            items: {
                                              type: 'number'
                                            }
                                          }
                                        }
                                        required: [
                                          'pageNumber'
                                          'polygon'
                                        ]
                                      }
                                    }
                                    spans: {
                                      type: 'array'
                                      items: {
                                        type: 'object'
                                        properties: {
                                          offset: {
                                            type: 'integer'
                                          }
                                          length: {
                                            type: 'integer'
                                          }
                                        }
                                        required: [
                                          'offset'
                                          'length'
                                        ]
                                      }
                                    }
                                  }
                                  required: [
                                    'rowIndex'
                                    'columnIndex'
                                    'content'
                                    'boundingRegions'
                                    'spans'
                                  ]
                                }
                              }
                              boundingRegions: {
                                type: 'array'
                                items: {
                                  type: 'object'
                                  properties: {
                                    pageNumber: {
                                      type: 'integer'
                                    }
                                    polygon: {
                                      type: 'array'
                                      items: {
                                        type: 'number'
                                      }
                                    }
                                  }
                                  required: [
                                    'pageNumber'
                                    'polygon'
                                  ]
                                }
                              }
                              spans: {
                                type: 'array'
                                items: {
                                  type: 'object'
                                  properties: {
                                    offset: {
                                      type: 'integer'
                                    }
                                    length: {
                                      type: 'integer'
                                    }
                                  }
                                  required: [
                                    'offset'
                                    'length'
                                  ]
                                }
                              }
                            }
                            required: [
                              'rowCount'
                              'columnCount'
                              'cells'
                              'boundingRegions'
                              'spans'
                            ]
                          }
                        }
                        styles: {
                          type: 'array'
                          items: {
                            type: 'object'
                            properties: {
                              confidence: {
                                type: 'number'
                              }
                              spans: {
                                type: 'array'
                                items: {
                                  type: 'object'
                                  properties: {
                                    offset: {
                                      type: 'integer'
                                    }
                                    length: {
                                      type: 'integer'
                                    }
                                  }
                                  required: [
                                    'offset'
                                    'length'
                                  ]
                                }
                              }
                              isHandwritten: {
                                type: 'boolean'
                              }
                            }
                            required: [
                              'confidence'
                              'spans'
                              'isHandwritten'
                            ]
                          }
                        }
                        documents: {
                          type: 'array'
                          items: {
                            type: 'object'
                            properties: {
                              docType: {
                                type: 'string'
                              }
                              boundingRegions: {
                                type: 'array'
                                items: {
                                  type: 'object'
                                  properties: {
                                    pageNumber: {
                                      type: 'integer'
                                    }
                                    polygon: {
                                      type: 'array'
                                    }
                                  }
                                  required: [
                                    'pageNumber'
                                    'polygon'
                                  ]
                                }
                              }
                              fields: {
                                type: 'object'
                                properties: {
                                  AmountDue: {
                                    type: 'object'
                                    properties: {
                                      type: {
                                        type: 'string'
                                      }
                                      valueCurrency: {
                                        type: 'object'
                                        properties: {
                                          amount: {
                                            type: 'number'
                                          }
                                          currencyCode: {
                                            type: 'string'
                                          }
                                        }
                                      }
                                      content: {
                                        type: 'string'
                                      }
                                      boundingRegions: {
                                        type: 'array'
                                        items: {
                                          type: 'object'
                                          properties: {
                                            pageNumber: {
                                              type: 'integer'
                                            }
                                            polygon: {
                                              type: 'array'
                                              items: {
                                                type: 'number'
                                              }
                                            }
                                          }
                                          required: [
                                            'pageNumber'
                                            'polygon'
                                          ]
                                        }
                                      }
                                      confidence: {
                                        type: 'number'
                                      }
                                      spans: {
                                        type: 'array'
                                        items: {
                                          type: 'object'
                                          properties: {
                                            offset: {
                                              type: 'integer'
                                            }
                                            length: {
                                              type: 'integer'
                                            }
                                          }
                                          required: [
                                            'offset'
                                            'length'
                                          ]
                                        }
                                      }
                                    }
                                  }
                                  CustomerAddress: {
                                    type: 'object'
                                    properties: {
                                      type: {
                                        type: 'string'
                                      }
                                      content: {
                                        type: 'string'
                                      }
                                      boundingRegions: {
                                        type: 'array'
                                        items: {
                                          type: 'object'
                                          properties: {
                                            pageNumber: {
                                              type: 'integer'
                                            }
                                            polygon: {
                                              type: 'array'
                                              items: {
                                                type: 'number'
                                              }
                                            }
                                          }
                                          required: [
                                            'pageNumber'
                                            'polygon'
                                          ]
                                        }
                                      }
                                      confidence: {
                                        type: 'number'
                                      }
                                      spans: {
                                        type: 'array'
                                        items: {
                                          type: 'object'
                                          properties: {
                                            offset: {
                                              type: 'integer'
                                            }
                                            length: {
                                              type: 'integer'
                                            }
                                          }
                                          required: [
                                            'offset'
                                            'length'
                                          ]
                                        }
                                      }
                                      valueAddress: {
                                        type: 'object'
                                        properties: {
                                          road: {
                                            type: 'string'
                                          }
                                          postalCode: {
                                            type: 'string'
                                          }
                                          city: {
                                            type: 'string'
                                          }
                                          streetAddress: {
                                            type: 'string'
                                          }
                                          house: {
                                            type: 'string'
                                          }
                                        }
                                      }
                                    }
                                  }
                                  CustomerAddressRecipient: {
                                    type: 'object'
                                    properties: {
                                      type: {
                                        type: 'string'
                                      }
                                      valueString: {
                                        type: 'string'
                                      }
                                      content: {
                                        type: 'string'
                                      }
                                      boundingRegions: {
                                        type: 'array'
                                        items: {
                                          type: 'object'
                                          properties: {
                                            pageNumber: {
                                              type: 'integer'
                                            }
                                            polygon: {
                                              type: 'array'
                                              items: {
                                                type: 'number'
                                              }
                                            }
                                          }
                                          required: [
                                            'pageNumber'
                                            'polygon'
                                          ]
                                        }
                                      }
                                      confidence: {
                                        type: 'number'
                                      }
                                      spans: {
                                        type: 'array'
                                        items: {
                                          type: 'object'
                                          properties: {
                                            offset: {
                                              type: 'integer'
                                            }
                                            length: {
                                              type: 'integer'
                                            }
                                          }
                                          required: [
                                            'offset'
                                            'length'
                                          ]
                                        }
                                      }
                                    }
                                  }
                                  CustomerName: {
                                    type: 'object'
                                    properties: {
                                      type: {
                                        type: 'string'
                                      }
                                      valueString: {
                                        type: 'string'
                                      }
                                      content: {
                                        type: 'string'
                                      }
                                      boundingRegions: {
                                        type: 'array'
                                        items: {
                                          type: 'object'
                                          properties: {
                                            pageNumber: {
                                              type: 'integer'
                                            }
                                            polygon: {
                                              type: 'array'
                                              items: {
                                                type: 'number'
                                              }
                                            }
                                          }
                                          required: [
                                            'pageNumber'
                                            'polygon'
                                          ]
                                        }
                                      }
                                      confidence: {
                                        type: 'number'
                                      }
                                      spans: {
                                        type: 'array'
                                        items: {
                                          type: 'object'
                                          properties: {
                                            offset: {
                                              type: 'integer'
                                            }
                                            length: {
                                              type: 'integer'
                                            }
                                          }
                                          required: [
                                            'offset'
                                            'length'
                                          ]
                                        }
                                      }
                                    }
                                  }
                                  DueDate: {
                                    type: 'object'
                                    properties: {
                                      type: {
                                        type: 'string'
                                      }
                                      valueDate: {
                                        type: 'string'
                                      }
                                      content: {
                                        type: 'string'
                                      }
                                      boundingRegions: {
                                        type: 'array'
                                        items: {
                                          type: 'object'
                                          properties: {
                                            pageNumber: {
                                              type: 'integer'
                                            }
                                            polygon: {
                                              type: 'array'
                                              items: {
                                                type: 'number'
                                              }
                                            }
                                          }
                                          required: [
                                            'pageNumber'
                                            'polygon'
                                          ]
                                        }
                                      }
                                      confidence: {
                                        type: 'number'
                                      }
                                      spans: {
                                        type: 'array'
                                        items: {
                                          type: 'object'
                                          properties: {
                                            offset: {
                                              type: 'integer'
                                            }
                                            length: {
                                              type: 'integer'
                                            }
                                          }
                                          required: [
                                            'offset'
                                            'length'
                                          ]
                                        }
                                      }
                                    }
                                  }
                                  InvoiceDate: {
                                    type: 'object'
                                    properties: {
                                      type: {
                                        type: 'string'
                                      }
                                      valueDate: {
                                        type: 'string'
                                      }
                                      content: {
                                        type: 'string'
                                      }
                                      boundingRegions: {
                                        type: 'array'
                                        items: {
                                          type: 'object'
                                          properties: {
                                            pageNumber: {
                                              type: 'integer'
                                            }
                                            polygon: {
                                              type: 'array'
                                              items: {
                                                type: 'number'
                                              }
                                            }
                                          }
                                          required: [
                                            'pageNumber'
                                            'polygon'
                                          ]
                                        }
                                      }
                                      confidence: {
                                        type: 'number'
                                      }
                                      spans: {
                                        type: 'array'
                                        items: {
                                          type: 'object'
                                          properties: {
                                            offset: {
                                              type: 'integer'
                                            }
                                            length: {
                                              type: 'integer'
                                            }
                                          }
                                          required: [
                                            'offset'
                                            'length'
                                          ]
                                        }
                                      }
                                    }
                                  }
                                  InvoiceTotal: {
                                    type: 'object'
                                    properties: {
                                      type: {
                                        type: 'string'
                                      }
                                      valueCurrency: {
                                        type: 'object'
                                        properties: {
                                          amount: {
                                            type: 'number'
                                          }
                                          currencyCode: {
                                            type: 'string'
                                          }
                                        }
                                      }
                                      content: {
                                        type: 'string'
                                      }
                                      boundingRegions: {
                                        type: 'array'
                                        items: {
                                          type: 'object'
                                          properties: {
                                            pageNumber: {
                                              type: 'integer'
                                            }
                                            polygon: {
                                              type: 'array'
                                              items: {
                                                type: 'number'
                                              }
                                            }
                                          }
                                          required: [
                                            'pageNumber'
                                            'polygon'
                                          ]
                                        }
                                      }
                                      confidence: {
                                        type: 'number'
                                      }
                                      spans: {
                                        type: 'array'
                                        items: {
                                          type: 'object'
                                          properties: {
                                            offset: {
                                              type: 'integer'
                                            }
                                            length: {
                                              type: 'integer'
                                            }
                                          }
                                          required: [
                                            'offset'
                                            'length'
                                          ]
                                        }
                                      }
                                    }
                                  }
                                  Items: {
                                    type: 'object'
                                    properties: {
                                      type: {
                                        type: 'string'
                                      }
                                      valueArray: {
                                        type: 'array'
                                        items: {
                                          type: 'object'
                                          properties: {
                                            type: {
                                              type: 'string'
                                            }
                                            valueObject: {
                                              type: 'object'
                                              properties: {
                                                Amount: {
                                                  type: 'object'
                                                  properties: {
                                                    type: {
                                                      type: 'string'
                                                    }
                                                    valueCurrency: {
                                                      type: 'object'
                                                      properties: {
                                                        amount: {
                                                          type: 'integer'
                                                        }
                                                        currencyCode: {
                                                          type: 'string'
                                                        }
                                                      }
                                                    }
                                                    content: {
                                                      type: 'string'
                                                    }
                                                    boundingRegions: {
                                                      type: 'array'
                                                      items: {
                                                        type: 'object'
                                                        properties: {
                                                          pageNumber: {
                                                            type: 'integer'
                                                          }
                                                          polygon: {
                                                            type: 'array'
                                                            items: {
                                                              type: 'number'
                                                            }
                                                          }
                                                        }
                                                        required: [
                                                          'pageNumber'
                                                          'polygon'
                                                        ]
                                                      }
                                                    }
                                                    confidence: {
                                                      type: 'number'
                                                    }
                                                    spans: {
                                                      type: 'array'
                                                      items: {
                                                        type: 'object'
                                                        properties: {
                                                          offset: {
                                                            type: 'integer'
                                                          }
                                                          length: {
                                                            type: 'integer'
                                                          }
                                                        }
                                                        required: [
                                                          'offset'
                                                          'length'
                                                        ]
                                                      }
                                                    }
                                                  }
                                                }
                                                Date: {
                                                  type: 'object'
                                                  properties: {
                                                    type: {
                                                      type: 'string'
                                                    }
                                                    valueDate: {
                                                      type: 'string'
                                                    }
                                                    content: {
                                                      type: 'string'
                                                    }
                                                    boundingRegions: {
                                                      type: 'array'
                                                      items: {
                                                        type: 'object'
                                                        properties: {
                                                          pageNumber: {
                                                            type: 'integer'
                                                          }
                                                          polygon: {
                                                            type: 'array'
                                                            items: {
                                                              type: 'number'
                                                            }
                                                          }
                                                        }
                                                        required: [
                                                          'pageNumber'
                                                          'polygon'
                                                        ]
                                                      }
                                                    }
                                                    confidence: {
                                                      type: 'number'
                                                    }
                                                    spans: {
                                                      type: 'array'
                                                      items: {
                                                        type: 'object'
                                                        properties: {
                                                          offset: {
                                                            type: 'integer'
                                                          }
                                                          length: {
                                                            type: 'integer'
                                                          }
                                                        }
                                                        required: [
                                                          'offset'
                                                          'length'
                                                        ]
                                                      }
                                                    }
                                                  }
                                                }
                                                Description: {
                                                  type: 'object'
                                                  properties: {
                                                    type: {
                                                      type: 'string'
                                                    }
                                                    valueString: {
                                                      type: 'string'
                                                    }
                                                    content: {
                                                      type: 'string'
                                                    }
                                                    boundingRegions: {
                                                      type: 'array'
                                                      items: {
                                                        type: 'object'
                                                        properties: {
                                                          pageNumber: {
                                                            type: 'integer'
                                                          }
                                                          polygon: {
                                                            type: 'array'
                                                            items: {
                                                              type: 'number'
                                                            }
                                                          }
                                                        }
                                                        required: [
                                                          'pageNumber'
                                                          'polygon'
                                                        ]
                                                      }
                                                    }
                                                    confidence: {
                                                      type: 'number'
                                                    }
                                                    spans: {
                                                      type: 'array'
                                                      items: {
                                                        type: 'object'
                                                        properties: {
                                                          offset: {
                                                            type: 'integer'
                                                          }
                                                          length: {
                                                            type: 'integer'
                                                          }
                                                        }
                                                        required: [
                                                          'offset'
                                                          'length'
                                                        ]
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                            content: {
                                              type: 'string'
                                            }
                                            boundingRegions: {
                                              type: 'array'
                                              items: {
                                                type: 'object'
                                                properties: {
                                                  pageNumber: {
                                                    type: 'integer'
                                                  }
                                                  polygon: {
                                                    type: 'array'
                                                    items: {
                                                      type: 'number'
                                                    }
                                                  }
                                                }
                                                required: [
                                                  'pageNumber'
                                                  'polygon'
                                                ]
                                              }
                                            }
                                            confidence: {
                                              type: 'number'
                                            }
                                            spans: {
                                              type: 'array'
                                              items: {
                                                type: 'object'
                                                properties: {
                                                  offset: {
                                                    type: 'integer'
                                                  }
                                                  length: {
                                                    type: 'integer'
                                                  }
                                                }
                                                required: [
                                                  'offset'
                                                  'length'
                                                ]
                                              }
                                            }
                                          }
                                          required: [
                                            'type'
                                            'valueObject'
                                            'content'
                                            'boundingRegions'
                                            'confidence'
                                            'spans'
                                          ]
                                        }
                                      }
                                    }
                                  }
                                  PaymentUrl: {
                                    type: 'object'
                                    properties: {
                                      type: {
                                        type: 'string'
                                      }
                                      valueString: {
                                        type: 'string'
                                      }
                                      content: {
                                        type: 'string'
                                      }
                                      boundingRegions: {
                                        type: 'array'
                                        items: {
                                          type: 'object'
                                          properties: {
                                            pageNumber: {
                                              type: 'integer'
                                            }
                                            polygon: {
                                              type: 'array'
                                              items: {
                                                type: 'number'
                                              }
                                            }
                                          }
                                          required: [
                                            'pageNumber'
                                            'polygon'
                                          ]
                                        }
                                      }
                                      confidence: {
                                        type: 'number'
                                      }
                                      spans: {
                                        type: 'array'
                                        items: {
                                          type: 'object'
                                          properties: {
                                            offset: {
                                              type: 'integer'
                                            }
                                            length: {
                                              type: 'integer'
                                            }
                                          }
                                          required: [
                                            'offset'
                                            'length'
                                          ]
                                        }
                                      }
                                    }
                                  }
                                  ServiceEndDate: {
                                    type: 'object'
                                    properties: {
                                      type: {
                                        type: 'string'
                                      }
                                      valueDate: {
                                        type: 'string'
                                      }
                                      content: {
                                        type: 'string'
                                      }
                                      boundingRegions: {
                                        type: 'array'
                                        items: {
                                          type: 'object'
                                          properties: {
                                            pageNumber: {
                                              type: 'integer'
                                            }
                                            polygon: {
                                              type: 'array'
                                              items: {
                                                type: 'number'
                                              }
                                            }
                                          }
                                          required: [
                                            'pageNumber'
                                            'polygon'
                                          ]
                                        }
                                      }
                                      confidence: {
                                        type: 'number'
                                      }
                                      spans: {
                                        type: 'array'
                                        items: {
                                          type: 'object'
                                          properties: {
                                            offset: {
                                              type: 'integer'
                                            }
                                            length: {
                                              type: 'integer'
                                            }
                                          }
                                          required: [
                                            'offset'
                                            'length'
                                          ]
                                        }
                                      }
                                    }
                                  }
                                  ServiceStartDate: {
                                    type: 'object'
                                    properties: {
                                      type: {
                                        type: 'string'
                                      }
                                      valueDate: {
                                        type: 'string'
                                      }
                                      content: {
                                        type: 'string'
                                      }
                                      boundingRegions: {
                                        type: 'array'
                                        items: {
                                          type: 'object'
                                          properties: {
                                            pageNumber: {
                                              type: 'integer'
                                            }
                                            polygon: {
                                              type: 'array'
                                              items: {
                                                type: 'number'
                                              }
                                            }
                                          }
                                          required: [
                                            'pageNumber'
                                            'polygon'
                                          ]
                                        }
                                      }
                                      confidence: {
                                        type: 'number'
                                      }
                                      spans: {
                                        type: 'array'
                                        items: {
                                          type: 'object'
                                          properties: {
                                            offset: {
                                              type: 'integer'
                                            }
                                            length: {
                                              type: 'integer'
                                            }
                                          }
                                          required: [
                                            'offset'
                                            'length'
                                          ]
                                        }
                                      }
                                    }
                                  }
                                  VendorAddress: {
                                    type: 'object'
                                    properties: {
                                      type: {
                                        type: 'string'
                                      }
                                      content: {
                                        type: 'string'
                                      }
                                      boundingRegions: {
                                        type: 'array'
                                        items: {
                                          type: 'object'
                                          properties: {
                                            pageNumber: {
                                              type: 'integer'
                                            }
                                            polygon: {
                                              type: 'array'
                                              items: {
                                                type: 'number'
                                              }
                                            }
                                          }
                                          required: [
                                            'pageNumber'
                                            'polygon'
                                          ]
                                        }
                                      }
                                      confidence: {
                                        type: 'number'
                                      }
                                      spans: {
                                        type: 'array'
                                        items: {
                                          type: 'object'
                                          properties: {
                                            offset: {
                                              type: 'integer'
                                            }
                                            length: {
                                              type: 'integer'
                                            }
                                          }
                                          required: [
                                            'offset'
                                            'length'
                                          ]
                                        }
                                      }
                                      valueAddress: {
                                        type: 'object'
                                        properties: {
                                          houseNumber: {
                                            type: 'string'
                                          }
                                          road: {
                                            type: 'string'
                                          }
                                          postalCode: {
                                            type: 'string'
                                          }
                                          city: {
                                            type: 'string'
                                          }
                                          streetAddress: {
                                            type: 'string'
                                          }
                                          house: {
                                            type: 'string'
                                          }
                                        }
                                      }
                                    }
                                  }
                                  VendorAddressRecipient: {
                                    type: 'object'
                                    properties: {
                                      type: {
                                        type: 'string'
                                      }
                                      valueString: {
                                        type: 'string'
                                      }
                                      content: {
                                        type: 'string'
                                      }
                                      boundingRegions: {
                                        type: 'array'
                                        items: {
                                          type: 'object'
                                          properties: {
                                            pageNumber: {
                                              type: 'integer'
                                            }
                                            polygon: {
                                              type: 'array'
                                              items: {
                                                type: 'number'
                                              }
                                            }
                                          }
                                          required: [
                                            'pageNumber'
                                            'polygon'
                                          ]
                                        }
                                      }
                                      confidence: {
                                        type: 'number'
                                      }
                                      spans: {
                                        type: 'array'
                                        items: {
                                          type: 'object'
                                          properties: {
                                            offset: {
                                              type: 'integer'
                                            }
                                            length: {
                                              type: 'integer'
                                            }
                                          }
                                          required: [
                                            'offset'
                                            'length'
                                          ]
                                        }
                                      }
                                    }
                                  }
                                  VendorName: {
                                    type: 'object'
                                    properties: {
                                      type: {
                                        type: 'string'
                                      }
                                      valueString: {
                                        type: 'string'
                                      }
                                      content: {
                                        type: 'string'
                                      }
                                      boundingRegions: {
                                        type: 'array'
                                        items: {
                                          type: 'object'
                                          properties: {
                                            pageNumber: {
                                              type: 'integer'
                                            }
                                            polygon: {
                                              type: 'array'
                                              items: {
                                                type: 'number'
                                              }
                                            }
                                          }
                                          required: [
                                            'pageNumber'
                                            'polygon'
                                          ]
                                        }
                                      }
                                      confidence: {
                                        type: 'number'
                                      }
                                      spans: {
                                        type: 'array'
                                        items: {
                                          type: 'object'
                                          properties: {
                                            offset: {
                                              type: 'integer'
                                            }
                                            length: {
                                              type: 'integer'
                                            }
                                          }
                                          required: [
                                            'offset'
                                            'length'
                                          ]
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                              confidence: {
                                type: 'integer'
                              }
                              spans: {
                                type: 'array'
                                items: {
                                  type: 'object'
                                  properties: {
                                    offset: {
                                      type: 'integer'
                                    }
                                    length: {
                                      type: 'integer'
                                    }
                                  }
                                  required: [
                                    'offset'
                                    'length'
                                  ]
                                }
                              }
                              _fields: {
                                type: 'array'
                                items: {
                                  type: 'object'
                                  properties: {
                                    fieldName: {
                                      type: 'string'
                                    }
                                    fieldValue: {
                                      type: 'object'
                                      properties: {
                                        type: {
                                          type: 'string'
                                        }
                                        valueCurrency: {
                                          type: 'object'
                                          properties: {
                                            amount: {
                                              type: 'number'
                                            }
                                            currencyCode: {
                                              type: 'string'
                                            }
                                          }
                                        }
                                        content: {
                                          type: 'string'
                                        }
                                        boundingRegions: {
                                          type: 'array'
                                          items: {
                                            type: 'object'
                                            properties: {
                                              pageNumber: {
                                                type: 'integer'
                                              }
                                              polygon: {
                                                type: 'array'
                                                items: {
                                                  type: 'number'
                                                }
                                              }
                                            }
                                            required: [
                                              'pageNumber'
                                              'polygon'
                                            ]
                                          }
                                        }
                                        confidence: {
                                          type: 'number'
                                        }
                                        spans: {
                                          type: 'array'
                                          items: {
                                            type: 'object'
                                            properties: {
                                              offset: {
                                                type: 'integer'
                                              }
                                              length: {
                                                type: 'integer'
                                              }
                                            }
                                            required: [
                                              'offset'
                                              'length'
                                            ]
                                          }
                                        }
                                      }
                                    }
                                  }
                                  required: [
                                    'fieldName'
                                    'fieldValue'
                                  ]
                                }
                              }
                            }
                            required: [
                              'docType'
                              'boundingRegions'
                              'fields'
                              'confidence'
                              'spans'
                              '_fields'
                            ]
                          }
                        }
                        contentFormat: {
                          type: 'string'
                        }
                      }
                    }
                  }
                }
                For_each_Transaction: {
                  foreach: '@body(\'Filter_array\')'
                  actions: {
                    Condition: {
                      actions: {
                        'Compose-TransactionDate': {
                          type: 'Compose'
                          inputs: '@items(\'For_each_Transaction\')?[\'valueObject\']?[\'Date\']?[\'valueDate\']\r\n'
                        }
                        'Compose-Amount': {
                          runAfter: {
                            'Compose-TransactionDate': [
                              'Succeeded'
                            ]
                          }
                          type: 'Compose'
                          inputs: '@items(\'For_each_Transaction\')?[\'valueObject\']?[\'Amount\']?[\'valueCurrency\']?[\'amount\']\r\n'
                        }
                        'Compose-Description': {
                          runAfter: {
                            'Compose-Amount': [
                              'Succeeded'
                            ]
                          }
                          type: 'Compose'
                          inputs: '@items(\'For_each_Transaction\')?[\'valueObject\']?[\'Description\']?[\'valueString\']\r\n'
                        }
                        'Compose-RawAmountString': {
                          runAfter: {
                            'Compose-Description': [
                              'Succeeded'
                            ]
                          }
                          type: 'Compose'
                          inputs: '@items(\'For_each_Transaction\')?[\'valueObject\']?[\'Amount\']?[\'content\']\r\n'
                        }
                        'Compose-ExpenseType': {
                          runAfter: {
                            'Compose-RawContent': [
                              'Succeeded'
                            ]
                          }
                          type: 'Compose'
                          inputs: '@if(\r\n    or(\r\n        contains(outputs(\'Compose-RawAmountString\'), \'Cr\'),\r\n        contains(outputs(\'Compose-RawAmountString\'), \'CR\'),\r\n        contains(outputs(\'Compose-RawAmountString\'), \'+ \'),\r\n        contains(outputs(\'Compose-RawAmountString\'), \'+\'),\r\n        contains(outputs(\'Compose-RawAmountString\'), \'+ \'),\r\n        contains(outputs(\'Compose-RawContent\'), \'+ \')\r\n    ),\r\n    \'Credit\',\r\n    if(\r\n        or(\r\n            contains(outputs(\'Compose-RawAmountString\'), \'Dr\'),\r\n            contains(outputs(\'Compose-RawAmountString\'), \'DR\')\r\n        ),\r\n        \'Debit\',\r\n        \'Debit\'\r\n    )\r\n)'
                        }
                        'Execute_stored_procedure_(V2)': {
                          runAfter: {
                            'Compose-ExpenseType': [
                              'Succeeded'
                            ]
                          }
                          type: 'ApiConnection'
                          inputs: {
                            host: {
                              connection: {
                                name: '@parameters(\'$connections\')[\'sqldw\'][\'connectionId\']'
                              }
                            }
                            method: 'post'
                            body: {
                              AccountNo_Ref: '@{outputs(\'Compose_CardNumberFormat\')}'
                              AccountType: '@{outputs(\'Normalize_Document_Type\')}'
                              Amount: '@outputs(\'Compose-Amount\')'
                              CardName: '@{outputs(\'Compose-CardName\')}'
                              Description: '@{outputs(\'Compose-Description\')}'
                              ExpenseType: '@{outputs(\'Compose-ExpenseType\')}'
                              ProcessingTimestamp: '@formatDateTime(convertFromUtc(utcNow(), \'India Standard Time\'), \'yyyy-MM-dd HH:mm:ss\')'
                              SourceFileName: '@triggerBody()?[\'DisplayName\']'
                              StatementDate: '@{outputs(\'Compose-Statement_Date\')}'
                              TransactionDate: '@{outputs(\'Compose-TransactionDate\')}'
                            }
                            path: '/v2/datasets/@{encodeURIComponent(encodeURIComponent(\'default\'))},@{encodeURIComponent(encodeURIComponent(\'default\'))}/procedures/@{encodeURIComponent(encodeURIComponent(\'[dbo].[usp_InsertTransaction]\'))}'
                          }
                        }
                        'Compose-RawContent': {
                          runAfter: {
                            'Compose-RawAmountString': [
                              'Succeeded'
                            ]
                          }
                          type: 'Compose'
                          inputs: '@items(\'For_each_Transaction\')?[\'content\']\r\n'
                        }
                      }
                      else: {
                        actions: {}
                      }
                      expression: {
                        and: [
                          {
                            not: {
                              equals: [
                                '@items(\'For_each_Transaction\')?[\'valueObject\']?[\'Date\']'
                                'NULL'
                              ]
                            }
                          }
                        ]
                      }
                      type: 'If'
                    }
                  }
                  runAfter: {
                    Filter_array: [
                      'Succeeded'
                    ]
                  }
                  type: 'Foreach'
                }
                Compose_InvoiceID: {
                  runAfter: {
                    'Compose-Statement_Date': [
                      'Succeeded'
                    ]
                  }
                  type: 'Compose'
                  inputs: '@if(\r\n    empty(body(\'ParseJSON_CreditCard\')?[\'analyzeResult\']?[\'documents\']?[0]?[\'fields\']?[\'InvoiceId\']?[\'valueString\']),\r\n    outputs(\'Compose-CardName\'),\r\n    body(\'ParseJSON_CreditCard\')?[\'analyzeResult\']?[\'documents\']?[0]?[\'fields\']?[\'InvoiceId\']?[\'valueString\']\r\n)'
                }
                Filter_array: {
                  runAfter: {
                    Compose_CardNumberFormat: [
                      'Succeeded'
                    ]
                  }
                  type: 'Query'
                  inputs: {
                    from: '@outputs(\'Analyze_Document_for_Prebuilt_or_Custom_models_(v4.x_API)\')?[\'body\']?[\'analyzeResult\']?[\'documents\']?[0]?[\'fields\']?[\'Items\']?[\'valueArray\']'
                    where: '@not(equals(item()?[\'valueObject\']?[\'Date\'], null))'
                  }
                }
                'Compose-CardName': {
                  runAfter: {
                    ParseJSON_CreditCard: [
                      'Succeeded'
                    ]
                  }
                  type: 'Compose'
                  inputs: '@if(and(contains(outputs(\'Analyze_Document_for_Prebuilt_or_Custom_models_(v4.x_API)\')?[\'body\']?[\'analyzeResult\']?[\'content\'], \'HDFC BANK\'), contains(outputs(\'Analyze_Document_for_Prebuilt_or_Custom_models_(v4.x_API)\')?[\'body\']?[\'analyzeResult\']?[\'content\'], \'SAVINGS\')), \'HDFC Savings\', if(contains(outputs(\'Analyze_Document_for_Prebuilt_or_Custom_models_(v4.x_API)\')?[\'body\']?[\'analyzeResult\']?[\'content\'], \'Diners Black\'), \'HDFC Diners\', if(contains(outputs(\'Analyze_Document_for_Prebuilt_or_Custom_models_(v4.x_API)\')?[\'body\']?[\'analyzeResult\']?[\'content\'], \'Axis Bank ACE\'), \'Axis ACE\', if(contains(outputs(\'Analyze_Document_for_Prebuilt_or_Custom_models_(v4.x_API)\')?[\'body\']?[\'analyzeResult\']?[\'content\'], \'Millennia Credit Card\'), \'HDFC Millennia\', \'N/A\'))))'
                }
                'Compose-Statement_Date': {
                  runAfter: {
                    'Compose-CardName': [
                      'Succeeded'
                    ]
                  }
                  type: 'Compose'
                  inputs: '@formatDateTime(\r\n    body(\'ParseJSON_CreditCard\')?[\'analyzeResult\']?[\'documents\'][0]?[\'fields\']?[\'ServiceEndDate\']?[\'valueDate\'],\r\n    \'dd-MMM-yyyy\'\r\n)'
                }
                Compose_CardNumber: {
                  runAfter: {
                    Compose_InvoiceID: [
                      'Succeeded'
                    ]
                  }
                  type: 'Compose'
                  inputs: '@if(\r\n    contains(outputs(\'Compose-CardName\'), \'Axis\'),\r\n    replace(\r\n        replace(\r\n            substring(\r\n                outputs(\'Analyze_Document_for_Prebuilt_or_Custom_models_(v4.x_API)\')?[\'body\']?[\'analyzeResult\']?[\'content\'],\r\n                sub(indexOf(outputs(\'Analyze_Document_for_Prebuilt_or_Custom_models_(v4.x_API)\')?[\'body\']?[\'analyzeResult\']?[\'content\'], \'******\'), 7),\r\n                18\r\n            ),\r\n            \' \',\r\n            \'\'\r\n        ),\r\n        \'*\',\r\n        \'X\'\r\n    ),\r\n\r\n    if(\r\n        greater(indexOf(outputs(\'Analyze_Document_for_Prebuilt_or_Custom_models_(v4.x_API)\')?[\'body\']?[\'analyzeResult\']?[\'content\'], \'Credit Card No.\'), -1),\r\n        substring(\r\n            outputs(\'Analyze_Document_for_Prebuilt_or_Custom_models_(v4.x_API)\')?[\'body\']?[\'analyzeResult\']?[\'content\'],\r\n            add(indexOf(outputs(\'Analyze_Document_for_Prebuilt_or_Custom_models_(v4.x_API)\')?[\'body\']?[\'analyzeResult\']?[\'content\'], \'Credit Card No.\'), 16),\r\n            16\r\n        ),\r\n        \'Not Found\'\r\n    )\r\n)\r\n'
                }
                Compose_CardNumberFormat: {
                  runAfter: {
                    Compose_CardNumber: [
                      'Succeeded'
                    ]
                  }
                  type: 'Compose'
                  inputs: '@concat(\r\n    substring(outputs(\'Compose_CardNumber\'), add(length(outputs(\'Compose_CardNumber\')), -8), 4),\r\n    \' \',\r\n    substring(outputs(\'Compose_CardNumber\'), add(length(outputs(\'Compose_CardNumber\')), -4), 4)\r\n)'
                }
              }
            }
            Savings: {
              case: 'Savings'
              actions: {}
            }
            Unknown: {
              case: 'Unknown'
              actions: {}
            }
          }
          default: {
            actions: {}
          }
          expression: '@string(outputs(\'Normalize_Document_Type\'))'
          type: 'Switch'
        }
        Normalize_Document_Type: {
          runAfter: {
            ParseJSON: [
              'Succeeded'
            ]
          }
          type: 'Compose'
          inputs: '@if(contains(body(\'ParseJSON\')?[\'analyzeResult\']?[\'documents\']?[0]?[\'docType\'], \'Credit Card\'), \'Credit Card\', if(equals(body(\'ParseJSON\')?[\'analyzeResult\']?[\'documents\']?[0]?[\'docType\'], \'HDFC Savings\'), \'Savings\', \'Unknown\'))\r\n'
        }
      }
      outputs: {}
    }
    parameters: {
      '$connections': {
        value: {
          azureblob: {
            id: '/subscriptions/dc047e3c-dc08-457f-92cc-3a531d30bb7b/providers/Microsoft.Web/locations/centralus/managedApis/azureblob'
            connectionId: azureblob_12.id
            connectionName: 'azureblob-12'
            connectionProperties: {
              authentication: {
                type: 'ManagedServiceIdentity'
              }
            }
          }
          'azureblob-2': {
            id: '/subscriptions/dc047e3c-dc08-457f-92cc-3a531d30bb7b/providers/Microsoft.Web/locations/centralus/managedApis/azureblob'
            connectionId: azureblob_8.id
            connectionName: 'azureblob-8'
            connectionProperties: {
              authentication: {
                type: 'ManagedServiceIdentity'
              }
            }
          }
          formrecognizer: {
            id: '/subscriptions/dc047e3c-dc08-457f-92cc-3a531d30bb7b/providers/Microsoft.Web/locations/centralus/managedApis/formrecognizer'
            connectionId: formrecognizer.id
            connectionName: 'formrecognizer'
            connectionProperties: {}
          }
          sqldw: {
            id: '/subscriptions/dc047e3c-dc08-457f-92cc-3a531d30bb7b/providers/Microsoft.Web/locations/centralus/managedApis/sqldw'
            connectionId: sqldw.id
            connectionName: 'sqldw'
            connectionProperties: {}
          }
        }
      }
    }
  }
}
