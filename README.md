# jenkins-container-docker-builder
Run Jenkins as a Docker container to build docker images using Jenkins Pipeline

## Build the docker image locally 
`docker build -t jenkins-docker:dev .`

## or Build with tools like AWS CodeBuild

`aws codebuild create-project --cli-input-json file://$PROJECT.json --profile $PROFILE --region $REGION`

## Sample $PROJECT.json for AWS CodeBuild project

```
        {
            "name": "jenkins-docker-builder",
            "description": "Jenkins in a container",
            "source": {
                "type": "GITHUB",
                "location": "",
            "artifacts": {
                "type": "NO_ARTIFACTS"
            },
            "environment": {
                "type": "LINUX_CONTAINER",
                "image": "aws/codebuild/standard:3.0",
                "computeType": "BUILD_GENERAL1_SMALL",
                "environmentVariables": [],
                "privilegedMode": true,
                "imagePullCredentialsType": "CODEBUILD"
            },
            "serviceRole": "",
            "encryptionKey": "",
            "tags": [],
            }
        }

```


## Running jenkins with docker from host:

### Remember to map a volume
`docker run --name jenkins-docker -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock jenkins-docker:dev`



## list containers
`docker container ls -a `

## execute a running container for possible editing
`docker container exec -ti <container_id/container_name> /bin/bash` 


## optional - create another user: jenkins2 user in the docker container
`RUN groupadd -r jenkins2 -g 901 && useradd -u 901 -r -g jenkins`

