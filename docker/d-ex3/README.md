Docker Conteiner with Jenkins and Docker instaled

<!-- 1.Build Docker image using Dockerfile:
docker build -t jd:1 -->
1.Run Docker container with Jennkins:
``` Bash
docker run -p 8080:8080 -p 50000:50000 -d -v /var/run/docker.sock:/var/run/docker.sock -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts
```
2.Connect to a conainer CLI:
``` Bash
docker exec -it --user root "container id" bash
``` 
3.Download Docker to conatainer:
``` Bash
curl https://get.docker.com/ > dockerinstall && chmod 777 dockerinstall && ./dockerinstall
chmod 666 /var/run/docker.sock
``` 
4.Get Admin password:
``` Bash
cat var/jenkins_home/secrets/initialAdminPasswo
```