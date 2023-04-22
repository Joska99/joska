
<p align="center">
<h1>Stateful Jenkins Container with AZ, Dcoker, Kubectl</h1>
<img src="https://github.com/Joska99/joska/blob/main/docker/stateful-jenkins/diagram.drawio.svg">
</p>

<h1>Steps:</h1>

1. Run those comands:
```bash
mkdir jenkins_home
sudo service docker start 
docker build -t stateful-jenkins --no-cache .
docker run -p 8000:8080 -p 50000:50000  -v /var/run/docker.sock:/var/run/docker.sock -d --name stf-jenkins --restart=on-failure -t stateful-jenkins
```
2. Connect to localhost:8000 
3. Enter ur login and password


<h2>if it firs time:</h2>

```bash
docker exec -it --user root stf-jenkins bash
cat /var/jenkins_home/secrets/initialAdminPassword
```
1. Enter admin password
2. Create yout username and password, next time you connect to the container by this
3. Install Plugins

<h2>Befor delete do this:</h2>

1. Run to copy data to your localc dir
```bash
docker cp stf-jenkins:/var/jenkins_home .
```