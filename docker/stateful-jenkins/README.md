
<p align="center">
<h1>Stateful Jenkins Container with plugins</h1>
<img src="https://github.com/Joska99/joska/blob/main/docker/stateful-jenkins/diagram.drawio.svg">
</p>

<h1>Steps:</h1>

1. Run those comands:
```bash
mkdir jenkins_home
docker build -t stateful-jenkins .
docker run -p 8000:8080 -p 50000:50000  -v /var/run/docker.sock:/var/run/docker.sock -d --name stf-jenkins --restart=on-failure -t stateful-jenkins
```
2. Connect to localhost:8000 
3. Enter ur login and password


<h2>if it firs time:</h2>

```bash
docker exec -it --user root <"container id"> bash
cat /ver/jenkins_home/secrets/initialAdminPasswordls
```
1. Enter admin password
2. Create yout username and password, next time you connect to the container by this

<h2>Befor delete do this:</h2>

1. Coppy id of jenkins container
```bash
docker ps
```
2. Run to copy data to your localc dir
```bash
docker cp <"ID">:/var/jenkins_home .
```