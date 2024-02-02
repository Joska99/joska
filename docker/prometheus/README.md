# Prometheus Container with config file

<p align="center">
<img src="https://github.com/Joska99/joska/blob/main/docker/prometheus/diagram.drawio.svg">
</p>

## Steps:

### Prometheus-server

1. Build Docker image ( in prometheus_server directory ):

```bash
docker build -t prom-container .
```

2. Run Docker container:

```bash
docker run \
    -p 9000:9090 \
    --name my-prom \
    --restart=on-failure \
    -t prom-container \
    -d
```

#### To add target:

1. In "prometheus.yaml" file you can add IP of nodes that you want to target
2. Rerun container

### Alert-Manager

1. Build Docker image ( in prometheus_alert_manager directory ):

```bash
docker build -t prom-alert-manager-container .
```

2. Run Docker container:

```bash
docker run \
    -p 9003:9093 \
    --name my-alert \
    --restart=on-failure \
    -t prom-alert-manager-container \
    -d
```

3. Connect to localhost:9003

#### To add Alerts:

1. In "rules.yaml" file you can provide QUERY to trigger Alert manager
2. Rerun container

## To delete:

```Bash
docker kill my-prom my-alert
docker rm my-prom my-alert
```
