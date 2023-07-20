<h1>Jenkins Container with Docker</h1>
<p align="center">
<img src="https://github.com/Joska99/joska/blob/main/docker/jenkins/diagram.drawio.svg">
</p>

<h1>Build and Run Container</h1>

1. Create dir for Jenkins container data:
```bash
mkdir jenkins_home
```

2. Build Docker image:
```Bash
docker build -t jenkins  .
```

3. Run Docker container:
- -p - run on port
- -d - detach mode
- --name - chose container name
- --restart=on-failure - automatically restart container
- -t - image tag to run
- -v - mount docker.socket to container
```Bash
docker run -p 8000:8080 -v /var/run/docker.sock:/var/run/docker.sock -d --name jenkins --restart=on-failure -t jenkins
```

4. Connect to localhost:8000 

<h2>First time Jenkins log-in</h2>

1. Connect to Jenkins container:
```bash
docker exec -it --user root jenkins bash
```

2. Run the following command and copy output:
```Bash
cat /var/jenkins_home/secrets/initialAdminPassword
```
3. Enter the output as a password
4. Create your credentials, next time you connect to the container by them
5. Install all required plugins
 
<h2>Save all data to Next time</h2>

1. Run to copy data to your local machine 
```bash
docker cp jenkins:/var/jenkins_home .
```

<h2>To delete:</h2>

```Bash
docker kill jenkins
docker rm jenkins
```