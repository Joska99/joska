# Jenkins Container with Docker

<p align="center">
<img src="https://github.com/Joska99/joska/blob/main/docker/jenkins/diagram.drawio.svg">
</p>

## Build and Run Container

1. Build Docker image ( in jenkins_controller directory ):

```Bash
docker build -t jenkins  .
```

2. Run Docker container:

- -p - run on port
- -d - detach mode
- --name - chose container name
- --restart=on-failure - automatically restart container
- -t - image tag to run

```Bash
docker run -p 80:8080 \
    --name jenkins \
    --restart=on-failure \
    -t jenkins \
    -d
```

3. Connect to localhost

## First time Jenkins log-in

1. Connect to Jenkins container:

```bash
docker exec -it --user root jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```

2. Enter the output as a password
3. Create your credentials, next time you connect to the container by them
4. Install all required plugins

## To delete:

```Bash
docker kill jenkins
docker rm jenkins
```
