# Network-concept-in-Azure-Container-Apps
1. __Introduction__ </br>
Les applications dans Azure Container Apps fonctionnent dans un contexte d'environnement qui s'exécute dans son propre réseau virtuel. Lorsque l'on créez un environnement Azure Container Apps, plusieurs éléments clés doivent être pris en compte pour déterminer les capacités réseau des applications conteneurisées:
- Type d'environnement
- Type de réseau virtuel
- Niveau d'accessibilité

<img src="https://learn.microsoft.com/en-us/azure/container-apps/media/environments/azure-container-apps-environments.png" alt="Dinosaur" />

__Environnement__<br>
Il existe deux types d'environnement:
- "Workload profiles"
- "Consumption only"

Pour le __"Workload profiles"__<br>
Les "Workload profiles" permettent de disposer d'une capacité de calcul dédiée (mémoire et CPU) pour les applications déployées dans un environnement Container Apps. Microsoft prend en charge avec les "Workload profiles" à usage général (General purpose D-series - jusqu'à 32vCPU/128GiB) et optimisés en mémoire (Memory optimized E-series - jusqu'à 32vCPU/256GiB). Microsoft propose également un "Workload profiles" avec GPU (GPU-NC8as-T4 - 8vCPU/56GiB).<br>
En attribuant plusieurs "Workload profiles" à un environnement ACA, on peut gérer différents types de "workload". Par exemple, on peut garantir que les applications gourmandes en ressources s'exécutent sur du matériel adapté (General purpose D-series, Memory optimized E-series et GPU-NC8as-T4 ) et que les applications génériques s'exécutent sur un pool de ressources différent.


Pour le __"Consuption only"__



```
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

```





