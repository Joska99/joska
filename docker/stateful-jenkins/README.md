
<p align="center">
<h1>Stateful Jenkins Container with AZ, Dcoker, Kubectl</h1>
<img src="https://github.com/Joska99/joska/blob/main/docker/stateful-jenkins/diagram.drawio.svg">
</p>

<h1>Steps:</h1>

1. Create dir for Jenkins container data:
```bash
mkdir jenkins_home
```
2. Build Socker image:
```Bash
docker build -t stateful-jenkins --no-cache .
```
3. Run docker container:
-p - runn on port
-v - mount docker.socket
-d - detach mode
--name - chose container name
--restart=on-failure - automaticly restart container
-t - image tag to run
```Bash
docker run -p 8000:8080 -p 50000:50000  -v /var/run/docker.sock:/var/run/docker.sock -d --name stf-jenkins --restart=on-failure -t stateful-jenkins
```
2. Connect to localhost:8000 
3. Enter ur login and password


<h2>First time Jenkins log-in:</h2>

1. Connect to Jenkins container:
```bash
docker exec -it --user root stf-jenkins bash
```
2. Run the following command and coppy output:
```Bash
cat /var/jenkins_home/secrets/initialAdminPassword
```
3. Enter the output as a password
5. Create your credentials, next time you connect to the container by them
3. Install all required plugins

<h2>Save all data to Next time:</h2>

1. Run to copy data to your local machine
```bash
docker cp stf-jenkins:/var/jenkins_home .
```