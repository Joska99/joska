<p align="center">
<h1>Prometheus Container with config file</h1>
<img src="https://github.com/Joska99/joska/blob/main/docker/grafana/diagram.drawio.svg">
</p>

<h1>Steps:</h1>

1. Run those comands:
```bash
mkdir grafana-data
sudo service docker start 
docker build -t grafana-container .
docker run -p 3000:3000 -v grafana-data:/var/lib/grafana -d --name my-graf --restart=on-failure -t grafana-container
```
2. Connect to localhost:3000
3. login: pswd: or Skip
4. Run those to save sestings and plugins:
```bash
docker cp my-graf:/var/lib/grafana grafana-data
docker  cp my-graf:/etc/grafana/grafana.ini .
``` 
3. To delete:
```Bash
docker kill my-graf
docker rm my-graf
```