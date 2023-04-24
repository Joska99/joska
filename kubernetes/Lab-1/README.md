<p align="center">
  <img src="https://github.com/Joska99/joska/blob/main/kubernetes/Lab-1/diagram.drawio.svg">
</p>

<h1>Steps:</h1>

1. From Azure Portal open CLI bash
2. Connect to your AKS cluster
```bash
az aks get-credentials --resource-group <"RG_NAME"> --name <"AKS_NAME">
```
3. Run to get Github repo:
```bash
git clone https://github.com/Joska99/joska/tree/main/kubernetes/Lab-1
```
4. Aplly manifest dir on clluster:
```bash
kubectl aplly -f ./manifest
```
5. open browser and check https://"ingress-external-ip"/bird, https://"ingress-external-ip"/cats and https://"ingress-external-ip"/dogs


<h2>To delete:</h2>

```Bash
kubectl delete all --all
```