<h1>Helm deployment to Kubernetes, Prometheus+Grafana chart</h1>
<p align="center">
<img src="https://github.com/Joska99/joska/blob/main/kubernetes/Lab-2/diagram.drawio.svg">
</p>

<h1> Requirements </h1>

1. Kubernetes cluster
- [My Terraform module - AKS cluster](https://github.com/Joska99/joska/tree/main/terraform/modules/tf-aks-la) 

<h2> Steps: </h2>

1. From your local machine IDE connect to the AKS cluster:( For AKS cluster )
- Login to your Azure account
```Bash
az login
```
- Select AKS subscription
```Bash
az account set --subscription <subscription-name-or-id>
```
- Connect to the AKS cluster
```bash
az aks get-credentials --resource-group <resource-group-name> --name <aks-cluster-name>
```

2. Get Helm repo from official Prometheus GitHub and Update:
- Get repo
```Bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
```
- Update repo
```bash
helm repo update
```

3. Apply Helm chart:
```Bash
helm install [RELEASE_NAME] prometheus-community/kube-prometheus-stack
```

4. Forward Grafana Service to your localhost:3000 and connect to it:
```bash
kubectl port-forward service/<Service_NAME> 3000:80
```

5. Get User and Passwd for Grafana:
- Get Username
```bash
kubectl get secret <SERVICE_NAME>  -o=jsonpath='{.data.admin-user}' |base64 -d 
```
- Get password
```bash
kubectl get secret <SERVICE_NAME> -o=jsonpath='{.data.admin-password}' |base64 -d
```

6. In Grafana Portal go to 'Configurations' -> 'Data sources' and click 'Add new data source'

7. Enter Azure Service Principal Credentials Verify and Save
- Application ID = USER_NAME
- Client Secret = PASSWORD
- Directory ID = AZURE AD ID
- Then load subscriptions

8. Go to "Dashboard" -> "Import", 10956 enter this and click on load and then import to apply custom dashboard


<h2> Create Service Principal and add RBAC:</h2>

> In Azure Portal CLI create Service Principal for Grafana:
1. Create variables
``` Bash
CLUSTER_RG=CLUSTER_RG
WORK_RG=WORK_RG
SERVICE_PRINCIPAL_NAME=SP_NAME
```
2. Get RGS ID
```Bash
CLUSTER_RG_ID=$(az group show --name $CLUSTER_RG --query "id" --output tsv)
WORK_RG_ID=$(az group show --name $WORK_RG --query "id" --output tsv)
```
3. Create Service Principal and save Username and Password in variables and add RBAC
```Bash
PASSWORD=$(az ad sp create-for-rbac --name $SERVICE_PRINCIPAL_NAME --scopes $CLUSTER_RG_ID --role="Monitoring Reader" --query "password" --output tsv)
USER_NAME=$(az ad sp list --display-name $SERVICE_PRINCIPAL_NAME --query "[].appId" --output tsv)
```
4. Run to check credentials
```Bash
echo $PASSWORD
echo $USER_NAME
``` 

<h2>Clear up:</h2>

1. Run this to delete deployment:
```bash
helm uninstall [RELEASE_NAME]
```