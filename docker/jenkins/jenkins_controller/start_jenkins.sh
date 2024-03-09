# build image
docker build -t jenkins .

# Run container image
# -p - run on port
# -v - attach persistance storage, the user in container must have access to dir
# -t - image tag to run
# -d - detach mode (backgound)
# --name - chose container name
# --restart=on-failure - automatically restart container
docker run \
    -p 80:8080 \ 
    -v /home/joska/jenkins_home:/var/jenkins_home \
    --name jenkins \
    --restart=on-failure \
    -t jenkins/jenkins \
    -d 

#! First time login
# docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword

