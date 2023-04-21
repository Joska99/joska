<p align="center">
  <h1>Stateful Jenkins Container with plugins</h1>
</p>

```bash
mkdir jenkins_home
docker build -t stateful-jenkins .
docker run -p 8000:8080 -p 50000:50000  -v /var/run/docker.sock:/var/run/docker.sock -d --restart=on-failure -t stateful-jenkins
```
Connect to localhost:8000 <br />
Enter ur login and password<br />


<h2>Befor delete do this:</h2>

```bash
docker ps
```
Coppy id of jenkins container
Run to copy data to your localc dir
```bash
docker cp <"ID">:/var/jenkins_home .
```

<h2>if it firs time:</h2>

```bash
docker exec -it --user root <"container id"> bash
cat /ver/jenkins_home/secrets/initialAdminPasswordls
```
Enter admin password<br />
Create yout username and password, next time you connect to the container by this<br />