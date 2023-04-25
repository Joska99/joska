<h1> Requirements </h1>

1. AKS cluster 

<h2> Steps: </h2>

1. From your local machine IDE connect to the AKS cluster:
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
2. Get Helm repo from Prometheus aand Update:
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
4. Forvard Grafana pod to your localhost and connect to it:
```bash
kubectl port-forward <POD_NAME> :8080
```
5. Get User and Paswd for GRAFANA:
- get Username
```bash
kubectl get secret <POD_NAME>  -o=jsonpath='{.data.admin-user}' |base64 -d 
```
- Get password
```bash
kubectl get secret <POD_NAME> -o=jsonpath='{.data.admin-password}' |base64 -d
```


1. SP and RBAC for Cluster RG
az ad sp create-for-rbac --role="Monitoring Reader" --scope="""/subscriptions/70b91582-1ca1-4c13-a064-09ec3e6d461f/resourceGroups/akscluster"
2. RBAC For LGA RG
az ad sp create-for-rbac --role="Monitoring Reader" --scope="""/subscriptions/70b91582-1ca1-4c13-a064-09ec3e6d461f/resourceGroups/akscluster"


helm uninstall [RELEASE_NAME]