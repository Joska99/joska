<p align="center">
<h1>Ingres with multiple services</h1>
<img src="https://github.com/Joska99/joska/blob/main/kubernetes/Lab-1/diagram.drawio.svg">
</p>

<h1> Requirements </h1>

1. Kubernetes cluster

<h1>Steps:</h1>

- To connect to AKS cluster
1. From Azure Portal open CLI bash
2. Connect to your AKS cluster
```bash
az aks get-credentials --resource-group <"RG_NAME"> --name <"AKS_NAME">
```

- Deploy to Kubernetes cluster
1. Run to get Github repo:
```bash
git clone https://github.com/Joska99/joska/tree/main/kubernetes/Lab-1
```
2. Deploy the required resources of the Ingress controller:
```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.2.1/deploy/static/provider/cloud/deploy.yaml
```
3. Apply manifest directory on cluster:
```bash
kubectl apply -f ./manifests
```
4. Open browser and check https://"ingress-external-ip"/bird, https://"ingress-external-ip"/cats and https://"ingress-external-ip"/dogs
```bash
kubectl get svc ingress-nginx-controller -n ingress-nginx
```


<h2>To delete:</h2>

```Bash
kubectl delete all --all
kubectl delete ingress --all
kubectl delete all --all -n ingress-nginx
kubectl delete namespace ingress-nginx
```