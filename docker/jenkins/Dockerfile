FROM jenkins/jenkins:lts
# as user root
USER root
# creates var for JENKINS_HOME
ENV JENKINS_HOME /var/jenkins_home
# copy the jenkins_home dir from current working directory to container
COPY jenkins_home /var/jenkins_home
# install Docker and reqire -v /var/run/docker.sock:/var/run/docker.sock to mount docker socket
RUN curl -fsSL https://get.docker.com | sh
