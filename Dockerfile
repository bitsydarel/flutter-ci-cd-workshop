FROM jenkins/jenkins:lts

USER root

RUN apt-get update && apt-get -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

RUN apt-get update && apt-get -y install docker-ce docker-ce-cli containerd.io

RUN echo "jenkins ALL=(ALL) NOPASSWD:ALL" | tee -a /etc/sudoers

RUN usermod -aG docker jenkins

RUN usermod -aG root jenkins

USER jenkins