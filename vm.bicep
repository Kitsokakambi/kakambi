param virtualMachines_RGroup_vm_name string = 'RGroup-vm'
param disks_RGroup_vm_disk1_78b9f6597a984e4d90ad9ee7f8df1495_externalid string = '/subscriptions/c3931323-f786-40e8-835f-58ec309c6265/resourceGroups/RGROUP/providers/Microsoft.Compute/disks/RGroup-vm_disk1_78b9f6597a984e4d90ad9ee7f8df1495'
param networkInterfaces_rgroup_vm598_z2_externalid string = '/subscriptions/c3931323-f786-40e8-835f-58ec309c6265/resourceGroups/RGroup/providers/Microsoft.Network/networkInterfaces/rgroup-vm598_z2'

resource virtualMachines_RGroup_vm_name_resource 'Microsoft.Compute/virtualMachines@2024-07-01' = {
  name: virtualMachines_RGroup_vm_name
  location: 'eastus'
  zones: [
    '2'
  ]
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_D2s_v3'
    }
    additionalCapabilities: {
      hibernationEnabled: false
    }
    storageProfile: {
      imageReference: {
        publisher: 'canonical'
        offer: 'ubuntu-24_04-lts'
        sku: 'server'
        version: 'latest'
      }
      osDisk: {
        osType: 'Linux'
        name: '${virtualMachines_RGroup_vm_name}_disk1_78b9f6597a984e4d90ad9ee7f8df1495'
        createOption: 'FromImage'
        caching: 'ReadWrite'
        managedDisk: {
          storageAccountType: 'Premium_LRS'
          id: disks_RGroup_vm_disk1_78b9f6597a984e4d90ad9ee7f8df1495_externalid
        }
        deleteOption: 'Delete'
        diskSizeGB: 30
      }
      dataDisks: []
      diskControllerType: 'SCSI'
    }
    osProfile: {
      computerName: virtualMachines_RGroup_vm_name
      adminUsername: 'azureuser1'
      linuxConfiguration: {
        disablePasswordAuthentication: false
        provisionVMAgent: true
        patchSettings: {
          patchMode: 'ImageDefault'
          assessmentMode: 'ImageDefault'
        }
      }
      secrets: []
      allowExtensionOperations: true
      requireGuestProvisionSignal: true
    }
    securityProfile: {
      uefiSettings: {
        secureBootEnabled: true
        vTpmEnabled: true
      }
      securityType: 'TrustedLaunch'
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: networkInterfaces_rgroup_vm598_z2_externalid
          properties: {
            deleteOption: 'Detach'
          }
        }
      ]
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: true
      }
    }
  }
}
