# https://learn.microsoft.com/en-us/azure/container-instances/container-instances-reference-yaml
# deploy mainnet light node to Azure
apiVersion: '2019-12-01'
location: westeurope
name: light-node-mainnet-01
properties:
  containers:
  - name: celestia
    properties:
      environmentVariables:
      - name: NODE_TYPE
        value: light
      - name: P2P_NETWORK
        value: celestia
      image: ghcr.io/celestiaorg/celestia-node:v0.12.0
      #ports:
      #- port: 80
      resources:
        requests:
          cpu: 1.0
          memoryInGB: 1.5
      volumeMounts:
      - mountPath: /home/celestia
        name: nodestore
  osType: Linux
  restartPolicy: Never
  #ipAddress:
    #type: Public
    #ports:
      #- port: 80
    #dnsNameLabel: aci-demo
  volumes:
  - name: nodestore
    azureFile:
      sharename: nodeshare
      storageAccountName: $STORAGE_ACCOUNT_NAME
      storageAccountKey: $STORAGE_ACCOUNT_KEY
tags: {}
type: Microsoft.ContainerInstance/containerGroups
