#!/bin/bash

PREFIX="demo-network-aca"
LOCATION="westeurope"


az group create \
  --name "${PREFIX}-rg" \
  --location "$LOCATION"

az containerapp env create \
  --name "${PREFIX}-env" \
  --resource-group "${PREFIX}-rg" \
  --logs-destination none \
  --location "$LOCATION"


