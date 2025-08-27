#!/bin/bash

PREFIX="demo-network-aca-1"
LOCATION="westeurope"


az group create \
  --name "${PREFIX}-rg" \
  --location "$LOCATION"



az network vnet create \
  --name "${PREFIX}-vnet" \
  --resource-group "${PREFIX}-rg" \
  --location "$LOCATION" \
  --address-prefix "10.0.0.0/16"

az network vnet subnet create \
  --name "${PREFIX}-subnet" \
  --resource-group "${PREFIX}-rg" \
  --vnet-name "${PREFIX}-vnet" \
  --address-prefix "10.0.0.0/27" \
  --delegations "Microsoft.App/environments"

# get subnet id
SUBNET_ID=$(az network vnet subnet show \
  --name "${PREFIX}-subnet" \
  --resource-group "${PREFIX}-rg" \
  --vnet-name "${PREFIX}-vnet" \
  --query id -o tsv)

echo "Subnet ID: $SUBNET_ID"

az containerapp env create \
  --name "${PREFIX}-env" \
  --resource-group "${PREFIX}-rg" \
  --infrastructure-subnet-resource-id "$SUBNET_ID" \
  --logs-destination none \
  --location "$LOCATION"


