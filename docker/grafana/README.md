<h1>Grafana Container</h1>
<p align="center">
<img src="https://github.com/Joska99/joska/blob/main/docker/grafana/diagram.drawio.svg">
</p>

<h2> Steps: </h2>

1.  Create directory for Grafana container data:
```bash
mkdir grafana-data
```
2. Build Docker image:
```bash
docker build -t grafana-container .
```
3. Run Docker container:

-p - run on port<br />
-v - mount grafana-data to container<br />
-d - detach mode<br />
--name - chose container name<br />
--restart=on-failure - automatically restart container<br />
-t - image tag to run<br />

```bash
docker run -p 3000:3000 -v grafana-data:/var/lib/grafana -d --name my-graf --restart=on-failure -t grafana-container
```
4. Connect to localhost:3000

5. login: admin  
- Change password
```bash
docker exec -it my-graf grafana-cli admin reset-admin-password 12345
```

<h2> Save all data to Next time: </h2>

1.  Run to copy data to your local machine:
```bash
docker cp my-graf:/var/lib/grafana grafana-data
docker  cp my-graf:/etc/grafana/grafana.ini .
``` 

<h2>To delete container:</h2>

```Bash
docker kill my-graf
docker rm my-graf
```