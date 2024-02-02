# build image
docker build -t jenkins .

# Run container image
# -p - run on port
# -d - detach mode (backgound)
# --name - chose container name
# --restart=on-failure - automatically restart container
# -t - image tag to run
# -v - attach persistance storage, the user in container must have access to dir
docker run -p 80:8080 -d -v /home/joska/jenkins_home:/var/jenkins_home --name jenkins --restart=on-failure -t jenkins/jenkins

#! First time login
# docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword

