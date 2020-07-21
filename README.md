# jenkins-container-docker-builder
Run Jenkins as a Docker container to build docker images using Jenkins Pipeline

## Build the docker image locally 
`docker build -t jenkins-docker:dev .`

## or Build with tools like AWS CodeBuild

## Running jenkins with docker from host:
`docker run --name jenkins-docker -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock jenkins-docker:dev`

## list containers
`docker container ls -a `

## execute a running container for possible editing
`docker container exec -ti <container_id/container_name> /bin/bash` 

