FROM jenkins
USER root

ENV DEBIAN_FRONTEND="noninteractive"

RUN apt update \
    && apt upgrade -y \
    && apt install -y apt-transport-https ca-certificates curl unzip gnupg-agent jq software-properties-common --no-install-recommends \
    && apt install git=1:2.* -y --no-install-recommends \
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
    && apt-key fingerprint 0EBFCD88 \
    && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
    && apt update \
    && apt install docker-ce docker-ce-cli containerd.io -y \
    && apt clean && apt autoclean

RUN usermod -a -G docker jenkins
USER jenkins # drop back to the regular jenkins user - good practice
