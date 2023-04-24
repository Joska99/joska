
<p align="center">
<h1>Prometheus Container with config file</h1>
<img src="https://github.com/Joska99/joska/blob/main/docker/prometheus/diagram.drawio.svg">
</p>

<h1>Steps:</h1>

1. Build Docker image:
```bash
docker build -t prometheus-container .
```
2. Run Docker container:
```bash
docker run -p 9000:9090  -d --name my-prom --restart=on-failure -t prometheus-container
```
3. Connect to localhost:9000 

<h2>To delete:</h2>

```Bash
docker kill my-prom
docker rm my-prom
```


