FROM jenkins/jenkins:lts
# as user root
USER root
# creates var for JENKINS_HOME
ENV JENKINS_HOME /var/jenkins_home
# copy the jenkins_home dir from current working directory to container
COPY jenkins_home /var/jenkins_home

# install Docker and reqire -v /var/run/docker.sock:/var/run/docker.sock to mount docker socket
RUN curl -fsSL https://get.docker.com | sh
# install AZ CLI
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash
# install KUBECTL CLI
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
RUN curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl