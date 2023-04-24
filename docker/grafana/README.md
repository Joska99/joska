<p align="center">
<h1>Prometheus Container with config file</h1>
<img src="https://github.com/Joska99/joska/blob/main/docker/grafana/diagram.drawio.svg">
</p>

<h1>Steps:</h1>

1.  Create dir for Grafana container data:
```bash
mkdir grafana-data
```
2. Build Docker image:
```bash
docker build -t grafana-container .
```
3. Run docker container:

-p - run on port<br />
-v - mount grafana-data to container<br />
-d - detach mode<br />
--name - chose container name<br />
--restart=on-failure - automaticly restart container<br />
-t - image tag to run<br />

```bash
docker run -p 3000:3000 -v grafana-data:/var/lib/grafana -d --name my-graf --restart=on-failure -t grafana-container
```
4. Connect to localhost:3000
5. login: pswd: or Skip

<h2>Befor delete do this:</h2>

1.  Run to copy data to your localc machine:
```bash
docker cp my-graf:/var/lib/grafana grafana-data
docker  cp my-graf:/etc/grafana/grafana.ini .
``` 

<h2>To delete container:</h2>

```Bash
docker kill my-graf
docker rm my-graf
```