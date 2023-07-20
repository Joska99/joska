<h1>Prometheus Container with config file</h1>
<p align="center">
<img src="https://github.com/Joska99/joska/blob/main/docker/prometheus/diagram.drawio.svg">
</p>

<h2> Steps: </h2>

1. Build Docker image:
```bash
docker build -t prom-container .
```
2. Run Docker container:
```bash
docker run -p 9000:9090  -d --name my-prom --restart=on-failure -t prom-container
```
3. Connect to localhost:9000 

<h2> To add target: </h2>

<!-- TODO: ADD COFIG GUIDE, STEP BY STEP FOR JENKINS -->
1. in "prometheus.yaml" file you can add IP of nodes that you want to collect metrics

<h2> To delete: </h2>

```Bash
docker kill my-prom
docker rm my-prom
```


