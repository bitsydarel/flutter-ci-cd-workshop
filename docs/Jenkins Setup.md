# Flutter CI/CD workshop jenkins setup

## Verify that docker is installed and functional
docker run hello-world

## Create a directory where the jenkins file will be hosted on the host system
## This is required if you don't want to install jenkins from scratch every time you run the docker image
## In this setup we will put the files in the /tmp folder, this folder is cleared on every reboot.

## For unix system
mkdir /tmp/jenkins_home
## For windows 
mkdir %TEMP%\jenkins_home

docker build -t workshop/jenkins <docker file in workshop repo>

## Run jenkins in the docker on port 8080 and share the docker socket
docker run --name jenkins-master -d -p 8080:8080 -p 50000:50000 \
    -v //var/run/docker.sock:/var/run/docker.sock \
    -v /tmp/jenkins_home:/var/jenkins_home workshop/jenkins

## Get the initial admin password
cat jenkins_home/secrets/initialAdminPassword

## Enter the password and next click on Install suggested plugins

## If you want you can get the shell to the jenkins container
docker exec -i -t jenkins-master /bin/bash

## Install jenkins pipeline plugins
Blue Ocean - provides a nice ui for using jenkins pipeline

GitHub Pipeline for Blue Ocean

GitHub Branch Source Plugin

Credentials plugin - provides a centralized way to define credentials that can be used by your Jenkins instance, plugins and build jobs.

Credentials Binding plugin - allows you to configure your build jobs to inject credentials as environment variables.

Plain Credentials plugin - a plugin dependency required by the Credentials Binding plugin.

Github coverage reporter (Use my fork for dart support) -  report coverage on pull request

# jenkins Environment variable usefully for our workshop
CHANGE_ID
GIT_URL

# Pipeline command syntax helper url <jenkins url>/pipeline-syntax/