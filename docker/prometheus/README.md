
<p align="center">
<h1>Prometheus Container with cocnfig file</h1>
<img src="https://github.com/Joska99/joska/blob/main/docker/prometheus/diagram.drawio.svg">
</p>

<h1>Steps:</h1>

1. Run those comands:
```bash
docker build -t prometheus-container .
docker run -p 9000:9090 -d --name my-prom --restart=on-failure -t prometheus-container
```
2. Connect to localhost:9000 
